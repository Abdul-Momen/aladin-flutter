import 'package:aladin/constants/color.dart';
import 'package:aladin/constants/string.dart';
import 'package:aladin/helper/helper.dart';
import 'package:aladin/modules/wallet/controller/wallet_controller.dart';
import 'package:aladin/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../states/data/prefs.dart';
import '../../../states/utils/methods.dart';
import '../../../widget/custom_elevated_button.dart';
import '../../checkout/controller/my_cart_controller.dart';
import '../../home/view/screens/home_screen.dart';

class WalletScreen extends StatefulWidget {
  static String routeName = "/WalletScreen";

  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final WalletController walletController = Get.find<WalletController>();

  final TextEditingController _amountCon = TextEditingController();
  final CheckOutController _checkOutController = Get.find<CheckOutController>();

  @override
  void initState() {
    walletController.getWalletData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: CustomAppBar(
        height: 75.h,
        title: "HAZA DEALS Wallet",
        color: Colors.white,
        onBack: () {
          Get.offAllNamed(HomeScreen.routeName);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addH(8),
            Center(
              child: Container(
                width: Get.width - 50,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: ConstantColors.grayShade, width: 0.5),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text(
                      "Available Balance in Haza Deals Wallet",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: ConstantStrings.kAppInterFont,
                          color: ConstantColors.grayBlack),
                    ),
                    addH(20.h),
                    Obx(() {
                      if (walletController.walletDataLoadingFlag.value) {
                        return Column(
                          children: [
                            Center(
                              child: CircularProgressIndicator(
                                color: ConstantColors.darkYellow,
                              ),
                            ),
                          ],
                        );
                      } else {
                        if (walletController.walletResponseModel == null) {
                          return const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Center(
                                  child: Text('No wallet added'),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return GradientText(
                              "${walletController.walletResponseModel!.data.wallet.currency} ${walletController.walletResponseModel!.data.wallet.actualBalance}",
                              style: TextStyle(
                                  fontSize: 30.sp,
                                  fontFamily: ConstantStrings.kAppInterBold,
                                  color: ConstantColors.grayBlack),
                              colors: [
                                ConstantColors.lightYellow,
                                ConstantColors.darkYellow,
                              ]);
                        }
                      }
                    }),
                  ],
                ),
              ),
            ),
            addH(15),
            Text(
              "Select Top-Up Method",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: ConstantStrings.kAppInterBold,
                  fontSize: 18.sp),
            ),
            addH(15.h),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: 300.h,
                        width: Get.width - 60,
                        child: Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            height: 200.h,
                            width: Get.width - 60,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Text(
                                  "Enter amount",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: ConstantStrings.kAppInterBold,
                                  ),
                                ),
                                addH(10),

                                Row(
                                  children: [
                                    Text(
                                      "Enter amount",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: ConstantStrings.kAppInterBold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: 100,
                                      child: TextField(
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          //fontFamily: ConstantStrings.kAppRobotoFont,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: '',
                                          hintStyle: TextStyle(
                                              fontSize: 14,
                                              color: ConstantColors.normalTextColor,
                                              fontFamily:
                                                  ConstantStrings.kAppInterRegular),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                6), //circular border for TextField.
                                          ),
                                        ),
                                        controller: _amountCon,
                                        keyboardType: TextInputType.number,
                                        obscureText: false,
                                        textAlignVertical: TextAlignVertical.center,
                                      ),
                                    ),
                                  ],
                                ),
                                addH(20),
                                CustomElevatedButton(
                                  width: Get.width - 200,
                                  height: 46.h,
                                  onPressed: () {
                                    if (_amountCon.text.isEmpty) {
                                      Methods.showSnackbar(
                                        msg: 'Please add amount!',
                                      );
                                      return;
                                    }
                                    if (_amountCon.text.length < 0) {
                                      Methods.showSnackbar(
                                        msg: 'Please enter valid amount!',
                                      );
                                    }

                                    _checkOutController.checkoutStripe(
                                        memberId: Preference.getMemberId(),
                                        addressId: 0,
                                        useDifrentShipping: 2,
                                        cardNo: '',
                                        currency: '',
                                        fullName: '',
                                        mobileNumber: '0',
                                        area: '',
                                        appartment: '',
                                        extraDirection: '',
                                        currentLocation: '',
                                        latitude: '',
                                        longitude: '',
                                        paymentMethodId: 2,
                                        totalCost: int.parse(_amountCon.text));

                                    Get.defaultDialog(
                                      title: "Please Wait..",
                                      content: Obx(
                                        () {
                                          if (_checkOutController
                                              .checkOutStripeLoading.value) {
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
                                            if (_checkOutController
                                                    .checkoutStripeResponseModel !=
                                                null) {
                                              Future.delayed(
                                                const Duration(seconds: 1),
                                                () {
                                                  Get.back();

                                                  walletController
                                                      .addMoneyToWallet(
                                                          int.parse(
                                                              _amountCon.text));

                                                  Get.defaultDialog(
                                                    title: "Please Wait..",
                                                    content: Obx(
                                                      () {
                                                        if (walletController
                                                            .addMoneyLoadingFlag
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
                                                          if (walletController
                                                              .addWalletMoneyResponseModel!
                                                              .data
                                                              .wallet) {
                                                            Future.delayed(
                                                              const Duration(
                                                                  seconds: 1),
                                                              () {
                                                                //  setState(() {
                                                                initThePaymentSheet();
                                                                Get.back();
                                                                Get.back();

                                                                //TODO uncomment
                                                                //     Get.offAllNamed(ThankYouPage.routeName,arguments: [_checkOutController.checkoutModel!.data.invoice.refNo]);
                                                                //    });
                                                              },
                                                            );
                                                            return const Text(
                                                                'Success');
                                                          } else {
                                                            Future.delayed(
                                                              const Duration(
                                                                  seconds: 2),
                                                              () {
                                                                setState(() {
                                                                  Get.toNamed(
                                                                      HomeScreen
                                                                          .routeName);
                                                                });
                                                              },
                                                            );
                                                            return const Text(
                                                                'Failed');
                                                          }
                                                        }
                                                      },
                                                    ),
                                                  );
                                                },
                                              );
                                              return const Text('Success');
                                            } else {
                                              Future.delayed(
                                                const Duration(seconds: 2),
                                                () {
                                                  setState(() {
                                                    Get.toNamed(
                                                        HomeScreen.routeName);
                                                  });
                                                },
                                              );
                                              return const Text('Failed');
                                            }
                                          }
                                        },
                                      ),
                                    );
                                  },
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      ConstantColors.lightYellow,
                                      ConstantColors.darkYellow,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                  child: Text('Proceed',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily:
                                            ConstantStrings.kAppInterBold,
                                        fontSize: 16.sp,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: Container(
                width: Get.width - 50,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: ConstantColors.grayShade, width: 0.5),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Credit/Debit Cards",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: ConstantStrings.kAppInterFont,
                          fontSize: 16.sp),
                    ),
                    addH(5.h),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Image.asset("assets/images/logos_visa.png"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child:
                              Image.asset("assets/images/logos_mastercard.png"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future initThePaymentSheet() async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          //  customerId: Preference.,
          paymentIntentClientSecret: Preference.getClientSecret(),
          googlePay: const PaymentSheetGooglePay(merchantCountryCode: 'US'),
          style: ThemeMode.system,
          merchantDisplayName: 'haza',
        ),
      );
      await displayPaymentSheet();
    } catch (e, s) {
      debugPrint('exception in initPaymentSheet method:$e$s');
    }
  }

  Future displayPaymentSheet() async {
    try {
      debugPrint("successfully=>");
      await Stripe.instance.presentPaymentSheet();
      debugPrint("paid successfully=>");
      debugPrint("paid successfully=> ");

      /*   _checkOutController.updatePaymentStatus(
          _checkOutController.checkoutModel!.data.invoice.invoiceMasterid,
          Preference.getPaymentId());*/

      Get.offAllNamed(WalletScreen.routeName);

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Payment successful")));
    } on StripeException catch (e) {
      debugPrint(
          ' on StripeException: Exception in displaying payment sheet  ${e.toString()}');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.error.message.toString())));
    } catch (e) {
      debugPrint(
          'Exception in displaying payment sheet in general catch ${e.toString()}');
    }
  }
}

class ProfileInfo extends StatelessWidget {
  final String title;
  final String infoText;

  const ProfileInfo({super.key, required this.title, required this.infoText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: ConstantColors.grayBlack,
              fontFamily: ConstantStrings.kAppInterRegular,
              fontSize: 16.sp),
        ),
        Text(
          infoText,
          style: TextStyle(
              color: ConstantColors.grayBlack,
              fontFamily: ConstantStrings.kAppInterBold,
              fontSize: 16.sp),
        ),
      ],
    );
  }
}

class Divide extends StatelessWidget {
  final double thickness;

  const Divide({
    super.key,
    required this.thickness,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 25.h,
      color: ConstantColors.grayShade,
      thickness: thickness,
    );
  }
}
