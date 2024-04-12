import 'package:get/get.dart';
import 'package:neet_flutter_app/pages/edit_profile_screen/edit_profile.dart';
import 'package:neet_flutter_app/pages/home/home_page.dart';
import 'package:neet_flutter_app/pages/login_screen/login_screen.dart';
import 'package:neet_flutter_app/pages/mock_tests_screen/mock_screen.dart';
import 'package:neet_flutter_app/pages/previous_years_questions_screen/previous_years_questions_screen.dart';
import 'package:neet_flutter_app/pages/profile_screen/profile_screen.dart';
import 'package:neet_flutter_app/pages/signup_screen/signup_screen.dart';
import 'package:neet_flutter_app/pages/splash_screen/splash_screen.dart';
import 'package:neet_flutter_app/routes/route_constants.dart';
import 'package:neet_flutter_app/widgets/no_internet_screen.dart';
import 'package:neet_flutter_app/widgets/success_screen.dart';

class RouteHelper {
  static String getHomePage () => RouteConstants.home;
  static String getSplashScreen () => RouteConstants.splashScreen;
  static String getSignupPage() => RouteConstants.signup;
  static String getLoginPage() => RouteConstants.login;
  static String getNoInternetScreen () => RouteConstants.noInternet;
  static String getPreviousYearQuesScreen () => RouteConstants.previousYearQuesScreen;
  static String getMockTestsScreen () => RouteConstants.mockTestsScreen;
  static String getMyProfileScreen () => RouteConstants.myProfile;
  static String getSuccessScreen() => RouteConstants.successScreen;
  static String getEditProfileScreen() => RouteConstants.editProfile;

  static List<GetPage> routes = [
    GetPage(name: RouteConstants.home, page:() => Home()),
    GetPage(name: RouteConstants.splashScreen, page:() => const SplashScreen()),
    GetPage(name: RouteConstants.signup, page: () => const SignupScreen()),
    GetPage(name: RouteConstants.login, page: () => LoginScreen()),
    GetPage(name: RouteConstants.noInternet, page: () => const NoInternetScreen()),
    GetPage(name: RouteConstants.previousYearQuesScreen, page: () => const PreviousYearQuestionsScreen()),
    GetPage(name: RouteConstants.mockTestsScreen, page: () => const MockTestsScreen()),
    GetPage(name: RouteConstants.myProfile, page: () => ProfileScreen()),
    GetPage(name: RouteConstants.successScreen, page: () => const SuccessScreen()),
    GetPage(name: RouteConstants.editProfile, page: () => const EditProfile())
  ];
}