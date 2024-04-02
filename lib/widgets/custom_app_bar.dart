import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:neet_flutter_app/widgets/custom_text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key, this.appBarHeight, this.appBarTitle, this.isTextCentered = false, this.appBarColor = ColorConstants.appWhite, this.textColor = ColorConstants.appBlack}): super(key: key);

  final String? appBarTitle;
  final double? appBarHeight;
  final bool? isTextCentered;
  final Color? appBarColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.px),
        height: appBarHeight,
        color: appBarColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_left_outlined,
                  size: 30.px,
                  color: textColor,
                )),
            isTextCentered ?? false
                ? Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        appBarTitle.toString(),
                        fontSize: 20.px,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ],
                  ),
                )
                : Expanded(
                  child: Row(
                      children: [
                        SizedBox(
                          width: 5.px,
                        ),
                        AppText(
                          appBarTitle.toString(),
                          fontSize: 20.px,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        )
                      ],
                    ),
                )
          ],
        ),
      ),
    );
  }
}
