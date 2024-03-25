import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:neet_flutter_app/controllers/theme_controller.dart';
import 'package:neet_flutter_app/generated/l10n.dart';
import 'package:neet_flutter_app/routes/route_helper.dart';
import 'package:neet_flutter_app/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'services/connectivity_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isConnected = true;

  @override
  void initState() {
    checkInternet();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      logs('App paused');
    } else if (state == AppLifecycleState.detached) {
      logs('App resumed');
    }
  }

  @override
  Widget build(BuildContext context) {
    Locale? locale;
    return ResponsiveSizer(
      builder: (BuildContext context, Orientation orientation, screenType) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: GetMaterialApp(
            title: 'neet pyq questions',
            navigatorKey: Get.key,
            debugShowCheckedModeBanner: false,
            initialRoute: RouteHelper.getSplashScreen(),
            getPages: RouteHelper.routes,
            defaultTransition: Transition.fadeIn,
            scrollBehavior: MyBehaviour(),
            theme: ThemeController.lightTheme,
            localizationsDelegates: const [
              S.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: locale,
            builder: (context, child) {
              child = MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child ?? Container(),
              );
              if (!isConnected) return child;
              child = BotToastInit()(context, child);
              return child;
            },
            navigatorObservers: [
              BotToastNavigatorObserver(),
            ],
          ),
        );
      },
    );
  }

  Future<void> checkInternet() async {
    isConnected = await ConnectivityService.instance.isConnectNetworkWithMessage(isHome: true, context: context);
  }
}

class MyBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
          BuildContext context, Widget child, AxisDirection axisDirection) =>
      child;
}
