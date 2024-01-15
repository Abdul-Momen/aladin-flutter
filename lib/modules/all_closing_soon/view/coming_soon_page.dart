import 'package:aladin/constants/string.dart';
import 'package:aladin/helper/helper.dart';
import 'package:aladin/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants/color.dart';
import '../../../widget/product_card_withdate.dart';

class ComingSoonPage extends StatelessWidget {
  static String routeName = "/comingSoon";

  const ComingSoonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final SoldOutController soldOutController= Get.find<SoldOutController>();
    return Scaffold(
        appBar: CustomAppBar(title: "Coming Soon",height: 75.h,),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Opacity(
                        opacity: 0.1,
                        child: ProductCardWithDate(
                          onClick: () {},
                          widgetFavorite: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child:SvgPicture.asset(
                              'assets/svg/fav_active.svg',
                              fit: BoxFit.fill,
                            ),),
                          height: 500.h,
                          width: double.infinity,
                          progresswidth: 200.w,
                          borderH: 80.h,
                          borderW: 100.w,
                          soldText: "5655 sold out 5255",
                          progressPersen:0.2,
                          productImg: 'assets/images/money.png',
                          winText: "AED40,000 cash",
                          campaignSubTitle: "AED50.00",
                          image: 'assets/images/win_car.png',
                          date: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.black54, style: BorderStyle.solid)),
                              child: const DrowDate(
                                date: "Max Draw Date: July 29, 2023",
                                campaignStatus: "or earlier if the campaign is ",
                                currentStatus: "Sold Out",
                              )), productPrice: 0, fFirst: '', currency: '',
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 195.h,),
                        child: Center(
                          child: Container(
                            height: 110.h,
                            width: 110.w,
                            decoration: const BoxDecoration(
                              //  borderRadius: BorderRadius.circular(),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/coming_soon.png',
                                  ),
                                  fit: BoxFit.fill,
                                )),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              addH(20.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.h),
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: Colors.black26, width: 0.8)),
                child: Center(
                    child: Text(
                      "Load More Campaign...",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: ConstantStrings.kAppInterSemiBold,
                      ),
                    )),
              ),
              addH(15),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Related Campaign",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: ConstantStrings.kAppInterSemiBold,
                          fontSize: 24.sp),),
                    InkWell(
                      onTap: (){},
                      child: SizedBox(
                        height: 16.h,
                        // width: 60.w,
                        child: Text('View All',
                            style: TextStyle(
                              color: ConstantColors.darkYellow,
                              fontFamily:
                              ConstantStrings.kAppInterBold,
                              fontSize: 14,
                            )),
                      ),
                    )
                  ],
                ),
              ),

              addH(10),
              SizedBox(
                  height: 510.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10, left: 10),
                        child: ProductCardWithDate(
                          onClick: () {},
                          widgetFavorite: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: SvgPicture.asset(
                              'assets/svg/fav.svg',
                              fit: BoxFit.fill,
                            ),),
                          height: 500.h,
                          width: 348.w,
                          progresswidth: 140.w,
                          borderH: 80.h,
                          borderW: 60.w,
                          soldText: "5655 sold out 5255",
                          progressPersen: 0.2,
                          productImg: 'assets/images/intro.jpeg',
                          winText: "AED40,000 cash",
                          campaignSubTitle: "AED50.00",
                          image: '',
                          date: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.black54,
                                      style: BorderStyle.solid)),
                              child: const DrowDate(
                                date: "Max Draw Date: July 29, 2023",
                                campaignStatus:
                                "or earlier if the campaign is ",
                                currentStatus: "Sold Out",
                              )), productPrice: 00, fFirst: '00', currency: '',
                        ),
                      );
                    },
                  )),
              addH(20),
            ],
          ),
        ));
  }
}
