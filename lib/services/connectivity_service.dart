import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:neet_flutter_app/routes/route_helper.dart';
import 'package:neet_flutter_app/widgets/no_internet_screen.dart';
// import 'package:plum/app/widgets/no_internet_screen.dart';
// import 'package:plum/routes/route_helper.dart';

class ConnectivityService {
  ConnectivityService._privateConstructor();

  static final ConnectivityService instance = ConnectivityService._privateConstructor();

  InternetConnectionChecker internetConnectionChecker = InternetConnectionChecker();
  bool isConnected = true;

  Future<bool> checkConnection() async => await internetConnectionChecker.hasConnection;

  Future<bool> isConnectNetworkWithMessage({bool isHome = false, BuildContext? context}) async {
    isConnected = await internetConnectionChecker.hasConnection;
    if (!isConnected) {
      if (isHome && context != null) {
        Future.delayed(const Duration(microseconds: 1), () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NoInternetScreen())));
      } else {
        Get.toNamed(RouteHelper.getNoInternetScreen());
      }
    }
    return isConnected;
  }
}