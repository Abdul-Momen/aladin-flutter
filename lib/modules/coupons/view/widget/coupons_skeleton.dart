import 'package:aladin/helper/helper.dart';
import 'package:aladin/widget/skeleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CouponsSkeleton extends StatelessWidget {
  const CouponsSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        SizedBox(
          height: 80.h,
          width: double.infinity,
          child: Row(
            children: [
              Skeleton(
                height: 80.h,
                width: 90.w,
              ),
              addW(10),
              Expanded(
                child: SizedBox(
                  height: 80.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Skeleton(
                            height: 10,
                            width: width * 0.3,
                          ),
                          Skeleton(
                            height: 10,
                            width: width * 0.3,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Skeleton(
                            height: 10,
                            width: width * 0.3,
                          ),
                          Skeleton(
                            height: 10,
                            width: width * 0.3,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Skeleton(
                            height: 10,
                            width: width * 0.3,
                          ),
                          Skeleton(
                            height: 10,
                            width: width * 0.3,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Skeleton(
                            height: 10,
                            width: width * 0.3,
                          ),
                          Skeleton(
                            height: 10,
                            width: width * 0.3,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        addH(10.h),
      ],
    );
  }
}
