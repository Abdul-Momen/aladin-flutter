import 'package:aladin/constants/color.dart';
import 'package:aladin/constants/string.dart';
import 'package:aladin/helper/helper.dart';
import 'package:aladin/modules/cart/controller/cart_controller.dart';
import 'package:aladin/modules/cart/views/widget/my_cart_skeleton.dart';
import 'package:aladin/modules/checkout/view/checkout_page.dart';
import 'package:aladin/modules/home/view/screens/home_screen.dart';
import 'package:aladin/states/data/prefs.dart';
import 'package:aladin/widget/custom_appbar.dart';
import 'package:aladin/widget/custom_elevated_button.dart';
import 'package:aladin/widget/custom_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../states/utils/methods.dart';
import '../../../../widget/custom_navigation_bar.dart';

class MyCartPage extends StatefulWidget {
  final CartController cartController;
  static String routeName = "/myCart";

  const MyCartPage({
    Key? key,
    required this.cartController,
  }) : super(key: key);

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  bool rememberMe = false;

  @override
  void initState() {
    if (Get.arguments != null) {
      //  mId = int.parse(Get.arguments[0]);
    }
    widget.cartController.getMemberCart(memberId: Preference.getMemberId());
    widget.cartController
        .getMemberSummaryCart(memberId: Preference.getMemberId());
    rememberMe = widget.cartController.rememberMe.value;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 65.h,
        title: "My Cart",
        onBack: () {
          Get.offAllNamed(HomeScreen.routeName);
        },
      ),
      body: Obx(() {
        if (widget.cartController.pMemberCartLoading.value) {
          /*  return const Column(
            children: [
              MyCartPageSkeleton(),
              MyCartBottomSheetSkeleton(),
            ],
          );*/
          return Center(
            child: CircularProgressIndicator(
              color: ConstantColors.darkYellow,
            ),
          );
        } else {
          if (widget
              .cartController.memberCartModel!.data.cartProducts.isNotEmpty) {
            return Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
              child: SizedBox(
                height: Get.height / 2,
                // height: 300.h,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: widget
                      .cartController.memberCartModel!.data.cartProducts.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 1),
                            blurRadius: 5,
                            spreadRadius: 0.02,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                height: 100.h,
                                width: 125.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.black45,
                                      style: BorderStyle.solid),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomImg(
                                    imgUrl: widget
                                        .cartController
                                        .memberCartModel!
                                        .data
                                        .cartProducts[index]
                                        .product
                                        .productImage,
                                  ),
                                ),
                              ),
                              addW(5),
                              SizedBox(
                                height: 100.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        widget
                                            .cartController
                                            .memberCartModel!
                                            .data
                                            .cartProducts[index]
                                            .product
                                            .productName,
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontFamily: ConstantStrings
                                                .kAppInterRegular)),
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "Price: ",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.black54,
                                                fontFamily: ConstantStrings
                                                    .kAppInterRegular)),
                                        TextSpan(
                                          text:
                                              "${widget.cartController.memberCartModel!.data.cartProducts[index].product.currency} ${widget.cartController.memberCartModel!.data.cartProducts[index].product.price.toStringAsFixed(0)}",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: ConstantColors.darkYellow,
                                              fontFamily: ConstantStrings
                                                  .kAppInterBold),
                                        ),
                                      ]),
                                    ),
                                    SizedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if (widget
                                                      .cartController
                                                      .memberCartModel!
                                                      .data
                                                      .cartProducts[index]
                                                      .qty >
                                                  0) {
                                                setState(() {
                                                  widget
                                                      .cartController
                                                      .memberCartModel!
                                                      .data
                                                      .cartProducts[index]
                                                      .qty -= 1;

                                                  widget.cartController
                                                      .postDecrementCartItemQuantity(
                                                    memberId: Preference
                                                        .getMemberId(),
                                                    cookieId: '',
                                                    productId: widget
                                                        .cartController
                                                        .memberCartModel!
                                                        .data
                                                        .cartProducts[index]
                                                        .product
                                                        .productId,
                                                    qty: 1,
                                                  );
                                                  Get.defaultDialog(
                                                    title: "Please Wait..",
                                                    content: Obx(
                                                      () {
                                                        if (widget
                                                            .cartController
                                                            .pDeleteCartLoading
                                                            .value) {
                                                          return Column(
                                                            children: [
                                                              Center(
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: ConstantColors
                                                                      .darkYellow,
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        } else {
                                                          if (widget
                                                              .cartController
                                                              .deleteCartModel!
                                                              .isSuccess) {
                                                            Future.delayed(
                                                              const Duration(
                                                                  seconds: 1),
                                                              () {
                                                                rememberMe =
                                                                    false;
                                                                widget
                                                                    .cartController
                                                                    .getMemberCart(
                                                                        memberId:
                                                                            Preference.getMemberId());
                                                                widget
                                                                    .cartController
                                                                    .getMemberSummaryCart(
                                                                        memberId:
                                                                            Preference.getMemberId());
                                                                setState(() {
                                                                  Get.back();
                                                                });
                                                              },
                                                            );
                                                            return const Text(
                                                                '');
                                                          } else {
                                                            return const Text(
                                                                '');
                                                          }
                                                        }
                                                      },
                                                    ),
                                                  );
                                                });
                                              }
                                            },
                                            child: Container(
                                              height: 32.h,
                                              width: 32.w,
                                              decoration: BoxDecoration(
                                                color: ConstantColors.grayShade,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Colors.black,
                                                  size: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                          addW(5),
                                          Text(
                                              widget
                                                  .cartController
                                                  .memberCartModel!
                                                  .data
                                                  .cartProducts[index]
                                                  .qty
                                                  .toInt()
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 19.sp,
                                                  color:
                                                      ConstantColors.grayBlack,
                                                  fontFamily: ConstantStrings
                                                      .kAppInterSemiBold)),
                                          addW(5),
                                          InkWell(
                                            onTap: () {
                                              if (widget
                                                          .cartController
                                                          .memberCartModel!
                                                          .data
                                                          .cartProducts[index]
                                                          .qty +
                                                      widget
                                                          .cartController
                                                          .memberCartModel!
                                                          .data
                                                          .cartProducts[index]
                                                          .product
                                                          .soldQty +
                                                      1 <=
                                                  widget
                                                      .cartController
                                                      .memberCartModel!
                                                      .data
                                                      .cartProducts[index]
                                                      .product
                                                      .ticketQty) {
                                                setState(() {
                                                  widget
                                                      .cartController
                                                      .memberCartModel!
                                                      .data
                                                      .cartProducts[index]
                                                      .qty += 1;

                                                  widget.cartController
                                                      .postAddCart(
                                                    memberId: Preference
                                                        .getMemberId(),
                                                    cookieId: '',
                                                    productId: widget
                                                        .cartController
                                                        .memberCartModel!
                                                        .data
                                                        .cartProducts[index]
                                                        .product
                                                        .productId,
                                                    qty: 1,
                                                  );
                                                  Get.defaultDialog(
                                                    title: "Please Wait..",
                                                    content: Obx(
                                                      () {
                                                        if (widget
                                                            .cartController
                                                            .pAddCartLoading
                                                            .value) {
                                                          return Column(
                                                            children: [
                                                              Center(
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: ConstantColors
                                                                      .darkYellow,
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        } else {
                                                          if (widget
                                                              .cartController
                                                              .addToListCartModel!
                                                              .isSuccess) {
                                                            Future.delayed(
                                                              const Duration(
                                                                  seconds: 1),
                                                              () {
                                                                rememberMe =
                                                                    false;
                                                                widget
                                                                    .cartController
                                                                    .getMemberCart(
                                                                        memberId:
                                                                            Preference.getMemberId());
                                                                widget
                                                                    .cartController
                                                                    .getMemberSummaryCart(
                                                                        memberId:
                                                                            Preference.getMemberId());
                                                                setState(() {
                                                                  Get.back();
                                                                });
                                                              },
                                                            );
                                                            return const Text(
                                                                'Added Successfully');
                                                          } else {
                                                            return const Text(
                                                                'Failed to add');
                                                          }
                                                        }
                                                      },
                                                    ),
                                                  );
                                                });
                                              } else {
                                                Methods.showSnackbar(
                                                    //  context: context,
                                                    msg: "Cannot add to cart");
                                              }
                                            },
                                            child: Container(
                                              height: 32.h,
                                              width: 32.w,
                                              decoration: BoxDecoration(
                                                color: ConstantColors.grayShade,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                  size: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                                onTap: () {
                                  widget.cartController.removeCart(
                                      id: widget.cartController.memberCartModel!
                                          .data.cartProducts[index].id);

                                  Get.defaultDialog(
                                    title: "Please wait..",
                                    content: Obx(
                                      () {
                                        if (widget.cartController
                                            .pRemoveCartLoading.value) {
                                          return Column(
                                            children: [
                                              Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color:
                                                      ConstantColors.darkYellow,
                                                ),
                                              ),
                                            ],
                                          );
                                        } else {
                                          if (widget.cartController
                                              .removeCartModel!.isSuccess) {
                                            Future.delayed(
                                              const Duration(seconds: 1),
                                              () {
                                                setState(() {
                                                  widget.cartController
                                                      .rememberMe.value = false;
                                                  Get.back();
                                                  widget.cartController
                                                      .getMemberCart(
                                                          memberId: Preference
                                                              .getMemberId());
                                                  widget.cartController
                                                      .getMemberSummaryCart(
                                                          memberId: Preference
                                                              .getMemberId());
                                                });
                                              },
                                            );
                                            return const Text('');
                                          } else {
                                            return const Text(
                                                'Could not delete');
                                          }
                                        }
                                      },
                                    ),
                                  );
                                },
                                child:
                                    SvgPicture.asset('assets/svg/delete.svg')),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return const Padding(
              padding: EdgeInsets.all(18.0),
              child: Center(child: Text("Cart list is empty")),
            );
          }
        }
      }),
      bottomSheet: Obx(() {
        if (!widget.cartController.pMemberCartLoading.value) {
          if (widget
              .cartController.memberCartModel!.data.cartProducts.isNotEmpty) {
            if (!widget.cartController.pMemberSummaryCartLoading.value) {
              if (widget.cartController.memberSummaryCartModel!.data
                  .cartProducts.cartResponse.isNotEmpty) {
                var api = widget
                    .cartController.memberSummaryCartModel!.data.cartProducts;

                //   Preference.setcurrency(api.cu)
                return SizedBox(
                  height: Get.height / 4,

                  // height: 350.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addH(10.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Summary",
                              style: TextStyle(
                                  color: ConstantColors.grayBlack,
                                  fontSize: 16.sp,
                                  fontFamily: ConstantStrings.kAppInterBold),
                            ),
                            addH(10.h),
                            /*         Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Sub Total",
                                    style: TextStyle(
                                        color: ConstantColors.grayBlack,
                                        fontFamily:
                                            ConstantStrings.kAppInterRegular)),
                                Text(
                                    "${api.cartResponse[0].product.currency} ${api.totalAmount.toStringAsFixed(0)}",
                                    style: TextStyle(
                                        color: ConstantColors.grayBlack,
                                        fontFamily:
                                            ConstantStrings.kAppInterBold)),
                              ],
                            ),
                            addH(8.h),*/
                            /* Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Vat",
                                    style: TextStyle(
                                        color: ConstantColors.grayBlack,
                                        fontFamily:
                                            ConstantStrings.kAppInterRegular)),
                                Text("${api.cartResponse[0].product.currency} ${api.vat.toStringAsFixed(0)}",
                                    style: TextStyle(
                                        color: ConstantColors.grayBlack,
                                        fontFamily:
                                            ConstantStrings.kAppInterBold)),
                              ],
                            ),*/
                            Divider(
                              thickness: 0.5,
                              height: 15.h,
                              color: ConstantColors.grayShade,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Order Total",
                                    style: TextStyle(
                                        color: ConstantColors.grayBlack,
                                        fontFamily:
                                            ConstantStrings.kAppInterRegular)),
                                Text(
                                    // "${api.cartResponse[0].product.currency} ${api.subTotalAmount.toStringAsFixed(0)}",
                                    "${api.cartResponse[0].product.currency} ${api.totalAmount.toStringAsFixed(0)}",
                                    style: TextStyle(
                                        color: ConstantColors.grayBlack,
                                        fontFamily:
                                            ConstantStrings.kAppInterBold)),
                              ],
                            ),
                            Divider(
                              height: 10.h,
                              thickness: 0.5,
                              color: ConstantColors.grayShade,
                            ),
                            /*     Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 260.w,
                                  child: Text(
                                      "Donate your products to our partner charity and get 1 extra ticket",
                                      style: TextStyle(
                                          height: 1.5.h,
                                          fontFamily: ConstantStrings
                                              .kAppInterRegular)),
                                ),
                                Checkbox(
                                  value:   widget.cartController.rememberMe.value,
                                  onChanged: (newValue) {
                                    if (rememberMe == false) {
                                      widget.cartController.rememberMe.value = true;

                                      setState(() {

                                        rememberMe = newValue!;
                                        if (rememberMe) {
                                          for (int i = 0;
                                              i <
                                                  widget
                                                      .cartController
                                                      .memberCartModel!
                                                      .data
                                                      .cartProducts
                                                      .length;
                                              i++) {
                                            print(
                                                "Qtyyyy ${widget.cartController.memberCartModel!.data.cartProducts[i].qty}");
                                            widget.cartController.postAddCart(
                                              memberId:
                                                  Preference.getMemberId(),
                                              cookieId: '',
                                              productId: widget
                                                  .cartController
                                                  .memberCartModel!
                                                  .data
                                                  .cartProducts[i]
                                                  .product
                                                  .productId,
                                              qty: (widget
                                                      .cartController
                                                      .memberCartModel!
                                                      .data
                                                      .cartProducts[i]
                                                      .qty)
                                                  .round(),
                                            );
                                          }
                                          // api.totalTicket = api.totalTicket * 2;
                                          widget.cartController.productCount.value = 0;
                                          Get.defaultDialog(
                                            title: "Please Wait..",
                                            content: Obx(
                                              () {
                                                if (widget.cartController
                                                    .pAddCartLoading.value) {
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
                                                  if (widget
                                                      .cartController
                                                      .addToListCartModel!
                                                      .isSuccess) {
                                                    Future.delayed(
                                                      const Duration(
                                                          seconds: 1),
                                                      () {
                                                        rememberMe = false;

                                                        widget.cartController
                                                            .getMemberCart(
                                                                memberId: Preference
                                                                    .getMemberId());
                                                        widget.cartController
                                                            .getMemberSummaryCart(
                                                                memberId: Preference
                                                                    .getMemberId());
                                                        setState(() {
                                                          Get.back();
                                                        });
                                                      },
                                                    );
                                                    return const Text(
                                                        'Added Successfully');
                                                  } else {
                                                    return const Text(
                                                        'Failed to add');
                                                  }
                                                }
                                              },
                                            ),
                                          );
                                          // api.totalTicket += 1;
                                         // setState(() {});
                                        } else {
                                          //api.totalTicket -= 1;
                                         // api.totalTicket = api.totalTicket / 2;

                                          // setState(() {});
                                        }
                                    //  }
                                      rememberMe = true;
                                        widget.cartController.productCount.value = 0;

                                      });}
                                  },
                                ),
                              ],
                            ),
                            Divider(
                              height: 10.h,
                              thickness: 0.5,
                              color: ConstantColors.grayShade,
                            ),*/
                            /*                 Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total Products",
                                    style: TextStyle(
                                        color: ConstantColors.grayBlack,
                                        fontFamily:
                                            ConstantStrings.kAppInterRegular)),
                                Text(widget.cartController.rememberMe.value == true?0.toString():api.totalProducr.toString(),
                                    style: TextStyle(
                                        color: ConstantColors.grayBlack,
                                        fontFamily:
                                            ConstantStrings.kAppInterBold)),
                              ],
                            ),
                            addH(8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total Tickets",
                                    style: TextStyle(
                                        color: ConstantColors.grayBlack,
                                        fontFamily:
                                            ConstantStrings.kAppInterRegular)),
                                Text(api.totalTicket.toInt().toString(),
                                    style: TextStyle(
                                        color: ConstantColors.grayBlack,
                                        fontFamily:
                                            ConstantStrings.kAppInterBold)),
                              ],
                            ),*/
                          ],
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors
                                  .white, /*boxShadow: [
                              BoxShadow(
                                  color: ConstantColors.grayShade,
                                  spreadRadius: 30,
                                  blurRadius: 30,
                                  offset: Offset(0, 5)),
                            ]*/
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: CustomElevatedButton(
                                      height: 50.sp,
                                      onPressed: () {
                                        Get.offAndToNamed(HomeScreen.routeName);
                                      },
                                      border: Border.all(
                                          color: ConstantColors.grayShade,
                                          style: BorderStyle.solid,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(5),
                                      child: Text(
                                        'Continue Shopping',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontFamily: ConstantStrings
                                                .kAppInterSemiBold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomElevatedButton(
                                      height: 50.h,
                                      onPressed: () {
                                        Get.to(() => const CheckOutPage());
                                      },
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            /*   Colors.pink,
                                            Colors.blueAccent*/

                                            ConstantColors.lightYellow,
                                            ConstantColors.darkYellow
                                          ]),
                                      borderRadius: BorderRadius.circular(5),
                                      child: Text(
                                        'Checkout',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontFamily:
                                              ConstantStrings.kAppInterSemiBold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            } else {
              return const SizedBox.shrink();
            }
          } else {
            return const SizedBox.shrink();
          }
        } else {
          return const SizedBox.shrink();
        }
      }),
      bottomNavigationBar: CustomBottomNavigation(
        selectedNavIndex: 4,
      ),
    );
  }
}
