import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:neet_flutter_app/constants/neet_assets.dart';
import 'package:neet_flutter_app/controllers/sign_up_controller.dart';
import 'package:neet_flutter_app/pages/signup_screen/view/view.dart';
import 'package:neet_flutter_app/routes/route_helper.dart';
import 'package:neet_flutter_app/widgets/app_loader.dart';
import 'package:neet_flutter_app/widgets/custom_text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      init: SignupController(),
      builder: (SignupController controller) => Scaffold(
        body: controller.isLoading.value
            ? const AppLoader()
            : SafeArea(
              child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 65.px,
                          margin: EdgeInsets.only(top: 20.px),
                          child: Row(
                            children: [
                              AppText(
                                'welcome 🤠',
                                fontSize: 20.px,
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                        ),
                        RegistrationFormView(),
                        SizedBox(height: 20.px),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.px, top: 10.px),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText('Already have an account?'),
                              SizedBox(width: 10.px),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(RouteHelper.getLoginPage());
                                },
                                child: AppText('login',
                                    color: const Color.fromARGB(255, 16, 99, 242),
                                    decorationColor:
                                        const Color.fromARGB(255, 16, 99, 242),
                                    decorationThickness: 1.0,
                                    textDecoration: TextDecoration.underline),
                              )
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   width: 100.w,
                        //   child: ElevatedButton(
                        //     onPressed: () {
                        //       controller.validateSignupForm(context);
                        //     },
                        //     style: ElevatedButton.styleFrom(
                        //         backgroundColor: ColorConstants.appPrimaryColor,
                        //         padding: EdgeInsets.symmetric(vertical: 12.px)),
                        //     child: AppText('Sign up',
                        //         fontSize: 16.px,
                        //         color: ColorConstants.appWhite,
                        //         fontWeight: FontWeight.w500),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
            ),
        bottomNavigationBar: controller.isLoading.value ? const SizedBox() : Container(
          margin: EdgeInsets.symmetric(horizontal: 24.px, vertical: 15.px),
          child: ElevatedButton(
            onPressed: () {
              controller.validateSignupForm(context);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstants.appPrimaryColor,
                padding: EdgeInsets.symmetric(vertical: 12.px)),
            child: AppText('Sign up',
                fontSize: 16.px,
                color: ColorConstants.appWhite,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
