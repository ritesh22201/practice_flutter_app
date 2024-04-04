import 'package:get/get.dart';
import 'package:neet_flutter_app/constants/neet_assets.dart';
import 'package:neet_flutter_app/routes/route_constants.dart';
import 'package:neet_flutter_app/routes/route_helper.dart';

class HomePageController extends GetxController {
  int currentIndex = 0;
  List<String> homeCarouselImgs = [
    NeetAssets.homeCarousel1,
    NeetAssets.homeCarousel2,
    NeetAssets.homeCarousel3,
    NeetAssets.homeCarousel4,
  ];

  void updateIndex(int ind) {
    currentIndex = ind;
    update();
  }

  RxList<Map<String, String>> pagesName = <Map<String, String>>[
    {'image': NeetAssets.homeIconAnimation, 'name': 'home', 'route' : RouteHelper.getHomePage()},
    {'image': NeetAssets.pastYearAnimation, 'name': 'PYQ', 'route': RouteHelper.getPreviousYearQuesScreen()},
    {'image': NeetAssets.mockIconAnimation, 'name': 'mock', 'route': RouteHelper.getMockTestsScreen()},
    {'image': NeetAssets.profileIconAnimation, 'name': 'my profile', 'route': RouteHelper.getMyProfileScreen()},
  ].obs;

  RxList<Map<String, String>> categoryList = [
    {'image': NeetAssets.pastYearAnimation, 'name': 'Previous years questions', 'subname' : 'NEET previous years questions with tests series and practice sets.', 'route' : RouteHelper.getPreviousYearQuesScreen()},
    {'image': NeetAssets.mockIconAnimation, 'name': 'Mock tests', 'subname': 'Explore premium mock tests content everyday just for ₹1.', 'route' : RouteHelper.getMockTestsScreen()},
    {'image': NeetAssets.testAnimation, 'name': 'Attempted tests', 'subname': 'See your attempted tests histories with highlighted scores.', 'route' : ''},
    {'image': NeetAssets.syllabusAnimation, 'name': 'Syllabus', 'subname' : 'A well organized chapter-wise syllabus for NEET aspirants.', 'route' : ''},
    {'image': NeetAssets.bookmarkAnimation, 'name': 'Bookmarked questions', 'subname': 'Save/Bookmark your favourite questions for later interaction.', 'route' : ''}
  ].obs;


  List<int> homeCategoryName = [0, 1, 2, 3];
}
