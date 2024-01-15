import 'package:aladin/constants/color.dart';
import 'package:aladin/constants/string.dart';
import 'package:aladin/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Color? color;
  final String title;
  final VoidCallback? onBack;


  const CustomAppBar({super.key, 
    this.height = kToolbarHeight,
    this.color,
    required this.title, this.onBack,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 45.h),
      height: preferredSize.height,
      color: color,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if(onBack==null)
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              if(onBack!=null)
              IconButton(
                onPressed: onBack,
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              addW(15.w),
              Text(
                title,
                style: TextStyle(
                    color: ConstantColors.grayBlack,
                    fontSize: 20.sp,
                    fontFamily: ConstantStrings.kAppInterSemiBold),
              ),
            ],
          ),
          /* IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
            ),
          ),*/
        ],
      ),
    );
  }
}
