import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:neet_flutter_app/constants/neet_assets.dart';
import 'package:neet_flutter_app/controllers/home_page_controller.dart';
import 'package:neet_flutter_app/controllers/login_controller.dart';
import 'package:neet_flutter_app/controllers/sign_up_controller.dart';
import 'package:neet_flutter_app/routes/route_helper.dart';
import 'package:neet_flutter_app/widgets/app_non_border_text_field.dart';
import 'package:neet_flutter_app/widgets/custom_app_bar.dart';
import 'package:neet_flutter_app/widgets/custom_text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (LoginController loginController) => Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(65.px),
            child: MyAppBar(
              appBarHeight: 65.px,
              appBarTitle: 'login',
            )),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.px),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100.w,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.appWhite,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(NeetAssets.googleLogo,
                            width: 33.px, height: 33.px),
                      ),
                      const SizedBox(width: 10),
                      AppText(
                        'Continue with Google',
                        color: ColorConstants.appGrey,
                        fontSize: 18.px,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.px),
              AppText('OR',
                  fontSize: 18.px,
                  textAlign: TextAlign.center,
                  color: ColorConstants.appGrey),
              SizedBox(height: 30.px),
              FormHelperView(
                  name: 'Email*',
                  textController: loginController.emailController,
                  textInputType: TextInputType.emailAddress,
                  hintText: 'enter your email'),
              SizedBox(height: 30.px),
              FormHelperView(
                  name: 'Password*',
                  textController: loginController.passwordController,
                  textInputType: TextInputType.visiblePassword,
                  hintText: 'enter your password'),
              SizedBox(height: 30.px),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    "Don't have an account?",
                  ),
                  SizedBox(width: 10.px),
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouteHelper.getSignupPage());
                    },
                    child: AppText('signup',
                        color: const Color.fromARGB(255, 16, 99, 242),
                        decorationColor: const Color.fromARGB(255, 16, 99, 242),
                        decorationThickness: 1.0,
                        textDecoration: TextDecoration.underline),
                  )
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24.px, vertical: 15.px),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.appPrimaryColor,
                  padding: EdgeInsets.symmetric(vertical: 12.px)),
              child: AppText('Login',
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
      required this.hintText});
  final SignupController controller = Get.put(SignupController());

  final String? name;
  final TextEditingController? textController;
  final TextInputType? textInputType;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(name.toString(), fontWeight: FontWeight.w500),
          SizedBox(height: 4.px),
          AppTextField(
            controller: textController,
            inputType: textInputType,
            hintText: hintText,
          ),
        ],
      ),
    );
  }
}
