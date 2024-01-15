import 'package:aladin/helper/helper.dart';
import 'package:aladin/widget/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClosingSoonSkeleton extends StatelessWidget {
  const ClosingSoonSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 195.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                    top: 5,
                    right: 3,
                    left: 3,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(right: 10.w),
                    height: 172.h,
                    width: 122.w,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(3.5, 4.7),
                          blurRadius: 5,
                          spreadRadius: 3,
                        )
                      ],
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        addH(5.h),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Skeleton(
                              height: 100.h,
                              width: 100.w,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                addH(2.h),
                                Skeleton(
                                  height: 10.h,
                                ),
                                addH(2.h),
                                Skeleton(
                                  height: 10.h,
                                ),
                                addH(2.h),
                                Skeleton(
                                  height: 10.h,
                                ),
                                Skeleton(
                                  height: 10.h,
                                ),
                                addH(5.h),
                              ],
                            ))
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
