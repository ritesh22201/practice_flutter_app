import 'package:flutter/material.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: ColorConstants.appPrimaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
              style: ButtonStyle(
                iconSize: MaterialStatePropertyAll(26.px),
                iconColor: const MaterialStatePropertyAll(ColorConstants.appLightBeigeColor)
              ),
            ),
            IconButton(
              onPressed: (){}, icon: const Icon(Icons.account_circle),
              style: ButtonStyle(
                iconSize: MaterialStatePropertyAll(28.px),
                iconColor: const MaterialStatePropertyAll(ColorConstants.appLightBeigeColor)
              ),
            )
          ],
        ),
      ),
    );
  }
}
