import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:neet_flutter_app/constants/neet_assets.dart';
import 'package:neet_flutter_app/routes/route_helper.dart';
import 'package:neet_flutter_app/services/connectivity_service.dart';
import 'package:neet_flutter_app/utils/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ConnectivityService connectivityService = Get.find<ConnectivityService>();

  @override
  void initState() {
    Timer(
      const Duration(seconds: 4),
      () async {
        if(connectivityService.isConnected.value && connectivityService.previousRoute == null){
          bool authenticatedUser = await getPrefBoolValue('userToken');
          if(!authenticatedUser){
            Get.offNamed(RouteHelper.getLoginPage());
          }
          else{
            Get.offNamed(RouteHelper.getHomePage());
          }
        }
        else{
          Get.offNamed(RouteHelper.getNoInternetScreen());
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          NeetAssets.splashScreenAnimation,
          fit: BoxFit.cover
        ),
      ),
    );
  }
}
