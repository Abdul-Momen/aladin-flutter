import 'package:aladin/constants/color.dart';
import 'package:aladin/constants/string.dart';
import 'package:aladin/helper/helper.dart';
import 'package:aladin/modules/all_campaign/view/all_campaign.dart';
import 'package:aladin/modules/all_sold_out/view/sold_out.dart';
import 'package:aladin/modules/campaign_details/view/screen/campaign_details.dart';
import 'package:aladin/modules/cart/controller/cart_controller.dart';
import 'package:aladin/modules/home/controller/homepage_controller.dart';
import 'package:aladin/modules/home/view/widget/closing_soon_item.dart';
import 'package:aladin/modules/home/view/widget/closing_soon_skeleton.dart';
import 'package:aladin/modules/home/view/widget/running_campaign_skeleton.dart';
import 'package:aladin/modules/home/view/widget/sold_out.dart';
import 'package:aladin/modules/home/view/widget/win_grid_product_item.dart';
import 'package:aladin/modules/home/view/widget/wingridviewItem_skeleton.dart';
import 'package:aladin/modules/home/view/widget/winner_item.dart';
import 'package:aladin/modules/home/view/widget/winner_item_skeleton.dart';
import 'package:aladin/modules/home/view/widget/winner_show_card.dart';
import 'package:aladin/modules/winer/view/winners_screen.dart';
import 'package:aladin/modules/wishlist/controller/wishlist_controller.dart';
import 'package:aladin/states/data/prefs.dart';
import 'package:aladin/widget/appbar_1.dart';
import 'package:aladin/widget/custom_elevated_button.dart';
import 'package:aladin/widget/product_card_withdate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../widget/custom_navigation_bar.dart';
import '../../../../auth/view/Login.dart';
import '../../../model/campaign_runing_model.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/homePage";
  final HomePageController homePageController;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomePage({
    Key? key,
    required this.scaffoldKey,
    required this.homePageController,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CartController _cartController = Get.put(CartController());
  final WishlistController wishlistController = Get.put(WishlistController());

  @override
  void initState() {
    print("Test logged in flag ${Preference.getLoggedInFlag()}");

    print("Preference.getCountryId() ${Preference.getCountryId()}");
    // TODO: implement initState
    widget.homePageController.getRunningCampaign(Preference.getCountryId());
    widget.homePageController.getClosingSoon(Preference.getCountryId());
    widget.homePageController.getALlRunningCampaign(Preference.getCountryId());
    widget.homePageController.getSoldOut(Preference.getCountryId());
    widget.homePageController.getWinner(Preference.getCountryId());

    _cartController.getCartCount(memberId: Preference.getMemberId());

    super.initState();
  }

  bool activeWish = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 900.h,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(children: [
                      Container(
                        height: 470.h,
                        width: double.infinity,
                        alignment: Alignment.bottomCenter,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/home_bg.png',
                                ),
                                fit: BoxFit.fill),
                            color: Colors.black),
                        child: Padding(
                          padding: EdgeInsets.all(20.0.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/win_tofe.png",
                                      ),
                                      Text(
                                        "One Year\nfree stay\nat the Burj\nKhalifa",
                                        style: TextStyle(
                                            fontFamily:
                                                ConstantStrings.kAppInterBold,
                                            fontSize: 25.sp,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      RichText(
                                          textAlign: TextAlign.right,
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: "Spend ",
                                                style: TextStyle(
                                                    fontFamily: ConstantStrings
                                                        .kAppInterRegular,
                                                    color: Colors.white)),
                                            TextSpan(
                                                text: "AED 100.00\n",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: ConstantStrings
                                                      .kAppInterBold,
                                                )),
                                            TextSpan(
                                                text: "and make it yours!",
                                                style: TextStyle(
                                                    fontFamily: ConstantStrings
                                                        .kAppInterRegular,
                                                    color: Colors.white))
                                          ])),
                                      addH(15.h),
                                    /*  CustomElevatedButton(
                                        width: 136.w,
                                        height: 40.h,
                                        onPressed: () {
                                          *//*   Get.toNamed(
                                              CampaignDetailsScreen.routeName);*//*
                                        },
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              ConstantColors.lightYellow,
                                              ConstantColors.darkYellow,
                                            ]),
                                        borderRadius: BorderRadius.circular(5),
                                        child: Text('See Details',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: ConstantStrings
                                                    .kAppInterSemiBold,
                                                color: Colors.white)),
                                      )*/
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Appbar1(
                        scaffoldKey: widget.scaffoldKey,
                      ),
                    ]),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0.w),
                      child: Column(
                        children: [
                          addH(15.h),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Closing Soon",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontFamily: ConstantStrings.kAppInterSemiBold,
                                  color: Colors.black),
                            ),
                          ),
                          addH(10.h),
                          //Closing soon ListView
                          Obx(() {
                            if (widget
                                .homePageController.pClosingLoading.value) {
                              return const ClosingSoonSkeleton();
                            } else {
                              if (widget.homePageController.closingSoon!.data
                                  .campaigns.isNotEmpty) {
                                return LimitedBox(
                                  maxHeight: 195.h,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: widget
                                              .homePageController
                                              .closingSoon!
                                              .data
                                              .campaigns
                                              .length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                                onTap: () => Get.toNamed(
                                                        CampaignDetailsScreen
                                                            .routeName,
                                                        arguments: [
                                                          widget
                                                              .homePageController
                                                              .closingSoon!
                                                              .data
                                                              .campaigns[index]
                                                              .productId
                                                              .toString()
                                                        ]),
                                                child: ClosingSoonItem(
                                                  campaign: widget
                                                      .homePageController
                                                      .closingSoon!
                                                      .data
                                                      .campaigns[index],
                                                ));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return const Text("");
                              }
                            }
                          }),
                          addH(10.h),
                          Padding(
                            padding: EdgeInsets.only(right: 15.0.w),
                            child: Column(
                              children: [
                                addH(10.h),
                                //winner show card
                                const WinnersShowCard(),
                                // addH(15.h),
                                //RunningCampaignSkeleton(),
                                addH(15),
                                //Win Product ListView
                                Obx(() {
                                  if (widget.homePageController.pCampaignLoading
                                      .value) {
                                    return const RunningCampaignSkeleton();
                                  } else {
                                    if (widget
                                        .homePageController
                                        .runningCampaign!
                                        .data
                                        .campaigns
                                        .isNotEmpty) {
                                      var apiPath = widget.homePageController
                                          .runningCampaign!.data;

                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            child: ListView.builder(
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  apiPath.campaigns.length,
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                // var percent =  / ;
                                                var percent = widget
                                                        .homePageController
                                                        .runningCampaign!
                                                        .data
                                                        .campaigns[index]
                                                        .soldQty *
                                                    1.0 /
                                                    widget
                                                        .homePageController
                                                        .runningCampaign!
                                                        .data
                                                        .campaigns[index]
                                                        .ticketQty;
                                                String prizeText = apiPath
                                                    .campaigns[index].prizeName;
                                                String prizeImage = apiPath
                                                    .campaigns[index]
                                                    .prizeImage;
                                                List<PrizeFor> prizeForUae =
                                                    widget
                                                        .homePageController
                                                        .runningCampaign!
                                                        .data
                                                        .campaigns[index]
                                                        .prizeForUae;
                                                List<PrizeFor> prizeForIndia =
                                                    widget
                                                        .homePageController
                                                        .runningCampaign!
                                                        .data
                                                        .campaigns[index]
                                                        .prizeForIndia;

                                                if (Preference.getCountryId() ==
                                                    prizeForUae[0].countryId) {
                                                  prizeImage =
                                                      prizeForUae[0].prizeImage;
                                                  prizeText =
                                                      prizeForUae[0].prizeName;
                                                } else {
                                                  prizeImage = prizeForIndia[0]
                                                      .prizeImage;
                                                  prizeText = prizeForIndia[0]
                                                      .prizeName;
                                                }
                                                print("percentage % $percent");
                                                return InkWell(
                                                  onTap: () => Get.toNamed(
                                                      CampaignDetailsScreen
                                                          .routeName,
                                                      arguments: [
                                                        widget
                                                            .homePageController
                                                            .runningCampaign!
                                                            .data
                                                            .campaigns[index]
                                                            .productId
                                                            .toString()
                                                      ]),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 10),
                                                    child: ProductCardWithDate(
                                                      onClick: () {
                                                        if (Preference
                                                            .getLoggedInFlag()) {
                                                          _cartController
                                                              .postAddCart(
                                                            memberId: Preference
                                                                .getMemberId(),
                                                            cookieId: '',
                                                            productId: widget
                                                                .homePageController
                                                                .runningCampaign!
                                                                .data
                                                                .campaigns[
                                                                    index]
                                                                .productId,
                                                            qty: 1,
                                                          );
                                                          Get.defaultDialog(
                                                            title:
                                                                "Please wait..",
                                                            content: Obx(
                                                              () {
                                                                if (_cartController
                                                                    .pAddCartLoading
                                                                    .value) {
                                                                  return  Column(
                                                                    children: [
                                                                      Center(
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                              color: ConstantColors.darkYellow,

                                                                            ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                } else {
                                                                  if (_cartController
                                                                      .addToListCartModel!
                                                                      .isSuccess) {
                                                                    Future
                                                                        .delayed(
                                                                      const Duration(
                                                                          seconds:
                                                                              1),
                                                                      () {
                                                                        setState(
                                                                            () {
                                                                          Get.back();
                                                                        });
                                                                      },
                                                                    );
                                                                    return const Text(
                                                                        'Added to cart');
                                                                  } else {
                                                                    return const Text(
                                                                        'Could not add to wishlist');
                                                                  }
                                                                }
                                                              },
                                                            ),
                                                          );

                                                          /* Get.toNamed(SoldOutScreen
                                                            .routeName);*/
                                                        } else {
                                                          Get.toNamed(LoginPage
                                                              .routeName);
                                                        }
                                                      },
                                                      height: 500.h,
                                                      width: double.infinity,
                                                      widgetFavorite: InkWell(
                                                        onTap: () {
                                                          if (Preference
                                                              .getLoggedInFlag()) {
                                                            setState(() {
                                                              if (widget
                                                                      .homePageController
                                                                      .runningCampaign!
                                                                      .data
                                                                      .campaigns[
                                                                          index]
                                                                      .isWish ==
                                                                  false) {
                                                                widget
                                                                    .homePageController
                                                                    .runningCampaign!
                                                                    .data
                                                                    .campaigns[
                                                                        index]
                                                                    .isWish = true;
                                                                wishlistController.postAddWishList(
                                                                    memberId:
                                                                        Preference
                                                                            .getMemberId(),
                                                                    sessionId:
                                                                        '',
                                                                    productId: widget
                                                                        .homePageController
                                                                        .runningCampaign!
                                                                        .data
                                                                        .campaigns[
                                                                            index]
                                                                        .productId,
                                                                    qty: 0);
                                                                Get.defaultDialog(
                                                                  title:
                                                                      "Please wait..",
                                                                  content: Obx(
                                                                    () {
                                                                      if (wishlistController
                                                                          .pAddWishListLoading
                                                                          .value) {
                                                                        return  Column(
                                                                          children: [
                                                                            Center(
                                                                              child: CircularProgressIndicator(
                                                                                color: ConstantColors.darkYellow,

                                                                              ),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      } else {
                                                                        if (wishlistController
                                                                            .addWishListModel!
                                                                            .isSuccess) {
                                                                          Future
                                                                              .delayed(
                                                                            const Duration(seconds: 1),
                                                                            () {
                                                                              setState(() {
                                                                                Get.back();
                                                                              });
                                                                            },
                                                                          );
                                                                          return const Text(
                                                                              'Added to wishlist');
                                                                        } else {
                                                                          return const Text(
                                                                              'Could not add to wishlist');
                                                                        }
                                                                      }
                                                                    },
                                                                  ),
                                                                );
                                                              } else {
                                                                widget
                                                                    .homePageController
                                                                    .runningCampaign!
                                                                    .data
                                                                    .campaigns[
                                                                        index]
                                                                    .isWish = false;
                                                                wishlistController.postAddWishList(
                                                                    memberId:
                                                                        Preference
                                                                            .getMemberId(),
                                                                    sessionId:
                                                                        '',
                                                                    productId: widget
                                                                        .homePageController
                                                                        .runningCampaign!
                                                                        .data
                                                                        .campaigns[
                                                                            index]
                                                                        .productId,
                                                                    qty: 0);
                                                                Get.defaultDialog(
                                                                  title:
                                                                      "Please wait..",
                                                                  content: Obx(
                                                                    () {
                                                                      if (wishlistController
                                                                          .pAddWishListLoading
                                                                          .value) {
                                                                        return  Column(
                                                                          children: [
                                                                            Center(
                                                                              child: CircularProgressIndicator(
                                                                                color: ConstantColors.darkYellow,

                                                                              ),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      } else {
                                                                        if (wishlistController
                                                                            .addWishListModel!
                                                                            .isSuccess) {
                                                                          Future
                                                                              .delayed(
                                                                            const Duration(seconds: 1),
                                                                            () {
                                                                              setState(() {
                                                                                Get.back();
                                                                              });
                                                                            },
                                                                          );
                                                                          return const Text(
                                                                              'Removed from wishlist');
                                                                        } else {
                                                                          return const Text(
                                                                              'Could not remove');
                                                                        }
                                                                      }
                                                                    },
                                                                  ),
                                                                );
                                                              }
                                                            });
                                                          } else {
                                                            Get.toNamed(
                                                                LoginPage
                                                                    .routeName);
                                                          }
                                                        },
                                                        child: widget
                                                                    .homePageController
                                                                    .runningCampaign!
                                                                    .data
                                                                    .campaigns[
                                                                        index]
                                                                    .isWish ==
                                                                true
                                                            ? Container(
                                                                height: 40.h,
                                                                width: 40.w,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.r),
                                                                ),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/svg/fav_active.svg',
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              )
                                                            : Container(
                                                                height: 40.h,
                                                                width: 40.w,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.r),
                                                                ),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/svg/fav.svg',
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                      ),
                                                      progresswidth: 110.w,
                                                      borderH: 60.h,
                                                      borderW: 100.w,
                                                      soldText:
                                                          "${apiPath.campaigns[index].soldQty.toString()} Sold out of ${apiPath.campaigns[index].ticketQty.toString()}",
                                                      progressPersen: percent,
                                                      productImg: apiPath
                                                          .campaigns[index]
                                                          .productImage,
                                                      winText: prizeText,
                                                      fFirst: apiPath
                                                          .campaigns[index]
                                                          .productName,
                                                      campaignSubTitle: apiPath
                                                          .campaigns[index]
                                                          .campaignSubTitle,
                                                      campaignTitle: apiPath
                                                          .campaigns[index]
                                                          .campaignTitle,
                                                      image: prizeImage,
                                                      date: Container(
                                                          height: 56.h,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black54,
                                                                  style: BorderStyle
                                                                      .solid)),
                                                          child: DrowDate(
                                                            date:
                                                                "Max Draw Date: ${apiPath.campaigns[index].declareDate.toString()}",
                                                            campaignStatus:
                                                                "or earlier if the campaign is ",
                                                            currentStatus:
                                                                "Sold Out",
                                                          )),
                                                      productPrice: apiPath
                                                          .campaigns[index]
                                                          .price,
                                                      currency: apiPath
                                                          .campaigns[index]
                                                          .currency,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return const Text("");
                                    }
                                  }
                                }),

                                //win grid product listView

                                Obx(() {
                                  if (widget.homePageController
                                      .pAllCampaignLoading.value) {
                                    return const WinGridViewSkeleton();
                                  } else {
                                    if (widget
                                        .homePageController
                                        .allRunningCampaign!
                                        .data
                                        .campaigns
                                        .isNotEmpty) {
                                      var apiPath = widget.homePageController
                                          .allRunningCampaign!.data;
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            child: GridView.builder(
                                              scrollDirection: Axis.vertical,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount:
                                                  apiPath.campaigns.length,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisSpacing: 10.w,
                                                      mainAxisSpacing: 10.h,
                                                      crossAxisCount: 2,
                                                      mainAxisExtent: 291.h),
                                              itemBuilder: (context, index) {
                                                /*            var percentage = widget
                                                        .homePageController
                                                        .runningCampaign!
                                                        .data
                                                        .campaigns[index]
                                                        .soldQty *
                                                    1.0 /
                                                    widget
                                                        .homePageController
                                                        .runningCampaign!
                                                        .data
                                                        .campaigns[index]
                                                        .producttLimit;
*/
                                                return InkWell(
                                                    onTap: () => Get.toNamed(
                                                            CampaignDetailsScreen
                                                                .routeName,
                                                            arguments: [
                                                              widget
                                                                  .homePageController
                                                                  .allRunningCampaign!
                                                                  .data
                                                                  .campaigns[
                                                                      index]
                                                                  .productId
                                                                  .toString()
                                                            ]),
                                                    child: WinGridViewItems(
                                                      campaign: widget
                                                          .homePageController
                                                          .allRunningCampaign!
                                                          .data
                                                          .campaigns[index],
                                                      onTapCart: () {
                                                        if (Preference
                                                            .getLoggedInFlag()) {
                                                          _cartController
                                                              .postAddCart(
                                                            memberId: Preference
                                                                .getMemberId(),
                                                            cookieId: '',
                                                            productId: widget
                                                                .homePageController
                                                                .allRunningCampaign!
                                                                .data
                                                                .campaigns[
                                                                    index]
                                                                .productId,
                                                            qty: 1,
                                                          );

                                                          Get.defaultDialog(
                                                            title: "Please wait..",
                                                            content: Obx(
                                                              () {
                                                                if (_cartController
                                                                    .pAddCartLoading
                                                                    .value) {
                                                                  return  Column(
                                                                    children: [
                                                                      Center(
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                              color: ConstantColors.darkYellow,

                                                                            ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                } else {
                                                                  if (_cartController
                                                                      .addToListCartModel!
                                                                      .isSuccess) {
                                                                    Future
                                                                        .delayed(
                                                                      const Duration(
                                                                          seconds:
                                                                              1),
                                                                      () {
                                                                        setState(
                                                                            () {
                                                                          Get.back();
                                                                        });
                                                                      },
                                                                    );
                                                                    return const Text(
                                                                        'Added to cart');
                                                                  } else {
                                                                    return const Text(
                                                                        'Could not add to cart');
                                                                  }
                                                                }
                                                              },
                                                            ),
                                                          );

                                                          /*Get.toNamed(
                                                            MyCartPage.routeName);*/
                                                        } else {
                                                          Get.toNamed(LoginPage
                                                              .routeName);
                                                        }
                                                      },
                                                    ));
                                                //WinGridViewSkeleton();
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return const Text("");
                                    }
                                  }
                                }),
                                addH(24.h),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(AllCampaignScreen.routeName);
                                  },
                                  child: Container(
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
                                        fontFamily:
                                            ConstantStrings.kAppInterSemiBold,
                                      ),
                                    )),
                                  ),
                                ),

                                //win grid sold out product listView
                                Obx(() {
                                  if (widget.homePageController.pSoldOutLoading
                                      .value) {
                                    return const WinGridViewSkeleton();
                                  } else {
                                    if (widget.homePageController.soldOutModel!
                                        .data.campaigns.isNotEmpty) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          addH(20.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Sold Out",
                                                style: TextStyle(
                                                    fontSize: 24.sp,
                                                    fontFamily: ConstantStrings
                                                        .kAppInterSemiBold,
                                                    color: Colors.black),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.toNamed(
                                                      SoldOutScreen.routeName);
                                                },
                                                child: SizedBox(
                                                  height: 16.h,
                                                  //  width: 60.w,
                                                  child: Text('View All',
                                                      style: TextStyle(
                                                        color: ConstantColors
                                                            .darkYellow,
                                                        fontFamily:
                                                            ConstantStrings
                                                                .kAppInterBold,
                                                        fontSize: 14,
                                                      )),
                                                ),
                                              )
                                            ],
                                          ),
                                          addH(20),
                                          Flexible(
                                            child: GridView.builder(
                                              scrollDirection: Axis.vertical,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: widget
                                                  .homePageController
                                                  .soldOutModel!
                                                  .data
                                                  .campaigns
                                                  .length,
                                              shrinkWrap: true,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisSpacing: 10.w,
                                                      mainAxisSpacing: 10.h,
                                                      crossAxisCount: 2,
                                                      mainAxisExtent: 295.h),
                                              itemBuilder: (context, index) {
                                                return Stack(
                                                  children: [
                                                    Opacity(
                                                      opacity: 0.1,
                                                      child: SoldOutItems(
                                                        campaign: widget
                                                            .homePageController
                                                            .soldOutModel!
                                                            .data
                                                            .campaigns[index],
                                                        onTapCart: () {},
                                                      ),
                                                    ),
                                                    Positioned(
                                                        child: Center(
                                                      child: Container(
                                                        height: 90.h,
                                                        width: 90.w,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        90.r)),
                                                        child: Center(
                                                          child: Image.asset(
                                                            'assets/images/sold_out.png',
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return const Text("");
                                    }
                                  }
                                }),

                                addH(30.h),
                              ],
                            ),
                          ),

                          Obx(() {
                            print(
                                "pRecentWinnerLoading ${widget.homePageController.pRecentWinnerLoading.value}");
                            if (widget.homePageController.pRecentWinnerLoading
                                .value) {
                              return const WinnerItemsSkeleton();
                            } else {
                              if (widget.homePageController.winnersListModel!
                                  .data.winners.isNotEmpty) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Column(
                                    children: [
                                      addH(15.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Winners",
                                            style: TextStyle(
                                                fontSize: 24.sp,
                                                fontFamily: ConstantStrings
                                                    .kAppInterSemiBold,
                                                color:
                                                    ConstantColors.grayBlack),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed(
                                                  WinnerScreen.routeName);
                                            },
                                            child: SizedBox(
                                              height: 16.h,
                                              // width: 60.w,
                                              child: Text('View All',
                                                  style: TextStyle(
                                                    color: ConstantColors
                                                        .darkYellow,
                                                    fontFamily: ConstantStrings
                                                        .kAppInterBold,
                                                    fontSize: 14,
                                                  )),
                                            ),
                                          )
                                        ],
                                      ),
                                      addH(20),
                                      SizedBox(
                                        height: 410.h,
                                        width: double.infinity,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: widget
                                                .homePageController
                                                .winnersListModel!
                                                .data
                                                .winners
                                                .length,
                                            // shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return WinnerItems(
                                                winner: widget
                                                    .homePageController
                                                    .winnersListModel!
                                                    .data
                                                    .winners[index],
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return const Text("");
                              }
                            }
                          }),
                        ],
                      ),
                    ),
                    addH(20.h),
                    //app bar
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        selectedNavIndex: 0,
      ),
    );
  }
}
