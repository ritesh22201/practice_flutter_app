import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final bool softWrap;
  final TextOverflow overflow;
  final int maxLines;
  final TextScaler textScaleFactor;
  final TextWidthBasis textWidthBasis;
  final TextDecoration? textDecoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThickness;

  AppText(
    this.text, {
    Key? key,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.textAlign = TextAlign.start,
    this.textDirection = TextDirection.ltr,
    this.softWrap = true,
    this.overflow = TextOverflow.clip,
    this.maxLines = 1,
    this.textScaleFactor = const TextScaler.linear(1),
    this.textWidthBasis = TextWidthBasis.parent,
    this.textDecoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        decoration: textDecoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness
      ),
      textAlign: textAlign,
      textDirection: textDirection,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      textScaler: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }
}
