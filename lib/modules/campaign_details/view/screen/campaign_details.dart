import 'package:aladin/constants/color.dart';
import 'package:aladin/constants/string.dart';
import 'package:aladin/helper/helper.dart';
import 'package:aladin/modules/campaign_details/view/widget/bottom_sheet.dart';
import 'package:aladin/modules/campaign_details/view/widget/campaign_details_skeleton.dart';
import 'package:aladin/modules/campaign_details/view/widget/price_details_page.dart';
import 'package:aladin/modules/campaign_details/view/widget/product_details_page.dart';
import 'package:aladin/modules/cart/controller/cart_controller.dart';
import 'package:aladin/modules/home/controller/homepage_controller.dart';
import 'package:aladin/modules/campaign_details/model/campaign_details_model.dart';
import 'package:aladin/states/data/prefs.dart';
import 'package:aladin/widget/appbar_2.dart';
import 'package:aladin/widget/product_card_withdate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:aladin/modules/home/model/related_list_model.dart' as relatedProduct;

import '../../../../widget/custom_navigation_bar.dart';
import '../../../auth/view/Login.dart';
import '../../controller/product_details_controller.dart';

class CampaignDetailsScreen extends StatefulWidget {
  static String routeName = "/productDetails";

  const CampaignDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CampaignDetailsScreen> createState() => _CampaignDetailsScreenState();
}

class _CampaignDetailsScreenState extends State<CampaignDetailsScreen> {
  final CampaignDetailsController campaignDetailsController =
      Get.find<CampaignDetailsController>();
  final CartController cartController = Get.find<CartController>();
  final HomePageController homePageController = Get.find<HomePageController>();
  final CartController _cartController = Get.put(CartController());

  int pId = 0;

  @override
  void initState() {
    if (Get.arguments != null) {
      pId = int.parse(Get.arguments[0]);
      print("iiiiiiddddddddddddd ${pId}");
    }
    campaignDetailsController.getCampaignDetails(productId: pId);
    homePageController.getRelatedList(ProductId: pId);
    // TODO: implement initState
    super.initState();
  }

  bool activeTab = false;

  int totalQty = 1;

  final int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*   appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 65.h, // Set this height
        flexibleSpace: const Appbar2(),
      ),*/
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() {
                if (campaignDetailsController.pCampaignDetailsLoading.value) {
                  return  Padding(
                    padding:  EdgeInsets.only(top:Get.height/2),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: ConstantColors.darkYellow,
                      ),
                    ),
                  );
             /*     return Padding(
                    padding: EdgeInsets.all(10.r),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const DrowDateSkeleton(),

                          /// ProductImg Skeleton
                          const ProductImgSkeleton(),
                          if (activeTab) const PriceDetailsSkeleton(),
                          if (!activeTab) const ProductDetailsSkeleton(),
                          const RelatedCampaignSkeleton()
                        ],
                      ),
                    ),
                  );*/
                } else {
                  if (campaignDetailsController.campaignDetailsModel!.code ==
                      200) {


                    String prizeText =campaignDetailsController.campaignDetailsModel!.data.campaign
                        .prizeName;
                    String prizeImage =campaignDetailsController.campaignDetailsModel!.data.campaign
                        .prizeImage;
                    List<PrizeFor> prizeForUae = campaignDetailsController.campaignDetailsModel!.data.campaign
                        .prizeForUae;
                    List<PrizeFor> prizeForIndia =
                        campaignDetailsController.campaignDetailsModel!.data.campaign.prizeForIndia;

                    if (Preference.getCountryId() ==
                        prizeForUae[0].countryId) {
                      prizeImage = prizeForUae[0].prizeImage;
                      prizeText = prizeForUae[0].prizeName;
                    } else {
                      prizeImage = prizeForIndia[0].prizeImage;
                      prizeText = prizeForIndia[0].prizeName;
                    }

                    return Column(
                      children: [
                        const Appbar2(),
                        /* AppBar(
                          elevation: 0,
                          automaticallyImplyLeading: false,
                          toolbarHeight: 65.h, // Set this height
                          flexibleSpace: const Appbar2(),
                        ),*/
                        Stack(children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    /*    IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: Icon(
                                          Icons.arrow_back_outlined,
                                          color: Colors.black,
                                          size: 24.sp,
                                        )),*/
                                    Text(
                                      prizeText,
                                      style: TextStyle(
                                          color: ConstantColors.grayBlack,
                                          fontSize: 20.sp,
                                          fontFamily: ConstantStrings
                                              .kAppInterSemiBold),
                                    )
                                  ],
                                ),
                                Divider(
                                  color: ConstantColors.grayShade,
                                  thickness: 0.5,
                                ),
                                // DrowDateSkeleton(),
                                DrowDate(
                                  date:
                                      "Max Draw Date: ${campaignDetailsController.campaignDetailsModel!.data.campaign.announcedDate}",
                                  campaignStatus:
                                      "or earlier if the campaign is ",
                                  currentStatus: "Sold Out",
                                ),

                                /// ProductImg Skeleton
                                // ProductImgSkeleton(),

                                Stack(
                                  children: [
                                    SizedBox(
                                      height: 280.h,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.network(
                                          activeTab
                                              ? campaignDetailsController
                                                  .campaignDetailsModel!
                                                  .data
                                                  .campaign
                                                  .productImage
                                              : prizeImage,
                                          fit: BoxFit.fill,
                                          width: double.infinity,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            right: 10, bottom: 10),
                                        height: 100.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: ConstantColors.grayShade,
                                              style: BorderStyle.solid),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(5.r),
                                          child: Image.network(
                                            activeTab
                                                ? prizeImage
                                                : campaignDetailsController
                                                    .campaignDetailsModel!
                                                    .data
                                                    .campaign
                                                    .productImage,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  height: 46.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.black12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              activeTab = false;
                                            });
                                          },
                                          child: Container(
                                            height: 44.h,
                                            decoration: BoxDecoration(
                                              //  borderRadius: BorderRadius.circular(8),
                                              color: activeTab == false
                                                  ? Colors.white
                                                  : const Color(0xFFE5EBF1),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Prize Details",
                                                style: TextStyle(
                                                    fontFamily: ConstantStrings
                                                        .kAppInterSemiBold,
                                                    fontSize: 16.sp,
                                                    color: activeTab == false
                                                        ? ConstantColors
                                                            .darkYellow
                                                        : Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              activeTab = true;
                                            });
                                          },
                                          child: Container(
                                            height: 44.h,
                                            decoration: BoxDecoration(
                                              color: activeTab == true
                                                  ? Colors.white
                                                  : const Color(0xFFE5EBF1),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Product Details",
                                                style: TextStyle(
                                                    fontFamily: ConstantStrings
                                                        .kAppInterSemiBold,
                                                    fontSize: 16.sp,
                                                    color: activeTab == true
                                                        ? ConstantColors
                                                            .darkYellow
                                                        : Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                addH(10.h),
                                /*if(activeTab) const
                          PriceDetailsSkeleton(),
                          if(!activeTab) const
                          ProductDetailsSkeleton(),*/
                                //selected tab 1
                                if (activeTab)
                                  PriceDetailsPage(
                                      campaign: campaignDetailsController
                                          .campaignDetailsModel!.data.campaign),

                                //selected tab 2
                                if (!activeTab)
                                  ProductDetailsPage(
                                      campaign: campaignDetailsController
                                          .campaignDetailsModel!.data.campaign),
                              ],
                            ),
                          ),
                        ]),
                      ],
                    );
                  } else {
                    return const Text("list is empty");
                  }
                }
              }),
              Obx(() {
                if (!campaignDetailsController.pCampaignDetailsLoading.value) {
                  if (homePageController.pRelatedLoading.value) {
                    return const RelatedCampaignSkeleton();
                  } else {
                    if (homePageController
                        .relatedListModel!.data.campaigns.isNotEmpty) {


                      String prizeText =campaignDetailsController.campaignDetailsModel!.data.campaign
                          .prizeName;
                      String prizeImage =campaignDetailsController.campaignDetailsModel!.data.campaign
                          .prizeImage;
                      List<PrizeFor> prizeForUae = campaignDetailsController.campaignDetailsModel!.data.campaign
                          .prizeForUae;
                      List<PrizeFor> prizeForIndia =
                          campaignDetailsController.campaignDetailsModel!.data.campaign.prizeForIndia;

                      if (Preference.getCountryId() ==
                          prizeForUae[0].countryId) {
                        prizeImage = prizeForUae[0].prizeImage;
                        prizeText = prizeForUae[0].prizeName;
                      } else {
                        prizeImage = prizeForIndia[0].prizeImage;
                        prizeText = prizeForIndia[0].prizeName;
                      }






                      return Column(
                        children: [
                          addH(30.h),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Related Campaign",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily:
                                            ConstantStrings.kAppInterSemiBold,
                                        fontSize: 24.sp)),
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
                          ),
                          addH(5.h),
                          SizedBox(
                            height: 502.h,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: homePageController
                                  .relatedListModel!.data.campaigns.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                var percent = homePageController
                                        .relatedListModel!
                                        .data
                                        .campaigns[index]
                                        .soldQty *
                                    1.0 /
                                    homePageController.relatedListModel!.data
                                        .campaigns[index].ticketQty;
                                String relatedPrizeText =homePageController.relatedListModel!
                                    .data.campaigns[index]
                                    .prizeName;
                                String relatedPrizeImage =homePageController.relatedListModel!
                                    .data.campaigns[index]
                                    .prizeImage;
                                List<relatedProduct.PrizeFor> relatedPrizeForUae = homePageController.relatedListModel!
                                    .data.campaigns[index]
                                    .prizeForUae;
                                List<relatedProduct.PrizeFor> relatedPrizeForIndia =
                                    homePageController.relatedListModel!
                                        .data.campaigns[index].prizeForIndia;

                                if (Preference.getCountryId() ==
                                    prizeForUae[0].countryId) {
                                  relatedPrizeImage = prizeForUae[0].prizeImage;
                                  relatedPrizeText = prizeForUae[0].prizeName;
                                } else {
                                  relatedPrizeImage = prizeForIndia[0].prizeImage;
                                  relatedPrizeText = prizeForIndia[0].prizeName;
                                }

                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20.0, 0.0, 8.0, 2.0),
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
                                              .relatedListModel!
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
                                    widgetFavorite: Container(
                                      height: 40.h,
                                      width: 40.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
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
                                        "${homePageController.relatedListModel!
                                            .data.campaigns[index].soldQty} sold out ${homePageController.relatedListModel!
                                            .data.campaigns[index].ticketQty}",
                                    progressPersen: percent,
                                    productImg: homePageController.relatedListModel!
                                        .data.campaigns[index]
                                        .productImage,
                                    winText: relatedPrizeText,
                                    campaignSubTitle:homePageController.relatedListModel!
                                        .data.campaigns[index]
                                        .campaignTitle,
                                    image: relatedPrizeImage,
                                    date: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.grey.shade200,
                                                style: BorderStyle.solid)),
                                        child: DrowDate(
                                          date:
                                              "Max Draw Date: ${homePageController.relatedListModel!
                                                  .data.campaigns[index].announcedDate}",
                                          campaignStatus:
                                              "or earlier if the campaign is ",
                                          currentStatus: "Sold Out",
                                        )),
                                    productPrice: homePageController.relatedListModel!
                                        .data.campaigns[index]
                                        .price,
                                    currency: homePageController.relatedListModel!
                                        .data.campaigns[index]
                                        .currency,
                                  ),
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
                } else {
                  return const SizedBox.shrink();
                }
              }),
              addH(110.h),
            ],
          ),
        ),
      ),
      bottomSheet: Obx(() {
        if (!campaignDetailsController.pCampaignDetailsLoading.value) {
          return CustomBottomSheet(
            campaign:
                campaignDetailsController.campaignDetailsModel!.data.campaign,
            Fn: () {
              if (!Preference.getLoggedInFlag()) {
                print("logged in flag ${Preference.getLoggedInFlag()}");
                //   () =>
                Get.toNamed(LoginPage.routeName);
              } else {
                cartController.postAddCart(
                  memberId: Preference.getMemberId(),
                  cookieId: '',
                  productId: campaignDetailsController
                      .campaignDetailsModel!.data.campaign.productId,
                  qty: totalQty,
                );
                Get.defaultDialog(
                  title: "Please Wait..",
                  content: Obx(
                    () {
                      if (cartController.pAddCartLoading.value) {
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
                        if (cartController.addToListCartModel!.isSuccess) {
                          Future.delayed(
                            const Duration(seconds: 1),
                            () {
                              setState(() {
                                Get.back();
                              });
                            },
                          );
                          return const Text('Added Successfully');
                        } else {
                          return const Text('Failed to add');
                        }
                      }
                    },
                  ),
                );
              }
            },
            callback: (int) {
              totalQty = int;
              setState(() {});
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      }),
      bottomNavigationBar: CustomBottomNavigation(
        selectedNavIndex: 0,
      ),
    );
  }
}
