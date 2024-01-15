import 'package:aladin/helper/helper.dart';
import 'package:aladin/widget/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AladinProductSkeleton extends StatelessWidget {
  const AladinProductSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 160.h,
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(3.5, 4.7),
            blurRadius: 5,
            spreadRadius: 3,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Skeleton(
              height: 120.h,
              width: 100.w,
            ),
            addH(20),
            const Skeleton(
              height: 10,
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}
