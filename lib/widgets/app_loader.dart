import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:neet_flutter_app/constants/neet_assets.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key, this.width = 170, this.height = 170 });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        NeetAssets.loaderAnimation,
        width: width,
        height: height,
      ),
    );
  }
}
