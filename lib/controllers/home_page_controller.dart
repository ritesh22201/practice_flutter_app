import 'package:get/get.dart';
import 'package:neet_flutter_app/constants/neet_assets.dart';
import 'package:neet_flutter_app/routes/route_constants.dart';

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
    {'image': NeetAssets.homeIconAnimation, 'name': 'home', 'route' : RouteConstants.home},
    {'image': NeetAssets.pastYearAnimation, 'name': 'PYQ', 'route': RouteConstants.previousYearQuesScreen},
    {'image': NeetAssets.mockIconAnimation, 'name': 'mock', 'route': RouteConstants.mockTestsScreen},
    {'image': NeetAssets.profileIconAnimation, 'name': 'my profile', 'route': RouteConstants.myProfile},
  ].obs;


  List<int> homeCategoryName = [0, 1, 2, 3];
}
