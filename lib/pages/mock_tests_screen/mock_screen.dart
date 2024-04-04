import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:neet_flutter_app/controllers/home_page_controller.dart';
import 'package:neet_flutter_app/pages/home/home_page_helper.dart';
import 'package:neet_flutter_app/widgets/custom_app_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MockTestsScreen extends StatelessWidget {
  const MockTestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.px),
        child: MyAppBar(
          appBarHeight: 65.px,
          appBarColor: ColorConstants.appPrimaryColor,
          textColor: ColorConstants.appWhite,
          appBarTitle: 'Mock tests',
        ),
      ),
      body: Container(),
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
    );
  }
}
