import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:neet_flutter_app/controllers/sign_up_controller.dart';
import 'package:neet_flutter_app/controllers/user_profile_controller.dart';
import 'package:neet_flutter_app/generated/l10n.dart';
import 'package:neet_flutter_app/utils/miscellaneous.dart';
import 'package:neet_flutter_app/utils/shared_preferences.dart';
import 'package:neet_flutter_app/widgets/app_loader.dart';
import 'package:neet_flutter_app/widgets/app_non_border_text_field.dart';
import 'package:neet_flutter_app/widgets/avatar_image.dart';
import 'package:neet_flutter_app/widgets/custom_app_bar.dart';
import 'package:neet_flutter_app/widgets/custom_text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final UserProfileController controller = Get.find<UserProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: controller.isLoading.value ? const PreferredSize(preferredSize: Size.fromHeight(0), child: SizedBox()) : PreferredSize(
        preferredSize: Size.fromHeight(65.px),
        child: MyAppBar(
          appBarHeight: 65.px,
          appBarTitle: 'Edit profile',
          isTextCentered: true,
        ),
      ),
      body: GetBuilder<UserProfileController>(
          init: UserProfileController(),
          initState: (state) {
            controller.nameController.text = controller.user!.name.toString();
            controller.emailController.text = controller.user!.email.toString();
            controller.phoneController.text = controller.user!.phone.toString();
            controller.choosenGender = controller.user!.gender.toString();
          },
          builder: (UserProfileController profileController) {
            return profileController.isLoading.value ? const AppLoader() : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.px),
                    Center(
                      child: Column(
                        children: [
                          AvatarImage(
                            userName: profileController.user!.name.toString(),
                          ),
                          SizedBox(height: 20.px),
                          AppText(
                            'learning since ${profileDateFormatter(profileController.user!.createdAt.toString())}',
                          ),
                          SizedBox(height: 10.px),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText('status'),
                              SizedBox(width: 10.px),
                              AppText(
                                profileController.user!.status.toString()[0].toUpperCase() + profileController.user!.status.toString().substring(1),
                                color: ColorConstants.appBlueColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.px,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 40.px),
                    FormHelperView(
                      name: 'Name',
                      textController: profileController.nameController,
                      textInputType: TextInputType.name,
                      hintText: S.of(context).fullNameText,
                    ),
                    SizedBox(height: 40.px),
                    FormHelperView(
                      name: 'Email',
                      textController: profileController.emailController,
                      textInputType: TextInputType.emailAddress,
                      hintText: S.of(context).emailHintText,
                      readOnly: true,
                    ),
                    SizedBox(height: 40.px),
                    FormHelperView(
                      name: 'Phone',
                      textController: profileController.phoneController,
                      textInputType: TextInputType.phone,
                      hintText: S.of(context).phoneNumText,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40.px),
                        AppText('Gender', fontWeight: FontWeight.w500),
                        SizedBox(height: 4.px),
                        GridView.builder(
                          shrinkWrap: true,
                          primary: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20.0,
                            crossAxisSpacing: 20.0,
                            childAspectRatio: 1.0,
                            mainAxisExtent: 45
                          ),
                          itemCount: profileController.genders.length, 
                          itemBuilder: (BuildContext context, int index){
                            return ElevatedButton(
                              onPressed: (){
                                profileController.choosenGender = profileController.genders[index];
                                profileController.update();
                              }, 
                              style: ElevatedButton.styleFrom(
                                backgroundColor: profileController.choosenGender == profileController.genders[index] ? ColorConstants.appBlueColor.withOpacity(0.4) : null
                              ),
                              child: AppText(
                                profileController.genders[index], 
                                color: ColorConstants.appBlue,
                              ),
                            );
                          }
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
          bottomNavigationBar: GetBuilder<UserProfileController>(
            init: UserProfileController(),
            builder:(UserProfileController controller) => controller.isLoading.value ? const SizedBox() : SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24.px, vertical: 15.px),
              child: ElevatedButton(
                onPressed: () async {
                  String? userId = await getStringPrefValue('userId');
                  await controller.editUserProfile(userId: userId.toString().trim());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.appPrimaryColor,
                    padding: EdgeInsets.symmetric(vertical: 12.px)),
                child: AppText('Update profile',
                    fontSize: 16.px,
                    color: ColorConstants.appWhite,
                    fontWeight: FontWeight.w500),
              ),
            ),
                    ),
          ),
    );
  }
}

class FormHelperView extends StatelessWidget {
  FormHelperView(
      {super.key,
      required this.name,
      required this.textController,
      required this.textInputType,
      required this.hintText,
      this.errorText,
      this.obscureText,
      this.suffixIcon,
      this.onSuffixTap,
      this.readOnly});
  final SignupController controller = Get.put(SignupController());

  final String? name;
  final TextEditingController? textController;
  final TextInputType? textInputType;
  final String? hintText;
  final String? errorText;
  final bool? obscureText;
  final Icon? suffixIcon;
  final Function()? onSuffixTap;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(name.toString(), fontWeight: FontWeight.w500),
          SizedBox(height: 4.px),
          AppTextField(
            errorText: errorText,
            controller: textController,
            inputType: textInputType,
            hintText: hintText,
            obscureText: obscureText ?? false,
            iconSuffix: suffixIcon,
            onSuffixTap: onSuffixTap,
            readOnly: readOnly ?? false,
          ),
        ],
      ),
    );
  }
}
