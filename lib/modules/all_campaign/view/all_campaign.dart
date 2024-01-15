import 'package:aladin/constants/color.dart';
import 'package:aladin/modules/campaign_details/view/screen/campaign_details.dart';
import 'package:aladin/modules/home/view/screens/home_page/home_page.dart';
import 'package:aladin/modules/home/view/widget/running_campaign_skeleton.dart';
import 'package:aladin/widget/custom_appbar.dart';
import 'package:aladin/widget/product_card_withdate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../states/controller/country_controller.dart';
import '../../../states/data/prefs.dart';
import '../../../widget/custom_navigation_bar.dart';
import '../../auth/view/Login.dart';
import '../../cart/controller/cart_controller.dart';
import '../../checkout/view/checkout_page.dart';
import '../../home/controller/homepage_controller.dart';
import '../../wishlist/controller/wishlist_controller.dart';

class AllCampaignScreen extends StatefulWidget {
  static String routeName = "/allCampaign";

  const AllCampaignScreen({super.key});

  @override
  State<AllCampaignScreen> createState() => _AllCampaignScreenState();
}

class _AllCampaignScreenState extends State<AllCampaignScreen> {
  final HomePageController homePageController = Get.put(HomePageController());
  final WishlistController wishlistController = Get.put(WishlistController());
  final CartController _cartController = Get.put(CartController());


  @override
  void initState() {
    homePageController.getALlRunningCampaign(Preference.getCountryId());
    // TODO: implement initState
    super.initState();
  }
  bool activeWish = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        /* setState(() {
          addressController.getMemberAddress(
              memberId: Preference.getMemberId());
          Future.delayed(const Duration(seconds: 1), () {
            Get.back();
            Get.offAndToNamed(CheckOutPage.routeName);
          });
        });*/

        /*homePageController.getRunningCampaign(
            Preference.getCountryId());
        homePageController
            .getClosingSoon(Preference.getCountryId());
        homePageController.getALlRunningCampaign(
            Preference.getCountryId());
        homePageController
            .getSoldOut(Preference.getCountryId());
        homePageController
            .getWinner(Preference.getCountryId());

        _cartController.getCartCount(memberId: Preference.getMemberId());
        Get.offAndToNamed(HomePage.routeName);*/
      //  Get.back();
      /*  if (isSideMenuNavigation) {
          Get.back();
        } else {
          Get.back();
          Get.offAndToNamed(CheckOutPage.routeName);
        }*/

        return false;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          height: 75.h,
          title: ""
              "All Campaign",
        ),
        body: Obx(() {
          if (homePageController.pAllCampaignLoading.value) {
            return  Center(
              child: CircularProgressIndicator(
                color: ConstantColors.darkYellow,

              ),
            );
          } else {
            if (homePageController.allRunningCampaign!.data.campaigns.isNotEmpty) {
              var apiPath = homePageController.allRunningCampaign!.data;
              return SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: apiPath.campaigns.length,
                          itemBuilder: (context, index) {
                            // var percent =  / ;
                            var percent = homePageController.allRunningCampaign!.data
                                    .campaigns[index].soldQty *
                                1.0 /
                                homePageController.allRunningCampaign!.data
                                    .campaigns[index].ticketQty;
                            //bool activeWish= homePageController.allRunningCampaign!.data.campaigns[index].isWish;


                            return InkWell(
                              onTap: () => Get.toNamed(
                                  CampaignDetailsScreen.routeName,
                                  arguments: [
                                    homePageController.allRunningCampaign!.data
                                        .campaigns[index].productId
                                        .toString()
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: ProductCardWithDate(
                                  onClick: () {
                                    if (Preference
                                        .getLoggedInFlag()) {
                                      _cartController
                                          .postAddCart(
                                        memberId: Preference
                                            .getMemberId(),
                                        cookieId: '',
                                        productId: homePageController
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

                                                              _cartController.getCartCount(memberId: Preference.getMemberId());
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
                                  height: 500.h,
                                  width: double.infinity,
                                  widgetFavorite: InkWell(
                                    onTap: () {
                                      if (Preference
                                          .getLoggedInFlag()) {
                                        setState(() {
                                          if (homePageController
                                              .allRunningCampaign!
                                              .data
                                              .campaigns[
                                          index]
                                              .isWish ==
                                              false) {
                                            homePageController
                                                .allRunningCampaign!
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
                                                productId:homePageController
                                                    .allRunningCampaign!
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
                                           homePageController
                                                .allRunningCampaign!
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
                                                productId:homePageController
                                                    .allRunningCampaign!
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
                                    child: homePageController
                                        .allRunningCampaign!
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
                                  borderH: 80.h,
                                  borderW: 100.w,
                                  soldText:
                                      "${apiPath.campaigns[index].soldQty.toString()} Sold out of ${apiPath.campaigns[index].ticketQty.toString()}",
                                  progressPersen: percent,
                                  productImg:
                                  apiPath.campaigns[index].productImage,
                                  winText: apiPath.campaigns[index].productName,
                                  fFirst: apiPath.campaigns[index].remarks,
                                  campaignSubTitle:
                                      apiPath.campaigns[index].campaignSubTitle,
                                  image:
                                  apiPath.campaigns[index].prizeImage,
                                  date: Container(
                                      height: 56.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.black54,
                                              style: BorderStyle.solid)),
                                      child: DrowDate(
                                        date:
                                                " Max Draw Date: ${apiPath.campaigns[index].declareDate.toString()}",
                                        campaignStatus:
                                            "or earlier if the campaign is ",
                                        currentStatus: "Sold Out",
                                      )), productPrice:   apiPath.campaigns[index].price, currency: apiPath.campaigns[index].currency,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Text("list is Empty");
            }
          }
        }),
        bottomNavigationBar: CustomBottomNavigation(
          selectedNavIndex: 0,
        ),
      ),
    );
  }
}
