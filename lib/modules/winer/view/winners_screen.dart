import 'package:aladin/modules/home/controller/homepage_controller.dart';
import 'package:aladin/modules/home/view/screens/home_screen.dart';
import 'package:aladin/modules/home/view/widget/running_campaign_skeleton.dart';
import 'package:aladin/modules/winer/controller/winner_controller.dart';
import 'package:aladin/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constants/color.dart';
import '../../../helper/helper.dart';
import '../../../widget/custom_navigation_bar.dart';
import '../../home/view/widget/winner_item.dart';

class WinnerScreen extends StatefulWidget {
  static String routeName = "/winnerScreen";

  const WinnerScreen({Key? key}) : super(key: key);

  @override
  State<WinnerScreen> createState() => _WinnerScreenState();
}

class _WinnerScreenState extends State<WinnerScreen> {
  final WinnerController winnerController = Get.put(WinnerController());
  final HomePageController homePageController = Get.put(HomePageController());
  int pId = 18;

  @override
  void initState() {
    if (Get.arguments != null) {
      // pId = int.parse(Get.arguments[0]);
    }
    homePageController.getRelatedList(ProductId: pId);
    winnerController.getWinnerAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 65.h,
        title: "Winners",
        onBack: (){
          Get.offAllNamed(HomeScreen.routeName);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              if (winnerController.pWinnerAllLoading.value) {
                return  Padding(
                  padding:  EdgeInsets.only(top: 150),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: ConstantColors.darkYellow,
                    ),
                  ),
                );
              /*  return const RunningCampaignSkeleton();*/
              } else {
                // var apiPath = winnerController.winnerAllListModel!.data;
                var apiPath = winnerController.winnersListModel!.data;

                if (winnerController
                    .winnersListModel!.data.winners.isNotEmpty) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: [
                            SizedBox(
                              child: GridView.builder(
                                itemCount: winnerController
                                    .winnersListModel!
                                    .data
                                    .winners
                                    .length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                     //   crossAxisSpacing: 0,
                                        mainAxisSpacing: 5.h,
                                        crossAxisCount: 2,
                                        mainAxisExtent: 400.h),
                                itemBuilder: (context, index) {
                                 /* return const WinCard();*/

                                  return WinnerItems(
                                    winner:winnerController
                                        .winnersListModel!
                                        .data
                                        .winners[index],
                                  );
                                },
                              ),
                            ),
                         //   addH(24.h),
                        /*    Container(
                              height: 50.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.black26, width: 0.8)),
                              child: Center(
                                  child: Text(
                                "Load More Campaign",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: ConstantStrings.kAppInterSemiBold,
                                ),
                              )),
                            ),
                            addH(20.h),
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
                                      width: 60.w,
                                      child: Image.asset(
                                        "assets/images/view_all.png",
                                        fit: BoxFit.fill,
                                      )),
                                )
                              ],
                            ),*/
                          ],
                        ),
                      ),
                      addH(10),
                    ],
                  );
                } else {
                  return const Center(child: Text('list is empty'));
                }
              }
            }),
/*            Obx(() {
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
                        var percent = homePageController.relatedListModel!.data
                            .campaigns[index].soldQty *
                            1.0 /
                            homePageController.relatedListModel!.data
                                .campaigns[index].productLimit;
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
                            "${homePageController.relatedListModel!.data.campaigns[index].soldQty} sold out ${homePageController.relatedListModel!.data.campaigns[index].productLimit}",
                            progressPersen: percent,
                            productImg:
                            'https://freepngimg.com/thumb/car/3-2-car-free-download-png.png',
                            winText: homePageController.relatedListModel!.data.campaigns[index]
                                .productName,
                            campaignSubTitle: homePageController.relatedListModel!.data.campaigns[index]
                                .campaignSubTitle,
                            image:
                            'https://starpng.com/public/uploads/preview/stack-of-dollar-bills-money-1015763302064gykutmnlw.png',
                            date: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.grey.shade200,
                                        style: BorderStyle.solid)),
                                child: DrowDate(
                                  date:
                                  "Max Drow Date: ${homePageController.relatedListModel!.data.campaigns[index].announcedDate}",
                                  campaignStatus:
                                  "or earlier if the campaign is ",
                                  currentStatus: "Sold Out",
                                )),
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
            addH(20),*/
          ],
        ),
      ),
        bottomNavigationBar: CustomBottomNavigation(
          selectedNavIndex: 2,
        )
    );
  }
}
