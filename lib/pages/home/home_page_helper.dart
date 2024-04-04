import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:neet_flutter_app/controllers/home_page_controller.dart';
import 'package:neet_flutter_app/widgets/custom_text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomBarItems extends StatelessWidget {
  BottomBarItems({super.key, required this.index, required this.controller});
  final HomePageController homePageController = Get.find<HomePageController>();

  final int index;
  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (HomePageController homePageController) => GestureDetector(
        onTap: () {
          homePageController.currentIndex = index;
          Get.toNamed(homePageController.pagesName[index]['route'].toString());
          homePageController.update();
        },
        child: Container(
          width: 25.w,
          height: 77.px,
          padding: const EdgeInsets.only(left: 17, right: 17, top: 10),
          color: ColorConstants.appWhite,
          child: Padding(
            padding: EdgeInsets.only(top: index == 1 || index == 3 ? 5 : 0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                      homePageController.pagesName[index]['image'].toString(),
                      width:
                           index == 1 || index == 3
                              ? 25.px : index == 2 ? 40.px
                              : 30.px),
                  SizedBox(height: index == 1 || index == 3 ? 7 : index == 2 ? 0 : 5),
                  AppText(
                    homePageController.pagesName[index]['name'].toString(),
                    fontSize: 11.px,
                    color: homePageController.currentIndex == index
                        ? ColorConstants.appPrimaryColor
                        : ColorConstants.appBlack,
                    fontWeight: homePageController.currentIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                  const SizedBox(height: 3),              
                ],               
              ),
              homePageController.currentIndex == index ? Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                      decoration: const BoxDecoration(
                        color: ColorConstants.appPrimaryColor,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(2), topRight: Radius.circular(2))
                      ),
                      height: 3,
                    ),
              ): const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
