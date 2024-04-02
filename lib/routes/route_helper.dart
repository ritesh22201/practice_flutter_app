import 'package:get/get.dart';
import 'package:neet_flutter_app/pages/home/home_page.dart';
import 'package:neet_flutter_app/pages/mock_tests_screen/mock_screen.dart';
import 'package:neet_flutter_app/pages/previous_years_questions_screen/previous_years_questions_screen.dart';
import 'package:neet_flutter_app/pages/profile_screen/profile_screen.dart';
import 'package:neet_flutter_app/pages/splash_screen/splash_screen.dart';
import 'package:neet_flutter_app/routes/route_constants.dart';
import 'package:neet_flutter_app/widgets/no_internet_screen.dart';

class RouteHelper {
  static String getHomePage () => RouteConstants.home;
  static String getSplashScreen () => RouteConstants.splashScreen;
  static String getNoInternetScreen () => RouteConstants.noInternet;
  static String getPreviousYearQuesScreen () => RouteConstants.previousYearQuesScreen;
  static String getMockTestsScreen () => RouteConstants.mockTestsScreen;
  static String getMyProfileScreen () => RouteConstants.myProfile;

  static List<GetPage> routes = [
    GetPage(name: RouteConstants.home, page:() => Home()),
    GetPage(name: RouteConstants.splashScreen, page:() => const SplashScreen()),
    GetPage(name: RouteConstants.noInternet, page: () => const NoInternetScreen()),
    GetPage(name: RouteConstants.previousYearQuesScreen, page: () => const PreviousYearQuestionsScreen()),
    GetPage(name: RouteConstants.mockTestsScreen, page: () => const MockTestsScreen()),
    GetPage(name: RouteConstants.myProfile, page: () => const ProfileScreen()),
  ];
}