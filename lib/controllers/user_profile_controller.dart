import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:neet_flutter_app/models/user_model.dart';
import 'package:neet_flutter_app/services/rest_services.dart';
import 'package:neet_flutter_app/utils/string_extensions.dart';


class UserProfileController extends GetxController {
  RxBool isLoading = false.obs;
  UserModel? user;


  Future<void> getUserData ({required String id, required String token}) async {
    try{
      isLoading.value = true;
      update();
      final response = await RestServices.instance.getRestCall(endpoint: '${RestConstants.instance.userService}/${RestConstants.instance.userProfile}/', addOns: id);

      if(response != null && response.isNotEmpty) {
        Map<String, dynamic> responseMap = jsonDecode(response);
        if(responseMap.containsKey('error') && !responseMap['error']) {
          user = UserModel.fromJson(responseMap['user']);
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
}