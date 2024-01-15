import 'package:aladin/constants/string.dart';
import 'package:aladin/helper/helper.dart';
import 'package:aladin/modules/all_sold_out/controller/sold_out_controller.dart';
import 'package:aladin/modules/all_sold_out/view/widget/sold_out_items.dart';
import 'package:aladin/modules/campaign_details/view/widget/campaign_details_skeleton.dart';
import 'package:aladin/modules/home/controller/homepage_controller.dart';
import 'package:aladin/modules/home/view/widget/wingridviewItem_skeleton.dart';
import 'package:aladin/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../constants/color.dart';
import '../../../widget/product_card_withdate.dart';

class SoldOutScreen extends StatefulWidget {
  static String routeName = "/soldOut";

  const SoldOutScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SoldOutScreen> createState() => _SoldOutScreenState();
}

class _SoldOutScreenState extends State<SoldOutScreen> {
  final HomePageController homePageController = Get.put(HomePageController());
  final SoldOutController soldOutController = Get.put(SoldOutController());
  int pId = 20;

  @override
  void initState() {
    // TODO: implement initState
    homePageController.getRelatedList(ProductId: pId);
    soldOutController.getAllSoldOut();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final SoldOutController soldOutController= Get.find<SoldOutController>();
    return Scaffold(
        appBar: CustomAppBar(
          title: "Sold Out",
          height: 75.h,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() {
                if (soldOutController.pAllSoldOutLoading.value) {
                  return  Center(
                    child: CircularProgressIndicator(
                      color: ConstantColors.darkYellow,

                    ),
                  );
                 // return const WinGridViewSkeleton();
                } else {
                  if (soldOutController
                      .allSoldOutModel!.data.campaigns.isNotEmpty) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Column(
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: soldOutController
                                .allSoldOutModel!.data.campaigns.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 10,
                                    crossAxisCount: 2,
                                    mainAxisExtent: 291.h),
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Opacity(
                                    opacity: 0.5,
                                    child: AllSoldOutItems(
                                      campaign: soldOutController
                                          .allSoldOutModel!
                                          .data
                                          .campaigns[index],
                                      onTapCart: () {},
                                    ),
                                  ),
                                  Positioned(
                                      child: Center(
                                    child: Container(
                                      height: 70.h,
                                      width: 70.w,
                                      decoration: const BoxDecoration(
                                          //  borderRadius: BorderRadius.circular(),
                                          image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/sold_out.png',
                                        ),
                                        fit: BoxFit.fill,
                                      )),
                                    ),
                                  )),
                                ],
                              );
                            },
                          ),
                          addH(15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Related Campaign",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily:
                                        ConstantStrings.kAppInterSemiBold,
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
                                        fontFamily:
                                            ConstantStrings.kAppInterBold,
                                        fontSize: 14,
                                      )),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Text("List is Empty");
                  }
                }
              }),
              addH(10),
              Obx(() {
                if (homePageController.pRelatedLoading.value) {
                  return const RelatedCampaignSkeleton();
                } else {
                  if (homePageController
                      .relatedListModel!.data.campaigns.isNotEmpty) {
                    return SizedBox(
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
                                  .campaigns[index].ticketQty;
                          return Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 0.0, 8.0, 2.0),
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
                                ),
                              ),
                              height: 480.h,
                              fFirst: homePageController.relatedListModel!.data
                                  .campaigns[index].productName,
                              width: 348.w,
                              progresswidth: 160.w,
                              borderH: 80.h,
                              borderW: 60.w,
                              soldText:
                                  "${homePageController.relatedListModel!.data.campaigns[index].soldQty} sold out ${homePageController.relatedListModel!.data.campaigns[index].ticketQty}",
                              progressPersen: percent,
                              productImg: homePageController.relatedListModel!
                                  .data.campaigns[index].productImage,
                              // 'https://freepngimg.com/thumb/car/3-2-car-free-download-png.png',
                              winText: homePageController.relatedListModel!.data
                                  .campaigns[index].prizeName,
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
                                        "Max Draw Date: ${homePageController.relatedListModel!.data.campaigns[index].announcedDate}",
                                    campaignStatus:
                                        "or earlier if the campaign is ",
                                    currentStatus: "Sold Out",
                                  )),
                              productPrice: homePageController.relatedListModel!
                                  .data.campaigns[index].price, currency: homePageController.relatedListModel!
                                .data.campaigns[index].currency,
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Text("list is Empty");
                  }
                }
              }),
              addH(20),
            ],
          ),
        ));
  }
}
