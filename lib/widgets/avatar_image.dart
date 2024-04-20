import 'package:flutter/material.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:neet_flutter_app/widgets/custom_text_widget.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({super.key, required this.userName, this.width = 100, this.height = 100, this.backgroundColor, this.textColor, this.fontSize});

  final String? userName;
  final double width;
  final double height;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context){
    String initials = userName!.isNotEmpty ? _getFirstAndLastName(userName.toString()) : '';

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1.5, color: ColorConstants.appBlack),
      ),
      child: CircleAvatar(
        backgroundColor: backgroundColor ?? ColorConstants.appPrimaryColor,
        child: AppText(
          initials,
          fontSize: fontSize ?? 35,
          color: textColor ?? ColorConstants.appWhite,
        ),
      ),
    );
  }

  String _getFirstAndLastName(String name) {
    List<String> nameParts = name.split(' ');

    if(nameParts.length >= 2){
      String firstNameInitial = nameParts[0][0].toUpperCase();
      String secondNameInitial = nameParts[1][0].toUpperCase();
      return '$firstNameInitial$secondNameInitial';
    }

    if(nameParts.length == 1){
      String firstNameInitial = nameParts[0][0].toUpperCase();
      return firstNameInitial;
    }

    return '';
  }
}