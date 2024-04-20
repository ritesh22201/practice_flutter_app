import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:neet_flutter_app/controllers/home_page_controller.dart';
import 'package:neet_flutter_app/controllers/user_profile_controller.dart';
import 'package:neet_flutter_app/pages/home/home_page_helper.dart';
import 'package:neet_flutter_app/widgets/custom_text_widget.dart';
import 'package:neet_flutter_app/widgets/home_app_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final UserProfileController userProfileController = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (HomePageController homePageController) => Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(100.w, 85.px), child: HomeAppBar()),
        body: SingleChildScrollView(
          child: Container(
            color: ColorConstants.lightGrey,
            padding: EdgeInsets.symmetric(horizontal: 13.px),
            child: Column(
              children: [
                SizedBox(
                  height: 20.sp,
                ),
                CarouselSlider(
                    items: homePageController.homeCarouselImgs
                        .map((item) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.px),
                              child: Image.asset(
                                item,
                                fit: BoxFit.cover,
                                width: 100.w,
                              ),
                            ))
                        .toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.0,
                    )),
                SizedBox(
                  height: 30.px,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: homePageController.categoryList.length,
                  itemBuilder: (context, index) {
                    var item = homePageController.categoryList[index];
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {                
                            Get.toNamed(homePageController.categoryList[index]['route'].toString());
                          },
                          child: Container(
                            height: 85.px,
                            decoration: BoxDecoration(
                                color: ColorConstants.appWhite,
                                borderRadius: BorderRadius.circular(8.px),
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorConstants.appGrey
                                          .withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: const Offset(0, 1))
                                ]),
                            padding: EdgeInsets.all(10.px),
                            child: Row(
                              children: [
                                Padding(
                                  padding: index == 0
                                      ? EdgeInsets.only(left: 9.px) :
                                        index == 2 ? EdgeInsets.only(left: 3.px) :
                                        index == 3 ? EdgeInsets.only(left: 4.px)
                                      : EdgeInsets.zero,
                                  child: Lottie.asset(
                                    item['image'].toString(),
                                    width: index == 0 ? 36.px : index == 3
                                        ? 40.px : index == 2 ? 43.px
                                        : 50.px,
                                  ),
                                ),
                                SizedBox(
                                  width: index == 0 ? 23.px : index == 1 ? 21.px : index == 2 ? 23.px : index == 3 ? 24.px : 17.px,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: index == 0 ? 4.px : 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        item['name'].toString(),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.px,
                                      ),
                                      // SizedBox(height: 5.px,),
                                      SizedBox(
                                        width: 65.w,
                                        child: AppText(
                                          item['subname'].toString(),
                                          color: ColorConstants.appGrey,
                                          fontSize: 12.px,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.px,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: GetBuilder<HomePageController>(
          init: HomePageController(),
          builder: (HomePageController controller) {
            return SafeArea(
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: ColorConstants.appGrey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1))
                ]),
                child: Row(
                  children: List.generate(
                    controller.pagesName.length,
                    (index) =>
                        BottomBarItems(index: index, controller: controller),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
