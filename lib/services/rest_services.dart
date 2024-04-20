import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:neet_flutter_app/config/app_config.dart';
import 'package:neet_flutter_app/utils/miscellaneous.dart';
import 'package:neet_flutter_app/utils/shared_preferences.dart';
import 'package:neet_flutter_app/utils/string_extensions.dart';

class RestConstants {
  RestConstants._privateConstructor();
  static final RestConstants instance = RestConstants._privateConstructor();

  //================================= API Service ====================================

  final String userService = 'user-service';

  //================================= API Endpoints ==================================

  final String registerUser = 'v1/register';
  final String loginUser = 'v1/login';
  final String editProfile = 'v1/edit-profile';
  final String deleteProfile = 'v1/delete-profile';
  final String deleteProfileVerifyOtp = 'v1/delete-profile/verify-otp';
  final String forgetPassword = 'v1/forget-password';
  final String forgetPasswordVerifyOtp = 'v1/forget-password/verify-otp';
  final String userProfile = 'v1/user';
  final String googleAuthUser = 'auth/user';
}

class RestServices {
  RestServices._privateConstructor();
  static final RestServices instance = RestServices._privateConstructor();

  void showRequestAndResponseLogs(http.Response? response, Map<String, Object> requestData){
    logs('************ Network Logs *************');
    logs('Request code --> ${response?.statusCode} : ${response?.request?.url}');
    logs('Request headers --> $requestData');
    logs('Response headers --> ${response?.headers}');
    logs('Response body --> ${response?.body}');
    logs('****************************************');
  }
  
  
  Future<String?>? getRestCall({required String? endpoint, String? addOns, bool guestToken = false}) async{
    String? responseData;

    bool connected = await InternetConnectionChecker().hasConnection;
    if(!connected){
      return responseData;
    }

    String? authenticationToken = await getStringPrefValue(userToken);

    try{
      String requestURL = addOns != null ? '${AppConfig.appBaseURL}/$endpoint$addOns' : '${AppConfig.appBaseURL}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestURL);

      Map<String, String> header = !guestToken ? {'Content-Type' : 'application/json', 'Authorization' : authenticationToken.toString()} : {'Content-Type' : 'application/json'};

      http.Response response = await http.get(requestedUri!, headers: header);
      showRequestAndResponseLogs(response, header);

      switch(response.statusCode){
        case 200:
        case 201:
        case 400:
        case 422:
          responseData = response.body;
          break;
        case 404:
        case 500:
        case 502:
          logs('${response.statusCode}');
          break;
        case 401:
          logs('401 : ${response.body}');
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;       
      }
    } on PlatformException catch(e){
      logs('PlatformException in getRestCall ---> ${e.message}');
    }
    return responseData;
  }


  Future<Uint8List?>? getUint8ListRestCall({required String? endpoint, String? addOns, bool guestToken = false}) async {
    Uint8List? responseData;
    bool connected = await InternetConnectionChecker().hasConnection;
    if(!connected){
      return responseData;
    }

    String? authenticationToken = await getStringPrefValue(userToken);

    try{
      String requestURL = addOns != null ? '${AppConfig.appBaseURL}/$endpoint$addOns' : '${AppConfig.appBaseURL}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestURL);

      Map<String, String> header = !guestToken ? {'Content-Type' : 'application/json', 'Authorization' : authenticationToken.toString()} : {'Content-Type' : 'application/json'};
      http.Response response = await http.get(requestedUri!, headers: header);

      showRequestAndResponseLogs(response, header);

      switch(response.statusCode){
        case 200:
        case 201:
        case 400:
        case 422:
          responseData = response.bodyBytes;
          break;
        case 404:
        case 500:
        case 502:
          logs('${response.statusCode}');
          break;
        case 401:
          logs('401 : ${response.body}');
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;       
      }

    } on PlatformException catch (e){
      logs('PlatformException in getUint8ListRestCall --> ${e.message}');
    }
    return responseData;
  }


  Future<String?>? postRestCall({required String? endpoint, required Map<String, dynamic>? body, String? addOns, String? stringBody, bool guestToken = false, bool show400Toast = true}) async {
    String? responseData;
    bool connected = await InternetConnectionChecker().hasConnection;
    if(!connected){
      return responseData;
    }

    String? authenticationToken = await getStringPrefValue(userToken);

    try{
      String requestURL = addOns != null ? '${AppConfig.appBaseURL}/$endpoint$addOns' : '${AppConfig.appBaseURL}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestURL);

      Map<String, String> headers = !guestToken ? {'Content-Type' : 'application/json', 'Authorization' : authenticationToken.toString()} : {'Content-Type' : 'application/json'};
      if(stringBody != null){
        logs('String body --> $stringBody');
        headers['Content-Type'] = 'text/plain';
      }

      http.Response response = await http.post(requestedUri!, body: stringBody ?? jsonEncode(body), headers: headers );

      showRequestAndResponseLogs(response, headers);

      switch(response.statusCode){
        case 200:
        case 500:
        case 201:
        case 401:
          responseData = response.body;
          break;
        case 400:
          Map<String, dynamic> responseMap = jsonDecode(response.body);
          if(responseMap.isNotEmpty && responseMap.containsKey('message')){
            if(show400Toast) responseMap['message'].toString().showError();
          }
          if(!show400Toast) responseData = response.body;
          break;
        case 502:
        case 404:
          logs('${response.statusCode}');
          break;
        case 403:
          Map<String, dynamic> responseMap = jsonDecode(response.body);
          if(responseMap.isNotEmpty && responseMap.containsKey('message')){
            if(show400Toast) responseMap['message'].toString().showError();
          }
          if(!show400Toast) responseData = response.body;
          logs('${response.statusCode}');
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;       
      }

    } on PlatformException catch (e){
      logs('PlatformException in postRestCall --> ${e.message}');
    }
    return responseData;
  }

  Future<Uint8List?>? postUint8ListRestCall({required String? endpoint, required Map<String, dynamic> body, String? addOns, String? stringBody, bool guestToken = false, bool show400Toast = false}) async {
    Uint8List? responseData;
    bool connected = await InternetConnectionChecker().hasConnection;
    if(!connected){
      return responseData;
    }

    String? authenticationToken = await getStringPrefValue(userToken);

    try {
      String requestURL = addOns != null ? '${AppConfig.appBaseURL}/$endpoint$addOns' : '${AppConfig.appBaseURL}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestURL);

      Map<String, String> headers = !guestToken ? {'Content-Type' : 'application/json', 'Authorization' : authenticationToken.toString()} : {'Content-Type' : 'application/json'};
      if(stringBody != null){
        logs('String Body --> $stringBody');
        headers['Content-Type'] = 'text/plain';
      }

      http.Response response = await http.post(requestedUri!, body: stringBody ?? jsonEncode(body), headers: headers);
      showRequestAndResponseLogs(response, headers);
      
      switch(response.statusCode){
        case 200:
        case 500:
        case 201:
        case 401:
          responseData = response.bodyBytes;
          break;
        case 400:
          Map<String, dynamic> responseMap = jsonDecode(response.body);
          if(responseMap.isNotEmpty && responseMap.containsKey('message')){
            if(show400Toast) responseMap['message'].toString().showError();
          }
          if(!show400Toast) responseData = response.bodyBytes;
          break;
        case 502:
        case 404:
          logs('${response.statusCode}');
          break;
        case 403:
          Map<String, dynamic> responseMap = jsonDecode(response.body);
          if(responseMap.isNotEmpty && responseMap.containsKey('message')){
            if(show400Toast) responseMap['message'].toString().showError();
          }
          if(!show400Toast) responseData = response.bodyBytes;
          logs('${response.statusCode}');
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;       
      }
    } on PlatformException catch(e){
      logs('PlatformException in postUint8ListRestCall --> ${e.message}');
    }
    return responseData;
  }

  Future<String?>? deleteRestCall({required String? endpoint, Map<String, dynamic>? body, String? addOns}) async {
    String? responseData;
    bool connected = await InternetConnectionChecker().hasConnection;
    if(!connected){
      return responseData;
    }

    String? authenticationToken = await getStringPrefValue(userToken);

    try{
      String requestURL = addOns != null ? '${AppConfig.appBaseURL}/$endpoint$addOns' : '${AppConfig.appBaseURL}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestURL);

      Map<String, String> headers = {'Content-Type' : 'application/json', 'Authorization' : authenticationToken.toString()};
      http.Response response = await http.delete(requestedUri!, headers: headers, body: body);

      showRequestAndResponseLogs(response, headers);

      switch(response.statusCode){
        case 200:
        case 422:
        case 201:
          responseData = response.body;
          break;
        case 500:
        case 502:
        case 400:
        case 404:
          logs('${response.statusCode}');
          break;
        case 401:
          logs('401: ${response.statusCode}');
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;       
      }
    } on PlatformException catch(e) {
      logs('PlatformException in deleteRestCall --> ${e.message}');
    }
    return responseData;
  }

  Future<String?>? putRestCall({required String? endpoint, Map<String, dynamic>? body, String? addOns, bool show400Toast = true}) async {
    String? responseData;
    bool connected = await InternetConnectionChecker().hasConnection;
    if(!connected){
      return responseData;
    }

    String? authenticationToken = await getStringPrefValue(userToken);

    try{
      String requestURL = addOns != null ? '${AppConfig.appBaseURL}/$endpoint$addOns' : '${AppConfig.appBaseURL}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestURL);

      Map<String, String> headers = {'Content-Type' : 'application/json', 'Authorization' : authenticationToken.toString()};
      http.Response response = await http.put(requestedUri!, headers: headers, body: jsonEncode(body));
      showRequestAndResponseLogs(response, headers);

      switch(response.statusCode){
        case 200:
        case 201:
        case 400:
        case 422:
          responseData = response.body;
          break;
        case 404:
        case 500:
        case 502:
          logs('${response.statusCode}');
          break;
        case 401:
          logs('401: ${response.statusCode}');
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;       
      }
    } on PlatformException catch(e) {
      logs('PlatformException in putRestCall --> ${e.message}');
    }
    return responseData;
  }
}