import 'package:http/http.dart' as http;
import 'package:neet_flutter_app/utils/miscellaneous.dart';

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
}

class RestServices {
  RestServices._privateConstructor();
  static final RestServices instance = RestServices._privateConstructor();

  Map<String, String> headers = {'Content-Type' : 'application/json'};

  void showRequestAndResponseLogs(http.Response? response, Map<String, Object> requestData){
    logs('************ Network Logs *************');
    logs('Request code --> ${response?.statusCode} : ${response?.request?.url}');
    logs('Request headers --> $requestData');
    logs('Response headers --> ${response?.headers}');
    logs('Response body --> ${response?.body}');
    logs('****************************************');
  }
  
  
  
}