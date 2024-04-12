import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:neet_flutter_app/constants/neet_assets.dart';
import 'package:neet_flutter_app/routes/route_helper.dart';
import 'package:neet_flutter_app/utils/shared_preferences.dart';
import 'package:neet_flutter_app/widgets/custom_text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key, this.textMessage});

  final String? textMessage;

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {

  @override
  initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () async {
      String? authenticatedUser = await getStringPrefValue('userToken');

      if(authenticatedUser == null || authenticatedUser.isEmpty){
        Get.toNamed(RouteHelper.getLoginPage());
      }
      else {
        Get.toNamed(RouteHelper.getHomePage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(NeetAssets.successAnimation, width: 150.px, height: 150.px),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:  AppText(widget.textMessage.toString(), fontSize: 20.px, color: ColorConstants.appGrey, maxLines: 2)
            )
          ],
        ),
      ),
    );
  }
}
