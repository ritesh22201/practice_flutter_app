import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:neet_flutter_app/config/app_config.dart';
import 'package:neet_flutter_app/generated/l10n.dart';
import 'package:neet_flutter_app/routes/route_helper.dart';
import 'package:neet_flutter_app/services/rest_services.dart';
import 'package:neet_flutter_app/utils/miscellaneous.dart';
import 'package:neet_flutter_app/utils/shared_preferences.dart';
import 'package:neet_flutter_app/utils/string_extensions.dart';
import 'package:neet_flutter_app/utils/validation_utils.dart';
import 'package:neet_flutter_app/widgets/success_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class SignupController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  RxString fullNameError = ''.obs;
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  RxString phoneNumberError = ''.obs;
  RxString confirmPasswordError = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  void togglePassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
    update();
  }

  void toggleConfirmPassword() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
    update();
  }


  void validateSignupForm(BuildContext context) {
    if(ValidationUtils.validateEmptyController(fullNameController)) {
      fullNameError = S.of(context).fullNameValidationText.obs;
    }
    else{
      fullNameError = ''.obs;
    }

    if(ValidationUtils.validateEmptyController(emailController)) {
      emailError = 'please ${S.of(context).emailHintText}'.obs;
    }
    else if(!ValidationUtils.regexValidator(emailController, ValidationUtils.emailRegExp)) {
      emailError = S.of(context).validEmailText.obs;
    }
    else{
      emailError = ''.obs;
    }

    if(phoneController.text.isNotEmpty && !ValidationUtils.lengthValidator(phoneController, 10)){
      phoneNumberError = S.of(context).phoneValidationText.obs;
    }
    else {
      phoneNumberError = ''.obs;
    }
    
    if(ValidationUtils.validateEmptyController(passwordController)){
      passwordError = 'please ${S.of(context).passwordText}'.obs;
    }
    else {
      passwordError = ''.obs;
    }

    if(ValidationUtils.validateEmptyController(confirmPasswordController)){
      confirmPasswordError = 'please ${S.of(context).confirmPassword}'.obs;
    }
    else {
      confirmPasswordError = ''.obs;
    }

    if(ValidationUtils.compareValidator(passwordController, confirmPasswordController)) {
      passwordError = S.of(context).validPassword.obs;
    }
    else {
      passwordError = ''.obs;
    }

    update();

    if(fullNameError.value.isEmpty && emailError.value.isEmpty && passwordError.value.isEmpty && confirmPasswordError.value.isEmpty && phoneNumberError.value.isEmpty) {
      registerUser(context);
    }
  }


  Future<void> registerUser(BuildContext context) async {
    try{
      isLoading = true.obs;
      String fullname = fullNameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String phone = phoneController.text.trim().isNotEmpty ? phoneController.text.trim() : '';

      Map<String, dynamic> bodyMap = {
        'name' : fullname,
        'email' : email,
        'password' : password,
      };

      if(phone.isNotEmpty){
        bodyMap['phone'] = phone;
      }

      final response = await RestServices.instance.postRestCall(endpoint: '${RestConstants.instance.userService}/${RestConstants.instance.registerUser}', body: bodyMap, guestToken: true);
      if(response != null && response.isNotEmpty) {
        Map<String, dynamic> responseMap = jsonDecode(response);
        if(responseMap.containsKey('error') && !responseMap['error']){
          if(responseMap.containsKey('user') && responseMap['user'] != null){
            await setPrefStringValue('userToken', responseMap['token']);
            await setPrefStringValue('userId', responseMap['user']['_id']);
            await setPrefStringValue('userEmail', responseMap['user']['email']);
          }
          Get.to(SuccessScreen(textMessage: responseMap['message']));
        }
        else{
          responseMap['message'].toString().showError();
        }
      }

    } on SocketException catch(e) {
      e.message.showError();
    }
    finally {
      isLoading = false.obs;
    }
    update();
  }

  Future<void> registerWithGoogle () async {
    try{
      isLoading = true.obs;
      update();
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if(googleUser != null){
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final String accessToken = googleAuth.accessToken!;
        final String email = googleUser.email;
        final String displayName = googleUser.displayName!;
        final String googleId = googleUser.id;

        await _registerGoogleUser(accessToken, email, displayName, googleId);
      }
      else{
        'User not found!'.showError();
      }

    } on SocketException catch (e) {
      e.message.showError();
    }
    finally{
      isLoading = false.obs;
    }
    update();
  }

  Future<void> _registerGoogleUser(String accessToken, String email, String displayName, String googleId) async {
    try{
      logs('Google user --> ${'{userId: $googleId, name : $displayName, email : $email, token : $accessToken}'}');

      final url = '${AppConfig.appBaseURL}/${RestConstants.instance.googleAuthUser}?googleId=$googleId&name=$displayName&email=$email';

      if(await canLaunchUrl(Uri.parse(url)) && accessToken.isNotEmpty){
        await launchUrl(Uri.parse(url)).then((value) async {
           await setPrefStringValue('userToken', accessToken);
           await setPrefStringValue('userId', googleId);
           await setPrefStringValue('userEmail', email);
           Get.to(const SuccessScreen(textMessage: 'User registered successfully'));
        });
      }
      else{
        final response = await RestServices.instance.getRestCall(endpoint: RestConstants.instance.googleAuthUser, addOns: '?googleId=$googleId&name=$displayName&email=$email');
          if(response != null && response.isNotEmpty){
            Map<String, dynamic> responseMap = jsonDecode(response);
            if(responseMap.containsKey('error') && !responseMap['error']){
              if(responseMap.containsKey('user') && responseMap['user'] != null){
                await setPrefStringValue('userToken', responseMap['token']);
                await setPrefStringValue('userId', responseMap['user']['googleId']);
                await setPrefStringValue('userEmail', responseMap['user']['email']);
              }
              Get.to(SuccessScreen(textMessage: responseMap['message']));
            }
            else {
              responseMap['message'].toString().showError();
            }
          }
      }
    } on SocketException catch (e) {
      e.message.showError();
    }
    finally{
      isLoading = false.obs;
    }
    update();
  }
}