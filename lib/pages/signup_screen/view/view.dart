import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:neet_flutter_app/constants/neet_assets.dart';
import 'package:neet_flutter_app/controllers/sign_up_controller.dart';
import 'package:neet_flutter_app/generated/l10n.dart';
import 'package:neet_flutter_app/widgets/app_non_border_text_field.dart';
import 'package:neet_flutter_app/widgets/custom_text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegistrationFormView extends StatelessWidget {
  RegistrationFormView({super.key});
  final SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: [
        SizedBox(height: 30.px),
        ElevatedButton(
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
        SizedBox(height: 30.px),
        AppText('OR', fontSize: 18.px, textAlign: TextAlign.center, color: ColorConstants.appGrey),
        SizedBox(height: 30.px),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHelperView(
                name: 'Name*',
                textController: controller.fullNameController,
                textInputType: TextInputType.name,
                hintText: S.of(context).fullNameText,
                errorText: controller.fullNameError.toString(),
            ),
            SizedBox(height: 30.px),
            FormHelperView(
                name: 'Email*',
                textController: controller.emailController,
                textInputType: TextInputType.emailAddress,
                hintText: S.of(context).emailHintText,
                errorText: controller.emailError.toString(),
            ),
            SizedBox(height: 30.px),
            FormHelperView(
                name: 'Phone',
                textController: controller.phoneController,
                textInputType: TextInputType.phone,
                hintText: S.of(context).phoneNumText,
                errorText: controller.phoneNumberError.toString(),
            ),
            SizedBox(height: 30.px),
            FormHelperView(
                name: 'Password*',
                textController: controller.passwordController,
                textInputType: TextInputType.visiblePassword,
                hintText: S.of(context).passwordText,
                errorText: controller.passwordError.toString(),
              ),
            SizedBox(height: 30.px),
            FormHelperView(
                name: 'Confirm password*',
                textController: controller.confirmPasswordController,
                textInputType: TextInputType.visiblePassword,
                hintText: S.of(context).confirmPassword,
                errorText: controller.confirmPasswordError.toString(),
            )
          ],
        )
      ],
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
      this.errorText
     });
  final SignupController controller = Get.find<SignupController>();

  final String? name;
  final TextEditingController? textController;
  final TextInputType? textInputType;
  final String? hintText;
  final String? errorText;

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
            hintText: hintText),
        ],
      ),
    );
  }
}
