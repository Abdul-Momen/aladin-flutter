import 'package:aladin/modules/campaign_details/view/screen/campaign_details.dart';
import 'package:aladin/modules/cart/views/screen/my_cart_page.dart';
import 'package:aladin/modules/home/view/screens/home_screen.dart';
import 'package:aladin/modules/home/view/widget/running_campaign_skeleton.dart';
import 'package:aladin/modules/wishlist/controller/wishlist_controller.dart';
import 'package:aladin/states/data/prefs.dart';
import 'package:aladin/widget/custom_appbar.dart';
import 'package:aladin/widget/product_card_withdate.dart';
import '../../../../../widget/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../constants/color.dart';
import '../../auth/view/Login.dart';
import '../../cart/controller/cart_controller.dart';

class WishListScreen extends StatefulWidget {
  static String routeName = "/wishlist";

  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final WishlistController _wishlistController = Get.find<WishlistController>();
  final CartController _cartController = Get.put(CartController());

  @override
  void initState() {
    if (Get.arguments != null) {
      //pId = int.parse(Get.arguments[0]);
    }
    _wishlistController.getWishList(memberId: Preference.getMemberId());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 65.h,
        title: "WishList",
        onBack: (){
          Get.offAllNamed(HomeScreen.routeName);
        },
      ),
      body: Obx(() {
        if (_wishlistController.pWishListLoading.value) {
          return  Center(
            child: CircularProgressIndicator(
              color: ConstantColors.darkYellow,
            ),
          );
        } else {
          if (_wishlistController.wishlistModel!.data.products.isNotEmpty) {
            var apiPath = _wishlistController.wishlistModel!.data;

            return SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,

              child:/* ListView.builder(
                itemCount: _wishlistController.wishlistModel!.data.products.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {*/
                 // return
              Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Flexible(

                        child: ListView.builder(

                          scrollDirection: Axis.vertical,
                          itemCount: apiPath.products.length,
                          shrinkWrap: true,
                        /*  physics:
                          const NeverScrollableScrollPhysics(),*/
                          itemBuilder: (context, index) {
                            var percent = apiPath.products[index].soldQty * 1.0 / apiPath.products[index].ticketQty;
                            return InkWell(
                              onTap: () => Get.toNamed(
                                  CampaignDetailsScreen
                                      .routeName,
                                  arguments: [
                                    apiPath.products[index]
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
                                        productId: apiPath.products[index]
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
                                    //Get.toNamed(MyCartPage.routeName);
                                  },
                                  height: 500.h,
                                  width: double.infinity,
                                  widgetFavorite:  InkWell(
                                    onTap: (){
                                      print("Clickeddddd");
                                      _wishlistController.postAddWishList(
                                          memberId:
                                          Preference
                                              .getMemberId(),
                                          sessionId:
                                          '',
                                          productId:apiPath.products[index]
                                              .productId
                                              ,
                                          qty: 0);
                                      Get.defaultDialog(
                                        title:
                                        "Please wait..",
                                        content: Obx(
                                              () {
                                            if (_wishlistController
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
                                              if (_wishlistController
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
                                    },
                                    child: Container(
                                      height: 40.h,
                                      width: 40.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.r),
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/svg/fav_active.svg',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  progresswidth: 110.w,
                                  borderH: 80.h,
                                  borderW: 100.w,
                                  soldText:
                                  "${apiPath.products[index]
                                      .soldQty.toString()} Sold out of ${apiPath.products[index]
                                      .ticketQty.toString()}",
                                  progressPersen: percent,
                                  productImg:_wishlistController.wishlistModel!.data.products[index].productImage,
                                  winText:apiPath.products[index]
                                      .prizeName,
                                  fFirst: apiPath.products[index].productName,
                                  campaignSubTitle:
                                  apiPath.products[index].campaignTitle,
                                  image: _wishlistController.wishlistModel!.data.products[index].prizeImage,
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
                                              style:
                                              BorderStyle
                                                  .solid)),
                                      child: DrowDate(
                                        date:
                                        "Max Draw Date: ${apiPath.products[index].declareDate.toString()}",
                                        campaignStatus:
                                        "or earlier if the campaign is ",
                                        currentStatus:
                                        "Sold Out",
                                      )), productPrice:  apiPath.products[index].price, currency:  apiPath.products[index].currency,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
              //   },
              // ),
            );
          } else {
            return const Center(child: Text("Wishlist is empty"));
          }
        }
      }),
      bottomNavigationBar: CustomBottomNavigation(
        selectedNavIndex: 1,
      ),
    );
  }
}
