import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:neet_flutter_app/routes/route_helper.dart';
import 'package:neet_flutter_app/widgets/no_internet_screen.dart';

class ConnectivityService extends GetxService{
  var isConnected = true.obs;
  String? previousRoute;

  @override
  void onInit(){
    super.onInit();
    InternetConnectionChecker().onStatusChange.listen((status) {
      isConnected.value = status == InternetConnectionStatus.connected;
      if (!isConnected.value && Get.currentRoute != RouteHelper.getNoInternetScreen()) {
        previousRoute = Get.currentRoute;
        Get.offNamed(RouteHelper.getNoInternetScreen());
      } else if (isConnected.value && previousRoute != null) {
        Get.offNamed(previousRoute!);
      }
    });
  }

  Future<void> checkInternetConnection() async {
    final hasInternet = await InternetConnectionChecker().hasConnection;
    isConnected.value = hasInternet;
  }
}


  // static final ConnectivityService instance = ConnectivityService._privateConstructor();

  // InternetConnectionChecker internetConnectionChecker = InternetConnectionChecker();
  // bool isConnected = true;

  // Future<bool> checkConnection() async => await internetConnectionChecker.hasConnection;

  // Future<bool> isConnectNetworkWithMessage({bool isHome = false, BuildContext? context}) async {
  //   isConnected = await internetConnectionChecker.hasConnection;
  //   if (!isConnected) {
  //     if (isHome && context != null) {
  //       Future.delayed(const Duration(microseconds: 1), () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NoInternetScreen())));
  //     } else {
  //       Get.toNamed(RouteHelper.getNoInternetScreen());
  //     }
  //   }
  //   return isConnected;
  // }