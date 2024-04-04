import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:neet_flutter_app/constants/neet_assets.dart';
import 'package:neet_flutter_app/widgets/custom_text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

extension SnackBar on String {
  showInfo() {
    Get.snackbar('Info!!', this,
        backgroundColor: ColorConstants.appPrimaryColor,
        colorText: ColorConstants.appWhite);
  }

  showError({Duration? duration}) {
    BotToast.showCustomNotification(
        duration: duration ?? const Duration(milliseconds: 3000),
        toastBuilder: (CancelFunc cancelFunc) {
          return Container(
            height: 60.px,
            margin: EdgeInsets.all(16.px),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.px),
                color: ColorConstants.categoryBG2Color),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(18.px),
                  child: Image.asset(
                    NeetAssets.declineCrossIcon,
                    height: 20.px,
                    width: 20.px,
                  ),
                ),
                Expanded(
                    child: Container(
                  height: 60.px,
                  margin: EdgeInsets.all(2.px),
                  decoration: BoxDecoration(
                      color: ColorConstants.hex('#FEEEF1'),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.px),
                        bottomRight: Radius.circular(8.px),
                      )),
                  alignment: Alignment.center,
                  child: AppText(
                    this,
                    color: ColorConstants.categoryBG2Color,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.px,
                    textAlign: TextAlign.center,
                  ),
                ))
              ],
            ),
          );
        });
  }

  showSuccess({Duration? duration}) {
    BotToast.showCustomNotification(
        duration: duration ?? const Duration(milliseconds: 3000),
        toastBuilder: (CancelFunc cancelFunc) {
          return Container(
            height: 60.px,
            margin: EdgeInsets.all(16.px),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.px),
                color: ColorConstants.appLightGreen),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(18.px),
                  child: Image.asset(NeetAssets.acceptTick,
                      height: 20.px, width: 20.px),
                ),
                Expanded(
                    child: Container(
                  height: 60.px,
                  margin: EdgeInsets.all(2.px),
                  decoration: BoxDecoration(
                      color: ColorConstants.hex('#E6F7F3'),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.px),
                          bottomRight: Radius.circular(8.px))),
                  alignment: Alignment.center,
                  child: AppText(
                    this,
                    color: ColorConstants.appLightGreen,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.px,
                    textAlign: TextAlign.center,
                  ),
                ))
              ],
            ),
          );
        });
  }

  showWarning({Duration? duration}) {
    BotToast.showCustomNotification(
        duration: duration ?? const Duration(milliseconds: 3000),
        toastBuilder: (CancelFunc cancelFunc) {
          return Container(
            height: 60.px,
            margin: EdgeInsets.all(16.px),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.px),
                color: ColorConstants.appRateYellow),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(18.px),
                  child: Image.asset(NeetAssets.warningImg,
                      height: 20.px, width: 20.px),
                ),
                Expanded(
                    child: Container(
                  height: 60.px,
                  margin: EdgeInsets.all(2.px),
                  decoration: BoxDecoration(
                      color: ColorConstants.lightYellowColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.px),
                          bottomRight: Radius.circular(8.px))),
                  alignment: Alignment.center,
                  child: AppText(
                    this,
                    color: ColorConstants.appRateYellow,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.px,
                    textAlign: TextAlign.center,
                  ),
                ))
              ],
            ),
          );
        });
  }

  copyCode() {
    Clipboard.setData(ClipboardData(text: this));
    '$this code copied'.showSuccess();
  }
}

extension StringCasingExtension on String {
  String stringAsFixed({int? fixValue}) => padLeft(fixValue ?? 2, '0');
}
