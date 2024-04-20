import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:neet_flutter_app/controllers/user_profile_controller.dart';
import 'package:neet_flutter_app/routes/route_helper.dart';
import 'package:neet_flutter_app/utils/shared_preferences.dart';
import 'package:neet_flutter_app/widgets/avatar_image.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({super.key});
  final UserProfileController userProfileController = Get.find<UserProfileController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileController>(
      init: UserProfileController(),
      initState: (state) async {
        String? userId = await getStringPrefValue('userId');
        await userProfileController.getUserData(id: userId.toString());
      },
      builder:(UserProfileController controller) => SafeArea(
      child: Container(
        color: ColorConstants.appPrimaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
              style: ButtonStyle(
                iconSize: MaterialStatePropertyAll(26.px),
                iconColor: const MaterialStatePropertyAll(ColorConstants.appLightBeigeColor)
              ),
            ),
            InkWell(
              onTap: (){
                Get.toNamed(RouteHelper.getMyProfileScreen());
              }, 
              child: controller.isLoading.value ? const SizedBox() : Padding(
                padding: const EdgeInsets.all(5),
                child: AvatarImage(
                  userName: controller.user?.name.toString() != null ? controller.user!.name.toString() : '', 
                  width: 42, 
                  height: 42, 
                  backgroundColor: ColorConstants.appWhite,
                  textColor: ColorConstants.appBlack.withOpacity(0.7),
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
