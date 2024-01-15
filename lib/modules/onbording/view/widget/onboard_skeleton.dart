import 'package:aladin/helper/helper.dart';
import 'package:aladin/widget/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardSkeleton extends StatelessWidget {
  const OnBoardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Skeleton(
            height: 600.h,
          ),
          addH(20.h),
          Skeleton(
            height: 20.h,
          ),
          addH(20.h),
          Skeleton(
            height: 50.h,
          ),
          addH(20.h),
          Skeleton(
            height: 50.h,
          ),
        ],
      ),
    );
  }
}
