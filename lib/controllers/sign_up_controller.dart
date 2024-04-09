import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neet_flutter_app/config/app_config.dart';
import 'package:neet_flutter_app/generated/l10n.dart';
import 'package:neet_flutter_app/routes/route_helper.dart';
import 'package:neet_flutter_app/services/rest_services.dart';
import 'package:neet_flutter_app/utils/miscellaneous.dart';
import 'package:neet_flutter_app/utils/shared_preferences.dart';
import 'package:neet_flutter_app/utils/string_extensions.dart';
import 'package:neet_flutter_app/utils/validation_utils.dart';

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

    if(ValidationUtils.compareValidator(passwordController, confirmPasswordController)) {
      passwordError = S.of(context).validPassword.obs;
    }
    else {
      passwordError = ''.obs;
    }

    update();

    if(fullNameError.value.isEmpty && emailError.value.isEmpty && passwordError.value.isEmpty && phoneNumberError.value.isEmpty) {
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
          responseMap['message'].toString().showSuccess();
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
}