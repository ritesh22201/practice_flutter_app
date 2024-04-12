import 'package:flutter/material.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:neet_flutter_app/widgets/custom_text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({super.key, required this.userName, this.width = 100, this.height = 100});

  final String userName;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context){
    String initials = _getFirstAndLastName(userName);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1.5, color: ColorConstants.appBlack),
      ),
      child: CircleAvatar(
        backgroundColor: const Color.fromARGB(255, 134, 20, 215),
        child: AppText(
          initials,
          fontSize: 35,
          color: ColorConstants.appWhite,
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