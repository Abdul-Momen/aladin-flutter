import 'package:aladin/helper/helper.dart';
import 'package:aladin/widget/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCartPageSkeleton extends StatelessWidget {
  const MyCartPageSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(1.2, 3.3),
            blurRadius: 2,
            spreadRadius: 0.1,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Skeleton(
                  height: 100.h,
                  width: 125.w,
                ),
                addW(5),
                SizedBox(
                  height: 100.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Skeleton(
                        height: 10.h,
                        width: width * 0.4,
                      ),
                      addH(12.h),
                      Skeleton(
                        height: 10.h,
                        width: width * 0.3,
                      ),
                      addH(10.h),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Skeleton(
                              height: 32.h,
                              width: 32.w,
                            ),
                            addW(5),
                            Skeleton(
                              height: 20.h,
                              width: 32.w,
                            ),
                            addW(5),
                            Skeleton(
                              height: 32.h,
                              width: 32.w,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Skeleton(
              height: 30.h,
              width: 30.w,
            ),
          ],
        ),
      ),
    );
  }
}


class MyCartBottomSheetSkeleton extends StatelessWidget {
  const MyCartBottomSheetSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return  SizedBox(
      height: 335,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.start,
          children: [
            addH(20),
            addH(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Skeleton(height: 10.h,width: width*0.2,),
                Skeleton(height: 10.h,width: width*0.2,),
              ],
            ),
            addH(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Skeleton(height: 10.h,width: width*0.2,),
                Skeleton(height: 10.h,width: width*0.2,),
              ],
            ),
            const Divider(
              thickness: 0.5,
              color: Colors.black26,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Skeleton(height: 10.h,width: width*0.2,),
                Skeleton(height: 10.h,width: width*0.2,),
              ],
            ),
            const Divider(
              thickness: 0.5,
              color: Colors.black26,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Skeleton(height: 10.h,width: width*0.6,),
                    addH(10),
                    Skeleton(height: 10.h,width: width*0.6,),
                  ],
                ),
                Skeleton(height: 25.h,width: 25.w,),

              ],
            ),
            const Divider(
              thickness: 0.5,
              color: Colors.black26,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Skeleton(height: 10.h,width: width*0.2,),
                Skeleton(height: 10.h,width: width*0.1,),
              ],
            ),
            addH(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Skeleton(height: 10.h,width: width*0.2,),
                Skeleton(height: 10.h,width: width*0.1,),
              ],
            ),
            addH(50.h),
          ],
        ),
      ),
    );
  }
}
