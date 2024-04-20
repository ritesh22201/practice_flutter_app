import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:neet_flutter_app/widgets/custom_text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppTextField extends StatelessWidget {
  String? hintText;
  TextInputType? inputType;
  bool? obscureText;
  TextEditingController? controller;
  int? maxline;
  double? height;
  FocusNode? focusNode;
  int? inputLength;
  Function(String)? onFieldSubmitted;
  FormFieldValidator<String>? validation;
  TextInputAction? textInputAction;
  Widget? iconSuffix;
  Widget? iconPrefix;
  Color? textColor;
  VoidCallback? onSuffixTap;
  Color? hintTextColor;
  VoidCallback? onPrefixTap;
  ValueChanged<String>? onChanged;
  GestureTapCallback? onTap;
  bool? isEnabled;
  bool? readOnly;
  bool? isDigitOnly;
  bool isFill = false;
  String? errorText;
  bool? isError;
  List<TextInputFormatter>? inputFormatters;

  AppTextField({
    Key? key,
    required this.controller,
    required this.inputType,
    this.obscureText = false,
    this.maxline,
    this.inputLength = 100,
    this.focusNode,
    this.onFieldSubmitted,
    this.validation,
    this.iconSuffix,
    this.iconPrefix,
    this.hintTextColor,
    required this.hintText,
    this.onSuffixTap,
    this.onPrefixTap,
    this.onChanged,
    this.textColor,
    this.onTap,
    this.isEnabled,
    this.isFill = false,
    this.textInputAction,
    this.errorText,
    this.isError = false,
    this.readOnly = false,
    this.isDigitOnly = false,
    this.inputFormatters
  }):super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 43.px,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: ColorConstants.appSuggestionBorder
          ),
          child: TextFormField(
            cursorColor: ColorConstants.appPrimaryColor,
            onChanged: (value) {
              controller?.text = value;
            },
            enabled: isEnabled,
            readOnly: readOnly!,
            onTap: onTap,
            style: TextStyle(
              color: readOnly! ? ColorConstants.appBlue.withOpacity(0.3) : textColor ?? ColorConstants.appBlue,
              fontSize: 14.px,
              fontWeight: FontWeight.w600
            ),
            inputFormatters: inputFormatters ?? [
              isDigitOnly! ? 
                FilteringTextInputFormatter.digitsOnly
                : FilteringTextInputFormatter.singleLineFormatter,
                FilteringTextInputFormatter.deny(
                  RegExp(r'[\u2700-\u27bf]|(?:\ud83c[\udde6-\uddff]){2}|[\ud800-\udbff][\udc00-\udfff]|[\u0023-\u0039]\ufe0f?\u20e3|\u3299|\u3297|\u303d|\u3030|\u24c2|\ud83c[\udd70-\udd71]|\ud83c[\udd7e-\udd7f]|\ud83c\udd8e|\ud83c[\udd91-\udd9a]|\ud83c[\udde6-\uddff]|\ud83c[\ude01-\ude02]|\ud83c\ude1a|\ud83c\ude2f|\ud83c[\ude32-\ude3a]|\ud83c[\ude50-\ude51]|\u203c|\u2049|[\u25aa-\u25ab]|\u25b6|\u25c0|[\u25fb-\u25fe]|\u00a9|\u00ae|\u2122|\u2139|\ud83c\udc04|[\u2600-\u26FF]|\u2b05|\u2b06|\u2b07|\u2b1b|\u2b1c|\u2b50|\u2b55|\u231a|\u231b|\u2328|\u23cf|[\u23e9-\u23f3]|[\u23f8-\u23fa]|\ud83c\udccf|\u2934|\u2935|[\u2190-\u21ff]')
                ),
                LengthLimitingTextInputFormatter(inputLength)
            ],
            textInputAction: textInputAction,
            controller: controller,
            keyboardType: inputType,
            obscureText: obscureText!,
            obscuringCharacter: '*',
            validator: validation,
            onFieldSubmitted: onFieldSubmitted,
            maxLines: maxline ?? 1,
            focusNode: focusNode,
            decoration: iconPrefix != null ? 
               InputDecoration(
                 alignLabelWithHint: false,
                 isDense: true,
                 prefixIcon: IconButton(
                  icon : iconPrefix ?? const SizedBox(),
                  onPressed: onPrefixTap,
                 ),
                 suffixIcon: IconButton(
                  icon : iconSuffix ?? const SizedBox(),
                  onPressed: onSuffixTap,
                 ),
                 contentPadding: EdgeInsets.only(left: 15.px, top: 13.px, bottom: 13.px),
                 border: InputBorder.none,
                 hintText: hintText,
                 hintStyle: TextStyle(
                   color: hintTextColor ?? ColorConstants.appHintTextColor,
                   fontSize: 14.px,
                   fontWeight: FontWeight.w600
                 ),
               )
              : InputDecoration(
                   alignLabelWithHint: false,
                   isDense: true,
                   suffixIcon: IconButton(
                     onPressed: onSuffixTap, icon: iconSuffix ?? const SizedBox()
                   ),
                   contentPadding: EdgeInsets.only(left: 15.px, top: 13.px, bottom: 13.px),
                   border: InputBorder.none,
                   hintText: hintText,
                   hintStyle: TextStyle(
                     color: hintTextColor ?? ColorConstants.appHintTextColor,
                     fontSize: 14.px,
                     fontWeight: FontWeight.w600
                   ),
                 )
          ),
        ),
        errorText != null && errorText!.isNotEmpty  ? 
          Column(
            children: [
              SizedBox(height: 5.px),
              AppText(
                errorText!,
                fontWeight: FontWeight.w400,
                color: ColorConstants.mediumRedColor,
                fontSize: 14.px,
              )
            ],
          ) : 
          Container()
      ],
    );
  }
}