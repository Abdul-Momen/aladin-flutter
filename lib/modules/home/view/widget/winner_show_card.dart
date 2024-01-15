import 'package:aladin/constants/color.dart';
import 'package:aladin/constants/string.dart';
import 'package:aladin/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WinnersShowCard extends StatelessWidget {
  const WinnersShowCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1.5, 2.3),
            blurRadius: 2,
            spreadRadius: 2,
          )
        ],
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ConstantColors.lightYellow,
              ConstantColors.darkYellow,
            ]),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "One Winner each Within\nevery 10,000 participant",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontFamily: ConstantStrings.kAppInterSemiBold),
                ),
                addH(3.h),
                Text(
                  "20+ lucky draws every week",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontFamily: ConstantStrings.kAppInterMedium),
                )
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(2.0.w),
                    child: /*Image.network(
                      'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',*/
                    Image.asset(
                      'assets/images/img.png',
                      fit: BoxFit.fill,
                      // height: double.infinity,
                      // width: double.infinity,
                      width: 80.w,
                      height: 80.h,
                      alignment: Alignment.center,
                      repeat: ImageRepeat.noRepeat,
                    ),
                  ),
                ),
                Positioned(
                  right: 30,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(2.0.w),
                      child:/* Image.network(
                        'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',*/
                      Image.asset(
                        'assets/images/img.png',
                        fit: BoxFit.fill,
                        // height: double.infinity,
                        // width: double.infinity,
                        width: 80.w,
                        height: 80.h,
                        alignment: Alignment.center,
                        repeat: ImageRepeat.noRepeat,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 60,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(2.0.w),
                      child:/* Image.network(
                        'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',*/
                      Image.asset(
                        'assets/images/img.png',
                        fit: BoxFit.fill,
                        // height: double.infinity,
                        // width: double.infinity,
                        width: 80.w,
                        height: 80.h,
                        alignment: Alignment.center,
                        repeat: ImageRepeat.noRepeat,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
