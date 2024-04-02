import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:neet_flutter_app/routes/route_helper.dart';

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