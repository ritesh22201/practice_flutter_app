import 'package:get/get.dart';
import 'package:neet_flutter_app/constants/neet_assets.dart';

class HomePageController extends GetxController {
  List<String> homeCarouselImgs = [
    NeetAssets.homeCarousel1,
    NeetAssets.homeCarousel2,
    NeetAssets.homeCarousel3,
    NeetAssets.homeCarousel4,
  ];

  List<int> homeCategoryName = [0, 1, 2, 3];
}
