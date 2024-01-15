import 'package:aladin/widget/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helper/helper.dart';

class DrowDateSkeleton extends StatelessWidget {


  const DrowDateSkeleton(
      {Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        Skeleton(height: 30.h,width: 30,),
        addW(10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Skeleton(height: 12.h,width: 180.w,),
            addH(5.h),
            Row(children: [
              Skeleton(height: 10.h,width: 100.w,),
              Skeleton(height: 10.h,width: 100.w,),
            ],)
          ],)
      ],),
    );


  }
}

class ProductImgSkeleton extends StatelessWidget {
  const ProductImgSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Skeleton(
          height: 275,
          width: double.infinity,
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: Skeleton(height: 100.h,width: 100.w,))
      ],
    );
  }
}

class PriceDetailsSkeleton extends StatelessWidget {
  const PriceDetailsSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Skeleton(height: 10,width: width*0.4,),
        addH(10),
        Skeleton(height: 12,width: width*0.6),
        addH(10),
        Skeleton(height: 10,width: width*0.5,),
        addH(20),
        Skeleton(height: 10,width: width*0.3,),
        addH(10),
        Skeleton(height: 10,width: width*0.7,),
        addH(10),
        Skeleton(height: 10,width: width*0.4,),
        addH(10),
        Skeleton(height: 10,width: width*0.7,),
        addH(10),
        Skeleton(height: 10,width: width*0.6,),
        addH(20),
        Skeleton(height: 10,width: width*0.2,),
        addH(10),
        Skeleton(height: 10,width: width,),
        addH(10),
        Skeleton(height: 10,width: width,),
        addH(10),
        Skeleton(height: 10,width: width,),
        addH(10),
        Skeleton(height: 10,width: width,),
        addH(20),
        Skeleton(height: 10,width: width*0.2,),
        addH(10),
        Skeleton(height: 10,width: width,),
        addH(10),
        Skeleton(height: 10,width: width,),
        addH(10),
        Skeleton(height: 10,width: width,),
      ],
    );
  }
}




class ProductDetailsSkeleton extends StatelessWidget {
  const ProductDetailsSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Skeleton(height: 10,width: width*0.4,),
        addH(10),
        Skeleton(height: 12,width: width*0.6),
        addH(10),
        Skeleton(height: 10,width: width*0.5,),
        addH(20),
        Skeleton(height: 10,width: width*0.2,),
        addH(10),
        Skeleton(height: 10,width: width,),
        addH(10),
        Skeleton(height: 10,width: width,),
        addH(10),
        Skeleton(height: 10,width: width,),
        addH(10),
        Skeleton(height: 10,width: width,),
        addH(20),
        Skeleton(height: 10,width: width*0.2,),
        addH(10),
        Skeleton(height: 10,width: width,),
        addH(10),
        Skeleton(height: 10,width: width,),
        addH(10),
        Skeleton(height: 10,width: width,),
      ],
    );
  }
}

class RelatedCampaignSkeleton extends StatelessWidget {
  const RelatedCampaignSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 2.0),
      child: Container(
        height: 498.h,
        width: 348.w,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(1.2, 3.3),
              blurRadius: 2,
              spreadRadius: 0.1,
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
                    width: 60.w,
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
      ),
    );
  }
}
