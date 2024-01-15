import 'package:aladin/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBack extends StatelessWidget {
  final String title;
  final Color? arColor;
  final Color? txtColor;

  const CustomBack({
    Key? key,
    required this.title,
    this.arColor,
    this.txtColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        addH(40.h),
        Row(
          children: [
            InkWell(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back,
                  color: arColor ?? Colors.black,
                  size: 20,
                )),
            addW(10.w),
            Text(
              title,
              style: TextStyle(
                color: txtColor ?? Colors.black,
                fontSize: 17.sp,
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
      ],
    );
  }
}
