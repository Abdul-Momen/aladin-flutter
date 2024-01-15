import 'package:aladin/widget/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helper/helper.dart';

class WinGridViewSkeleton extends StatelessWidget {
  const WinGridViewSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 291.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow:  [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(2.5, 3.7),
            blurRadius: 2,
            spreadRadius: 2,
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skeleton(
                  height: 10.h,
                  width: 150.w,
                ),
                addH(5.h),
                Skeleton(
                  height: 10.h,
                  width: 140.w,
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 8.h),
                  height: 110.h,
                  width: double.infinity,

                  child: Align(
                      alignment: Alignment.topRight,
                      child: Skeleton(
                        height: 10.h,
                        width: 10.w,
                      ),),
                ),

                Positioned(
                    bottom: -20.h,
                    right: 0,
                    child: SizedBox(
                      height: 40.h,
                      width: 50.w,

                      child: Skeleton(
                        height: 40.h,
                        width: 50.w,
                      ),
                    ))
              ],
            ),
            addH(26.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skeleton(
                  height: 15.h,
                  width: double.infinity,
                ),
                addH(2.h),
                Skeleton(
                  height: 5.h,
                  width: double.infinity,
                ),
              ],
            ),
            addH(10.h),
            Skeleton(
              height: 46.h,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
