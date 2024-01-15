import 'package:aladin/constants/color.dart';
import 'package:aladin/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRichText extends StatefulWidget {
  final String textOne;
  final String textTwo;

  const CustomRichText({
    Key? key,
    required this.textTwo,
    required this.textOne,
  }) : super(key: key);

  @override
  State<CustomRichText> createState() => _CustomRichTextState();
}

class _CustomRichTextState extends State<CustomRichText> {
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: widget.textOne,
          style: TextStyle(
              height: 2.h,
              fontFamily: ConstantStrings.kAppInterBold,
              fontSize: 14.sp,
              color:ConstantColors.grayBlack,
              fontWeight: FontWeight.bold)),
      TextSpan(text: widget.textTwo, style: TextStyle(
        fontFamily: ConstantStrings.kAppInterRegular,
        height: 2.h,
          fontSize: 15.sp,
        color:ConstantColors.normalTextColor,))
    ]));
  }
}

/// TextStyle

