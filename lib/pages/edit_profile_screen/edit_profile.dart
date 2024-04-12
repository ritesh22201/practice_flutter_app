import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neet_flutter_app/controllers/edit_profile_controller.dart';
import 'package:neet_flutter_app/widgets/custom_app_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.px),
        child: MyAppBar(
          appBarHeight: 65.px,
          appBarTitle: 'Edit profile',
          isTextCentered: true,
        ),
      ),
      body: GetBuilder<EditProfileController>(
        init: EditProfileController(),
        builder: (EditProfileController editProfileController) {
          return Container(
            child: Placeholder(),
          );
        }
      ),
    );
  }
}
