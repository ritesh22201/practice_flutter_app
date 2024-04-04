import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:neet_flutter_app/controllers/home_page_controller.dart';
import 'package:neet_flutter_app/pages/home/home_page_helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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