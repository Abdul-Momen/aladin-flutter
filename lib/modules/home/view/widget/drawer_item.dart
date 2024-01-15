import 'package:aladin/constants/color.dart';
import 'package:aladin/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DrawerItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData iconData;

  const DrawerItem({
    Key? key,
    required this.title,
    required this.onTap,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      iconData,
                      size: 14,
                        color: ConstantColors.normalTextColor
                    ),
                    addW(5.w),
                    Text(
                      title,
                      style:  TextStyle(
                          color: ConstantColors.grayBlack,
                        fontSize: 16.sp
                      ),
                    ),
                  ],
                ),
                const Icon(Icons.keyboard_arrow_right_sharp,
                    size: 14, color: Colors.black),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
