import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:neet_flutter_app/constants/neet_assets.dart';
import 'package:neet_flutter_app/controllers/home_page_controller.dart';
import 'package:neet_flutter_app/controllers/user_profile_controller.dart';
import 'package:neet_flutter_app/pages/home/home_page_helper.dart';
import 'package:neet_flutter_app/routes/route_helper.dart';
import 'package:neet_flutter_app/utils/miscellaneous.dart';
import 'package:neet_flutter_app/utils/shared_preferences.dart';
import 'package:neet_flutter_app/widgets/app_loader.dart';
import 'package:neet_flutter_app/widgets/avatar_image.dart';
import 'package:neet_flutter_app/widgets/custom_app_bar.dart';
import 'package:neet_flutter_app/widgets/custom_text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final UserProfileController profileController =
      Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    logs('Hello --> ${profileController.isLoading.value}');
    return GetBuilder<UserProfileController>(
      init: UserProfileController(),
      initState: (state) {
        Future.delayed(const Duration(microseconds: 200), () async {
          String? id = await getStringPrefValue(userId);
          await profileController.getUserData(
              id: id.toString());
        });
      },
      builder: (UserProfileController controller) => Scaffold(
        appBar: controller.isLoading.value ? const PreferredSize(preferredSize: Size.fromHeight(0), child: SizedBox()) : PreferredSize(
            preferredSize: Size.fromHeight(75.px),
            child: SafeArea(
                child: MyAppBar(
              appBarColor: ColorConstants.lightGrey,
              appBarTitle: '',
              appBarHeight: 75.px,
            ))),
        body: SafeArea(
            child: controller.isLoading.value
                ? const AppLoader()
                : SingleChildScrollView(
                  child: Container(
                      alignment: Alignment.topCenter,
                      width: Device.width,
                      color: ColorConstants.lightGrey,
                      child: Column(
                        children: [
                          SizedBox(height: 10.px),
                          AvatarImage(userName: controller.user?.name.toString() ?? ''),
                          SizedBox(height: 20.px),
                          AppText(controller.user?.name.toString() ?? '',
                              fontSize: 22.px, fontWeight: FontWeight.w500),
                          SizedBox(height: 5.px),
                          AppText(
                              'learning since ${profileDateFormatter(controller.user!.createdAt.toString())}'),
                          SizedBox(height: 15.px),
                          OutlinedButton(
                              onPressed: () {
                                Get.toNamed(RouteHelper.getEditProfileScreen());
                              },
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: ColorConstants.lightGrey,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 60),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                      const IconData(0xe21a,
                                          fontFamily: 'MaterialIcons'),
                                      size: 18.px),
                                  SizedBox(width: 6.px),
                                  AppText('Edit profile')
                                ],
                              )),
                          SizedBox(height: 45.px),
                          Container(
                            alignment: Alignment.center,
                            color: ColorConstants.appWhite,
                            padding: EdgeInsets.symmetric(
                                vertical: 18.px, horizontal: 15.px),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        AppText('Attempted tests',
                                            fontSize: 14.px),
                                        AppText('10',
                                            fontSize: 25.px,
                                            fontWeight: FontWeight.w500)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        AppText('Saved questions',
                                            fontSize: 14.px),
                                        AppText('8',
                                            fontSize: 25.px,
                                            fontWeight: FontWeight.w500)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        AppText('Summary', fontSize: 14.px),
                                        AppText('5%',
                                            fontSize: 25.px,
                                            fontWeight: FontWeight.w500)
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 45.px),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Icon(Icons.donut_large_rounded,
                                          size: 24.px,
                                          color: ColorConstants.appGrey),
                                      SizedBox(width: 15.px),
                                      AppText('Summary page',
                                          fontSize: 18.px,
                                          fontWeight: FontWeight.w500,
                                          color: ColorConstants.appBlue),
                                    ]),
                                    Icon(
                                      Icons.arrow_right_rounded,
                                      size: 30.px,
                                      color: ColorConstants.appGrey,
                                    )
                                  ],
                                ),
                                SizedBox(height: 40.px),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Icon(Icons.password_rounded,
                                          size: 24.px,
                                          color: ColorConstants.appGrey),
                                      SizedBox(width: 15.px),
                                      AppText('Change password',
                                          fontSize: 18.px,
                                          fontWeight: FontWeight.w500,
                                          color: ColorConstants.appBlue),
                                    ]),
                                    Icon(
                                      Icons.arrow_right_rounded,
                                      size: 30.px,
                                      color: ColorConstants.appGrey,
                                    )
                                  ],
                                ),
                                SizedBox(height: 40.px),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Icon(Icons.policy_rounded,
                                          size: 24.px,
                                          color: ColorConstants.appGrey),
                                      SizedBox(width: 15.px),
                                      AppText('Our privacy & policy',
                                          fontSize: 18.px,
                                          fontWeight: FontWeight.w500,
                                          color: ColorConstants.appBlue),
                                    ]),
                                    Icon(
                                      Icons.arrow_right_rounded,
                                      size: 30.px,
                                      color: ColorConstants.appGrey,
                                    )
                                  ],
                                ),
                                SizedBox(height: 40.px),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.px),
                                  child: OutlinedButton(
                                      onPressed: () async {
                                        await clearPref();
                                      },
                                      style: OutlinedButton.styleFrom(
                                          foregroundColor: ColorConstants.appTomatoRed,
                                          backgroundColor: ColorConstants.lightGrey,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 60),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                              Icons.logout_rounded,
                                              size: 18.px),
                                          SizedBox(width: 20.px),
                                          AppText('Sign out')
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                )),
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
