import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../helper/helper.dart';
import '../../../../widget/skeleton.dart';

class RunningCampaignSkeleton extends StatelessWidget {
  const RunningCampaignSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(2.5, 3.7),
            blurRadius: 2,
            spreadRadius: 1,
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(15.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Skeleton(
                  height: 20.h,
                  width: 120.w,
                ),
                Skeleton(
                  height: 20.h,
                  width: 150.w,
                ),
              ],
            ),
            addH(5),
            Skeleton(
              height: 220.h,
              width: double.infinity,
            ),
            addH(9.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3)),
                        height: 24.h,
                        width: 110.w,
                        child: Center(
                          child:Skeleton(
                            height: 15.h,
                            width: 100.w,
                          ),)),
                    addH(7.h),
                    Skeleton(
                      height: 15.h,
                      width: 200.w,
                    ),
                    addH(5),
                    Skeleton(
                      height: 15.h,
                      width: 220.w,
                    ),
                  ],
                ),
                Skeleton(
                  height: 80.h,
                  width: 100.w,
                ),
              ],
            ),
            addH(16.h),
            Skeleton(
              height: 45.h,
              width: double.infinity.w,
            ),
            addH(16.h),
            Skeleton(
              height: 55.h,
              width: double.infinity.w,
            ),
          ],
        ),
      ),
    );
  }
}

















