import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neet_flutter_app/models/user_model.dart';
import 'package:neet_flutter_app/services/rest_services.dart';
import 'package:neet_flutter_app/utils/miscellaneous.dart';
import 'package:neet_flutter_app/utils/shared_preferences.dart';
import 'package:neet_flutter_app/utils/string_extensions.dart';


class UserProfileController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String choosenGender = '';
  List<String> genders = ['Male', 'Female', 'Other'];
  List<bool>? boolList;
  RxBool isLoading = false.obs;
  UserModel? user;

  @override
  void onInit() {
    super.onInit();
    boolList = List.filled(genders.length, false);
    update();
  }

  Future<void> getUserData ({ required String id }) async {
    try{
      isLoading.value = true;
      update();
      final response = await RestServices.instance.getRestCall(endpoint: '${RestConstants.instance.userService}/${RestConstants.instance.userProfile}/', addOns: id);

      if(response != null && response.isNotEmpty) {
        Map<String, dynamic> responseMap = jsonDecode(response);
        if(responseMap.containsKey('error') && !responseMap['error']) {
          user = UserModel.fromJson(responseMap['user']);
        }
        else{
          responseMap['message'].toString().showError();
        }
      }
    } on SocketException catch(e){
      e.message.showError();
    }
    finally{
      isLoading.value = false;
      update();
    }
  }

  Future<void> editUserProfile({ required String userId }) async {
    try{
      isLoading.value = true;
      update();

      String name = nameController.text.trim();
      String phone = phoneController.text.trim();

      final Map<String, dynamic> bodyMap = {};

      if(name.isNotEmpty && name != user?.name){
        bodyMap['name'] = name;
      }

      if(phone.isNotEmpty && phone != user?.phone){
        bodyMap['phone'] = phone;
      }

      if(choosenGender != user?.gender){
        bodyMap['gender'] = choosenGender;
      }

      if(bodyMap['name'] == null && bodyMap['phone'] == null && bodyMap['gender'] == null){
        'please fill all the required fields'.showError();
        return;
      }
      final response = await RestServices.instance.putRestCall(endpoint: '${RestConstants.instance.userService}/${RestConstants.instance.editProfile}/$userId', body: bodyMap);

      if(response != null && response.isNotEmpty){
        Map<String, dynamic> responseMap = jsonDecode(response);
        if(responseMap.containsKey('error') && !responseMap['error']){
          responseMap['message'].toString().showSuccess();
          getUserData(id: userId.toString().trim());
          Get.back();
        }
        else{
          responseMap['message'].toString().showError();
        }
      }
    }on SocketException catch(e) {
      e.message.showError();
    }
    finally{
      isLoading.value = false;
      update();
    }
  }
}