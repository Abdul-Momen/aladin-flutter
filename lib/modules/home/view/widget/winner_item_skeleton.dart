import 'package:aladin/helper/helper.dart';
import 'package:aladin/widget/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WinnerItemsSkeleton extends StatelessWidget {

  const WinnerItemsSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, bottom: 5),
      height: 350.h,
      width: 255.w,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(2.5, 3.7),
              blurRadius: 2,
              spreadRadius: 2,
            )
          ],
          color: Colors.white),
      child: Column(
        children: [
          SizedBox(
            height: 150.h,
            width: 255.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 60.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.r),
                  ),
                  child: Skeleton(
                    height: 60.h,
                    width: 60.w,
                  ),
                ),
                addH(8),
                Skeleton(
                  height: 20.h,
                  width: 200.w,
                ),
                addH(8),
                Skeleton(
                  height: 15.h,
                  width: 180.w,
                ),
                addH(8),
                Skeleton(
                  height: 10.h,
                  width: 150.w,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skeleton(
                  height: 118.h,
                  width: double.infinity.w,
                ),
                addH(10),
                SizedBox(
                  height: 45.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            Skeleton(
                              height: 10.h,
                              width: 80.w,
                            ),
                            addW(2),
                            Skeleton(
                              height: 10.h,
                              width: 100.w,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        child: Row(
                          children: [
                            Skeleton(
                              height: 10.h,
                              width: 80.w,
                            ),
                            addW(2),
                            Skeleton(
                              height: 10.h,
                              width: 100.w,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
