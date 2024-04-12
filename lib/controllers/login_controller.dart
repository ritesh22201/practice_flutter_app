import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neet_flutter_app/generated/l10n.dart';
import 'package:neet_flutter_app/services/rest_services.dart';
import 'package:neet_flutter_app/utils/shared_preferences.dart';
import 'package:neet_flutter_app/utils/string_extensions.dart';
import 'package:neet_flutter_app/utils/validation_utils.dart';
import 'package:neet_flutter_app/widgets/success_screen.dart';

class LoginController extends GetxController{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = false.obs;

  void togglePassword () {
    isPasswordVisible.value = !isPasswordVisible.value;
    update();
  }

  void validateLoginForm(BuildContext context){
    if(ValidationUtils.validateEmptyController(emailController)){
      emailError = 'please ${S.of(context).emailHintText}'.obs;
    }
    else if(!ValidationUtils.regexValidator(emailController, ValidationUtils.emailRegExp)){
      emailError = S.of(context).validEmailText.obs;
    }
    else{
      emailError = ''.obs;
    }

    if(ValidationUtils.validateEmptyController(passwordController)){
      passwordError = 'please ${S.of(context).passwordText}'.obs;
    }
    else {
      passwordError = ''.obs;
    }

    update();

    if(emailError.value.isEmpty && passwordError.value.isEmpty){
      loginUser(context);
    }
  }

  Future<void> loginUser(BuildContext context) async {
    try {
      isLoading.value = true;
      update();
      
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      Map<String, dynamic> bodyMap = {
        'email' : email,
        'password' : password
      };

      final response = await RestServices.instance.postRestCall(endpoint: '${RestConstants.instance.userService}/${RestConstants.instance.loginUser}', body: bodyMap, guestToken: true);
      if(response != null && response.isNotEmpty){
        Map<String, dynamic> responseMap = jsonDecode(response);
        if(responseMap.containsKey('error') && !responseMap['error']){
          if(responseMap.containsKey('user') && responseMap['user'] != null){
            await setPrefStringValue('userToken', responseMap['token']);
            await setPrefStringValue('userId', responseMap['user']['_id']);
            await setPrefStringValue('userEmail', responseMap['user']['email']);
          }
          Get.to(SuccessScreen(textMessage: responseMap['message']));
        }
        else {
          responseMap['message'].toString().showError();
        }
      }
    } on SocketException catch (e) {
      e.message.showError();
    }
    finally{
      isLoading.value = false;
    }
    update();
  }

}