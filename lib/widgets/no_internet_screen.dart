import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:neet_flutter_app/constants/neet_assets.dart';
import 'package:neet_flutter_app/utils/miscellaneous.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

class NoInternetScreen extends StatelessWidget{
  const NoInternetScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    logs('Current Screen ---> $runtimeType');
    return PopScope(
      onPopInvoked: (didPop){
    },
    child: Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              NeetAssets.noInternetAnimation,
              width: 200,
              height: 200,
              fit: BoxFit.cover
            ),
            const SizedBox(height: 20,),
            const Text(
              'Oops!! no internet',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ColorConstants.appPrimaryColor
              ),
            ),
            const SizedBox(height: 20,),
            const Text(
              'please check your internet connection',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: ColorConstants.appGrey
              ),
            )
          ],
        ),
      ),
    ),
    );
  }
}