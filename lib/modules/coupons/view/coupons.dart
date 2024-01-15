import 'package:aladin/constants/color.dart';
import 'package:aladin/constants/string.dart';
import 'package:aladin/helper/helper.dart';
import 'package:aladin/modules/coupons/controller/coupons_controller.dart';
import 'package:aladin/modules/coupons/view/widget/coupons_skeleton.dart';
import 'package:aladin/modules/home/controller/homepage_controller.dart';
import 'package:aladin/modules/home/view/screens/home_screen.dart';
import 'package:aladin/states/data/prefs.dart';
import 'package:aladin/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../widget/custom_navigation_bar.dart';


class CouponsScreen extends StatefulWidget {
  static String routeName = "/couponScreen";

  const CouponsScreen({super.key});

  @override
  State<CouponsScreen> createState() => _CouponsScreenState();
}

class _CouponsScreenState extends State<CouponsScreen> {
  final HomePageController homePageController = Get.find<HomePageController>();
  final CouponsController couponsController = Get.put(CouponsController());
  int pId = 15;

  @override
  void initState() {
    if (Get.arguments != null) {
      //pId = int.parse(Get.arguments[0]);
    }
    homePageController.getRelatedList(ProductId: pId);
    couponsController.getTicket(memberId: Preference.getMemberId());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 65.h,
        title: "My Coupons",
        onBack: () {
          Get.offAllNamed(HomeScreen.routeName);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // CouponsSkeleton(),
              addH(10.h),
              Obx(() {
                if (couponsController.pTicketLoading.value) {
                  return  Padding(
                    padding:  EdgeInsets.only(top: 150),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: ConstantColors.darkYellow,
                      ),
                    ),
                  );
                } else {
                  if (couponsController.ticketModel!.data.tickets.isNotEmpty) {
                    return SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            couponsController.ticketModel!.data.tickets.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 140.h,
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Container(
                                      height:120.h,
                                      width: 110.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: ConstantColors.grayShade,
                                              width: 0.5)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.asset(
                                          "assets/images/style.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    addW(10),
                                    Expanded(
                                      child: SizedBox(
                                        height: 120.h,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            /*Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  couponsController
                                                      .ticketModel!
                                                      .data
                                                      .tickets[index]
                                                      .aladinTicketSerial,
                                                  style: TextStyle(
                                                      color: ConstantColors
                                                          .normalTextColor,
                                                      fontFamily:
                                                          ConstantStrings
                                                              .kAppInterRegular,
                                                      fontSize: 16.sp),
                                                ),
                                                Text(couponsController
                                                    .ticketModel!
                                                    .data
                                                    .tickets[index]
                                                    .aladinTicketSerial)
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  couponsController
                                                      .ticketModel!
                                                      .data
                                                      .tickets[index]
                                                      .aladinTicketSerial,
                                                  style: TextStyle(
                                                      color: ConstantColors
                                                          .normalTextColor,
                                                      fontFamily:
                                                      ConstantStrings
                                                          .kAppInterRegular,
                                                      fontSize: 16.sp),
                                                ),
                                                Text(couponsController
                                                    .ticketModel!
                                                    .data
                                                    .tickets[index]
                                                    .aladinTicketSerial)
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  couponsController
                                                      .ticketModel!
                                                      .data
                                                      .tickets[index]
                                                      .aladinTicketSerial,
                                                  style: TextStyle(
                                                      color: ConstantColors
                                                          .normalTextColor,
                                                      fontFamily:
                                                      ConstantStrings
                                                          .kAppInterRegular,
                                                      fontSize: 16.sp),
                                                ),
                                                Text(couponsController
                                                    .ticketModel!
                                                    .data
                                                    .tickets[index]
                                                    .aladinTicketSerial)
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  "",
                                                  style: TextStyle(
                                                      color: ConstantColors
                                                          .normalTextColor,
                                                      fontFamily:
                                                      ConstantStrings
                                                          .kAppInterRegular,
                                                      fontSize: 16.sp),
                                                ),
                                                Text(couponsController.ticketModel!.data.tickets[index].aladinDate.toString())
                                              ],
                                            ),
*/
                                            CouponInfo(
                                                title: "Serial No:",
                                                titleInfo: "#${couponsController
                                                        .ticketModel!
                                                        .data
                                                        .tickets[index]
                                                        .aladinTicketSerial}"),
                                            CouponInfo(
                                                title: "Campaign Prize:",
                                                titleInfo: couponsController
                                                    .ticketModel!
                                                    .data
                                                    .tickets[index]
                                                    .campaignPrize
                                                    .toString()),
                                            CouponInfo(
                                                title: "Purchase Date:",
                                                titleInfo:
                                                    DateFormat('dd/MM/yyyy')
                                                        .format(
                                                            couponsController
                                                                .ticketModel!
                                                                .data
                                                                .tickets[index]
                                                                .purchaseDate)),
                                            CouponInfo(
                                                title: "Draw Date:",
                                                titleInfo:
                                                    DateFormat('dd/MM/yyyy')
                                                        .format(
                                                            couponsController
                                                                .ticketModel!
                                                                .data
                                                                .tickets[index]
                                                                .aladinDate)),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                color: ConstantColors.grayShade,
                                thickness: 0.5,
                                height: 30,
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  } else {
                    return const Text("list is Empty");
                  }
                }
              }),

/*              Obx(() {
                if (homePageController.pRelatedLoading.value) {
                  return const RelatedCampaignSkeleton();
                } else {
                  if (homePageController
                      .relatedListModel!.data.campaigns.isNotEmpty) {
                    return Column(
                      children: [
                        addH(15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Related Campaign",
                              style: TextStyle(
                                  color: ConstantColors.grayBlack,
                                  fontFamily: ConstantStrings.kAppInterSemiBold,
                                  fontSize: 24.sp),
                            ),
                            InkWell(
                              onTap: () {},
                              child: SizedBox(
                                height: 16.h,
                                // width: 60.w,
                                child: Text('View All',
                                    style: TextStyle(
                                      color: ConstantColors.darkYellow,
                                      fontFamily: ConstantStrings.kAppInterBold,
                                      fontSize: 14,
                                    )),
                              ),
                            )
                          ],
                        ),
                        addH(5),
                        SizedBox(
                          height: 502.h,
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: homePageController
                                .relatedListModel!.data.campaigns.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var percent = homePageController.relatedListModel!
                                      .data.campaigns[index].soldQty *
                                  1.0 /
                                  homePageController.relatedListModel!.data
                                      .campaigns[index].productLimit;
                              return ProductCardWithDate(
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
                                  ),
                                ),
                                height: 480.h,
                                fFirst: homePageController.relatedListModel!
                                    .data.campaigns[index].productName,
                                width: 348.w,
                                progresswidth: 160.w,
                                borderH: 80.h,
                                borderW: 60.w,
                                soldText:
                                    "${homePageController.relatedListModel!.data.campaigns[index].soldQty} sold out ${homePageController.relatedListModel!.data.campaigns[index].productLimit}",
                                progressPersen: percent,
                                productImg: homePageController.relatedListModel!
                                    .data.campaigns[index].campaignImage,
                                winText: homePageController.relatedListModel!
                                    .data.campaigns[index].productName,
                                campaignSubTitle: homePageController
                                    .relatedListModel!
                                    .data
                                    .campaigns[index]
                                    .campaignSubTitle,
                                image: homePageController.relatedListModel!.data
                                    .campaigns[index].prizeImage,
                                date: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.grey.shade200,
                                            style: BorderStyle.solid)),
                                    child: DrowDate(
                                      date:
                                          "Max Drow Date: ${DateFormat('dd/MM/yyyy').format(homePageController.relatedListModel!.data.campaigns[index].announcedDate)}",
                                      campaignStatus:
                                          "or earlier if the campaign is ",
                                      currentStatus: "Sold Out",
                                    )),
                                productPrice: homePageController
                                    .relatedListModel!
                                    .data
                                    .campaigns[index]
                                    .price,
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Text("list is Empty");
                  }
                }
              }),*/
              /*SizedBox(
                height: 505.h,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child:
                          //RelatedCampaignSkeleton(),
                          ProductCardWithDate(
                        onClick: () {},
                        icon: Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: SvgPicture.asset(
                            'assets/svg/fav.svg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        height: 480.h,
                        width: 348.w,
                        progresswidth: 160.w,
                        borderH: 80.h,
                        borderW: 60.w,
                        soldText: "5655 sold out 5255",
                        progressPersen: "90.0%",
                        productImg: 'assets/images/win_car.png',
                        winText: "AED40,000 cash",
                        campaignSubTitle: "AED50.00",
                        image: '',
                        date: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                  color: ConstantColors.grayShade,
                                  style: BorderStyle.solid)),
                          child: const DrowDate(
                            date: "Max Draw Date: July 29, 2023",
                            campaignStatus: "or earlier if the campaign is ",
                            currentStatus: "Sold Out",
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),*/
            ],
          ),
        ),
      ),
        bottomNavigationBar: CustomBottomNavigation(
          selectedNavIndex: 3,
        )
    );
  }
}

class CouponInfo extends StatelessWidget {
  final String title;
  final String titleInfo;

  const CouponInfo({super.key, required this.title, required this.titleInfo});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 130.w,
          child: Text(
            title,
            style: TextStyle(
                color: ConstantColors.normalTextColor,
                fontFamily: ConstantStrings.kAppInterRegular,
                fontSize: 16.sp),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              titleInfo,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: ConstantColors.normalTextColor,
                  fontFamily: ConstantStrings.kAppInterBold,
                  fontSize: 16.sp),
            ),
          ),
        ),
      ],
    );
  }
}
