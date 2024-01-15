import 'package:aladin/constants/color.dart';
import 'package:aladin/constants/string.dart';
import 'package:aladin/helper/helper.dart';
import 'package:aladin/modules/address/controller/address_controller.dart';
import 'package:aladin/modules/address/view/screen/address_book.dart';
import 'package:aladin/modules/address/view/widget/custom_address.dart';
import 'package:aladin/modules/checkout/controller/my_cart_controller.dart';
import 'package:aladin/modules/home/view/screens/home_screen.dart';
import 'package:aladin/modules/thank_you/thankyou_page.dart';
import 'package:aladin/states/data/prefs.dart';
import 'package:aladin/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import '../../../states/utils/methods.dart';
import '../../../widget/custom_appbar.dart';
import '../../wallet/controller/wallet_controller.dart';

class CheckOutPage extends StatefulWidget {
  static String routeName = "/checkOutPage";

  const CheckOutPage({Key? key}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final AddressController _addressController = Get.put(AddressController());
  final CheckOutController _checkOutController = Get.put(CheckOutController());
  final WalletController walletController = Get.put(WalletController());

  bool isProcessing = false;
  double walletBalance = 0.0;

  get dio => null;

  @override
  void initState() {
    _addressController.getMemberAddress(memberId: Preference.getMemberId());
    walletController.getWalletData();

    payWay = 'Online Payment';
    // TODO: implement initState
    super.initState();
  }

  // String? payWay = 'Online Payment';
  String? payWay;
  int paymentMethodId = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 65.h,
        title: "Checkout",
        onBack: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shipping Address",
                    style: TextStyle(
                      fontFamily: ConstantStrings.kAppInterBold,
                      fontSize: 18.sp,
                    ),
                  ),
                  CustomElevatedButton(
                    width: 180,
                    height: 40.h,
                    onPressed: () {
                      Get.offNamed(AddressBook.routeName, arguments: [false]);
                      Get.offAllNamed(ThankYouPage.routeName, arguments: [
                        _checkOutController.checkoutModel!.data.invoice.refNo
                      ]);
                    },
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          ConstantColors.lightYellow,
                          ConstantColors.darkYellow
                        ]),
                    borderRadius: BorderRadius.circular(5),
                    child: Text(
                      'Address Book',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontFamily: ConstantStrings.kAppInterSemiBold),
                    ),
                  ),

                  /*               InkWell(
                    onTap: () {
                      // AddressBook
                      Get.toNamed(AddressBook.routeName, arguments: [false]);
                      Get.offAllNamed(ThankYouPage.routeName, arguments: [
                        _checkOutController.checkoutModel!.data.invoice.refNo
                      ]);
                    },
                    child: Container(
                        height: 32.h,
                        width: 180.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: ConstantColors.grayShade, width: 0.5),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                              child: Text(
                            "Address Book",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: ConstantStrings.kAppInterRegular,
                            ),
                          )),
                        )),
                  ),*/
                ],
              ),
              addH(30),
              Text(
                "Select the shipping address for the delivery",
                style: TextStyle(
                    color: ConstantColors.normalTextColor,
                    fontSize: 13.sp,
                    fontFamily: ConstantStrings.kAppInterRegular),
              ),
              addH(20),
              Obx(() {
                if (_addressController.pMemberAddressLoading.value) {
                  return Text(
                      ''); /*SizedBox(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return const CustomAddressSkeleton();
                      },
                    ),
                  );*/
                } else {
                  if (_addressController
                      .memberAddressModel!.data.addresses.isNotEmpty) {
                    if (!walletController.walletDataLoadingFlag.value) {
                      if (walletController.walletResponseModel != null) {
                        walletBalance = walletController
                            .walletResponseModel!.data.wallet.actualBalance;
                        print("actual balance ${walletBalance}");
                      }
                    }
                    return SizedBox(
                      //     height: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        //   physics: const NeverScrollableScrollPhysics(),
                        itemCount: _addressController
                            .memberAddressModel!.data.addresses.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return /*BorderGradianColorButton(
                            style: ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                EdgeInsets.only(bottom: 20.h),
                              ),
                            ),
                            gradient: LinearGradient(colors: [
                              ConstantColors.lightYellow,
                              ConstantColors.darkYellow
                            ]),
                            onPressed: () {},
                            child: */
                              Container(
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ConstantColors.darkYellow,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: CustomAddress(
                              // address: addressController.memberAllAddressModel!.data.addresses[index],
                              nameLocation: _addressController
                                  .memberAddressModel!
                                  .data
                                  .addresses[index]
                                  .fullName,
                              icon: const Icon(
                                Icons.location_on_outlined,
                                color: Colors.black,
                              ),
                              addresslocation: _addressController
                                  .memberAddressModel!
                                  .data
                                  .addresses[index]
                                  .extraDirection,
                              //"Ulaya Dist., P.O.Box: 974, Riyadh, Saudi Arabia",
                              number: _addressController.memberAddressModel!
                                  .data.addresses[index].mobileNumber,
                              edite: InkWell(
                                onTap: () {},
                                child: SizedBox(
                                  //     width: 76.w,
                                  height: 22.h,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.edit_outlined,
                                        size: 18,
                                        color: Colors.black54,
                                      ),
                                      Text(
                                        "Change",
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontFamily: ConstantStrings
                                                .kAppInterRegular,
                                            color:
                                                ConstantColors.normalTextColor,
                                            decoration:
                                                TextDecoration.underline),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              addressId: _addressController.memberAddressModel!
                                  .data.addresses[index].addressBookId
                                  .toString(),
                              apartmentName: _addressController
                                  .memberAddressModel!
                                  .data
                                  .addresses[index]
                                  .apartmentNo,
                            ),
                          );
                          //   );
                        },
                      ),
                    );
                  } else {
                    return const Text("Address book is empty");
                  }
                }
              }),
              addH(20),
              // ()
              Obx(() {
                if (walletController.walletDataLoadingFlag.value) {
                  return Text('');
                } else {
              return    Visibility(
                    visible: walletController.walletResponseModel != null,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Wallet Balance : ",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: ConstantStrings.kAppInterSemiBold,
                                fontSize: 16.sp,
                              )),
                          TextSpan(
                              text: "${walletController
                                  .walletResponseModel!.data.wallet.currency} ${walletController
                                  .walletResponseModel!.data.wallet.actualBalance}",
                              style: TextStyle(
                                color: ConstantColors.grayBlack,
                                fontFamily: ConstantStrings.kAppInterBold,
                                fontSize: 16.sp,
                              )),
                        ]),
                      ),
                    ),
                  );
                }
              }),

              addH(20),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(1.2, 3.3),
                      blurRadius: 2,
                      spreadRadius: 0.1,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment Method",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: ConstantStrings.kAppInterBold,
                            fontSize: 18.sp),
                      ),
                      addH(10),
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
                                Center(
                                  child: Text(''),
                                ),
                              ],
                            );
                          } else {
                            if (walletController
                                    .walletResponseModel!.data.wallet ==
                                null) {
                              return const Column(
                                children: [
                                  Center(
                                    child: Text(''),
                                  ),
                                ],
                              );
                            } else {
                              return ListTile(
                                leading: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(1.2, 3.3),
                                            blurRadius: 2,
                                            spreadRadius: 0.1,
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                          "assets/images/wallet.png"),
                                    )),
                                title: Text(
                                  "HAZA Wallet",
                                  style: TextStyle(
                                      fontFamily:
                                          ConstantStrings.kAppInterRegular),
                                ),
                                trailing: Radio(
                                  value: "HAZA Wallet",
                                  activeColor: ConstantColors.darkYellow,
                                  groupValue: payWay,
                                  onChanged: (value) {
                                    setState(() {
                                      paymentMethodId = 2;
                                      payWay = value.toString();
                                      print("payway ${payWay}");
                                    });
                                  },
                                ),
                              );
                            }
                          }
                        }
                      }),
                      ListTile(
                        leading: Container(
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(1.2, 3.3),
                                    blurRadius: 2,
                                    spreadRadius: 0.1,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                  "assets/images/logos_mastercard.png"),
                            )),
                        title: Text(
                          "Online Payment",
                          style: TextStyle(
                              fontFamily: ConstantStrings.kAppInterRegular),
                        ),
                        trailing: Radio(
                          value: "Online Payment",
                          groupValue: payWay,
                          activeColor: ConstantColors.darkYellow,
                          onChanged: (value) {
                            setState(() {
                              print("payway ${payWay}");
                              paymentMethodId = 1;

                              payWay = value.toString();
                            });
                          },
                        ),
                      ),
                      /*   ListTile(
                        leading: Container(
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(1.2, 3.3),
                                    blurRadius: 2,
                                    spreadRadius: 0.1,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  Image.asset("assets/images/logos_visa.png"),
                            )),
                        title: Text(
                          "Visa",
                          style: TextStyle(
                              fontFamily: ConstantStrings.kAppInterRegular),
                        ),
                        trailing: Radio(
                          value: "Visa",
                          groupValue: payWay,
                          onChanged: (value) {
                            setState(() {
                              paymentMethodId = 1;
                              payWay = value.toString();
                              print("payway ${payWay}");
                            });
                          },
                        ),
                      ),*/
                      addH(20),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: ConstantColors.grayShade,
            spreadRadius: 20,
            blurRadius: 20,
            offset: const Offset(0, 5),
          )
        ]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomElevatedButton(
            width: MediaQuery.sizeOf(context).width,
            height: 50.h,
            onPressed: () {
              if (_addressController
                  .memberAddressModel!.data.addresses.isNotEmpty) {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Proceed to checkout?'),
                    // content: const Text('confirm the Checkout?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: ConstantStrings.kAppInterFont,
                              fontSize: 16.sp),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (paymentMethodId == 1) {
                            Get.back();

                            _checkOutController.checkoutStripe(
                              memberId: Preference.getMemberId(),
                              addressId: _addressController.memberAddressModel!
                                  .data.addresses[0].addressBookId,
                              useDifrentShipping: 2,
                              cardNo: '',
                              currency: '1',
                              fullName: _addressController.memberAddressModel!
                                  .data.addresses[0].fullName,
                              mobileNumber: _addressController
                                  .memberAddressModel!
                                  .data
                                  .addresses[0]
                                  .mobileNumber,
                              area: _addressController
                                  .memberAddressModel!.data.addresses[0].area,
                              appartment: _addressController.memberAddressModel!
                                  .data.addresses[0].apartmentNo,
                              extraDirection: _addressController
                                  .memberAddressModel!
                                  .data
                                  .addresses[0]
                                  .extraDirection,
                              currentLocation: _addressController
                                  .memberAddressModel!
                                  .data
                                  .addresses[0]
                                  .currentLocation,
                              latitude: _addressController.memberAddressModel!
                                  .data.addresses[0].latitude,
                              longitude: _addressController.memberAddressModel!
                                  .data.addresses[0].longitude,
                              paymentMethodId: paymentMethodId,
                            );

                            Get.defaultDialog(
                              title: "Please Wait..",
                              content: Obx(
                                () {
                                  if (_checkOutController
                                      .checkOutStripeLoading.value) {
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
                                    if (_checkOutController
                                            .checkoutStripeResponseModel !=
                                        null) {
                                      Future.delayed(const Duration(seconds: 1),
                                          () {
                                        Get.back();
                                        initThePaymentSheet();
                                      });

                                      /*     Future.delayed(
                                        const Duration(seconds: 1),
                                        () {
                                          Get.back();

                                          _checkOutController.checkout(
                                              memberId:
                                                  Preference.getMemberId(),
                                              addressId: _addressController
                                                  .memberAddressModel!
                                                  .data
                                                  .addresses[0]
                                                  .addressBookId,
                                              useDifrentShipping: 2,
                                              cardNo: '',
                                              currency: '1',
                                              fullName: _addressController
                                                  .memberAddressModel!
                                                  .data
                                                  .addresses[0]
                                                  .fullName,
                                              mobileNumber: _addressController
                                                  .memberAddressModel!
                                                  .data
                                                  .addresses[0]
                                                  .mobileNumber,
                                              area: _addressController
                                                  .memberAddressModel!
                                                  .data
                                                  .addresses[0]
                                                  .area,
                                              appartment: _addressController
                                                  .memberAddressModel!
                                                  .data
                                                  .addresses[0]
                                                  .apartmentNo,
                                              extraDirection: _addressController
                                                  .memberAddressModel!
                                                  .data
                                                  .addresses[0]
                                                  .extraDirection,
                                              currentLocation: _addressController
                                                  .memberAddressModel!
                                                  .data
                                                  .addresses[0]
                                                  .currentLocation,
                                              latitude: _addressController.memberAddressModel!.data.addresses[0].latitude,
                                              longitude: _addressController.memberAddressModel!.data.addresses[0].longitude,
                                              paymentMethodId: paymentMethodId);

                                          Get.defaultDialog(
                                            title: "Please Wait..",
                                            content: Obx(
                                              () {
                                                if (_checkOutController
                                                    .checkOutLoading.value) {
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
                                                  if (_checkOutController
                                                          .checkoutModel !=
                                                      null) {
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
                                                          Get.toNamed(HomeScreen
                                                              .routeName);
                                                        });
                                                      },
                                                    );
                                                    return const Text('Failed');
                                                  }
                                                }
                                              },
                                            ),
                                          );

                                          */ /*    setState(() {
                                        Get.back();
                                        Get.offAllNamed(ThankYouPage.routeName,arguments: [_checkOutController.checkoutModel!.data.invoice.refNo]);
                                      });*/ /*
                                        },
                                      );*/
                                      return const Text('Success');
                                    } else {
                                      Future.delayed(
                                        const Duration(seconds: 2),
                                        () {
                                          setState(() {
                                            Get.toNamed(HomeScreen.routeName);
                                          });
                                        },
                                      );
                                      return const Text('Failed');
                                    }
                                  }
                                },
                              ),
                            );

//TODO checkout

/*
*/
                          } else {
                            if (walletBalance > Preference.getTotalPrice()) {
                              _checkOutController.checkout(
                                  memberId: Preference.getMemberId(),
                                  addressId: _addressController
                                      .memberAddressModel!
                                      .data
                                      .addresses[0]
                                      .addressBookId,
                                  useDifrentShipping: 2,
                                  cardNo: '',
                                  currency: '1',
                                  fullName: _addressController
                                      .memberAddressModel!
                                      .data
                                      .addresses[0]
                                      .fullName,
                                  mobileNumber: _addressController
                                      .memberAddressModel!
                                      .data
                                      .addresses[0]
                                      .mobileNumber,
                                  area: _addressController.memberAddressModel!
                                      .data.addresses[0].area,
                                  appartment: _addressController
                                      .memberAddressModel!
                                      .data
                                      .addresses[0]
                                      .apartmentNo,
                                  extraDirection: _addressController
                                      .memberAddressModel!
                                      .data
                                      .addresses[0]
                                      .extraDirection,
                                  currentLocation: _addressController
                                      .memberAddressModel!
                                      .data
                                      .addresses[0]
                                      .currentLocation,
                                  latitude: _addressController.memberAddressModel!.data.addresses[0].latitude,
                                  longitude: _addressController.memberAddressModel!.data.addresses[0].longitude,
                                  paymentMethodId: paymentMethodId,
                                  paymentId: "");

                              Get.defaultDialog(
                                title: "Please Wait..",
                                content: Obx(
                                  () {
                                    if (_checkOutController
                                        .checkOutLoading.value) {
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
                                      if (_checkOutController.checkoutModel !=
                                          null) {
                                        Future.delayed(
                                          const Duration(seconds: 1),
                                          () {
                                            //  setState(() {
                                            /*     initThePaymentSheet();
                                          Get.back();
                                          Get.back();*/

                                            Get.offAllNamed(
                                                ThankYouPage.routeName,
                                                arguments: [
                                                  _checkOutController
                                                      .checkoutModel!
                                                      .data
                                                      .invoice
                                                      .refNo
                                                ]);
                                            // });
                                          },
                                        );
                                        return const Text('Success');
                                      } else {
                                        Future.delayed(
                                          const Duration(seconds: 2),
                                          () {
                                            setState(() {
                                              Get.toNamed(HomeScreen.routeName);
                                            });
                                          },
                                        );
                                        return const Text('Failed');
                                      }
                                    }
                                  },
                                ),
                              );
                            } else {
                              Methods.showSnackbar(
                                msg: 'Wallet balance is insufficient',
                              );
                            }
                          }
                        },
                        child: Text(
                          'Confirm',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: ConstantStrings.kAppInterFont,
                              fontSize: 16.sp),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please add an address")));
              }

              // Get.to(() => ThankYouPage());
            },
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ConstantColors.lightYellow,
                  ConstantColors.darkYellow
                ]),
            borderRadius: BorderRadius.circular(5),
            child: Text(
              'Checkout',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontFamily: ConstantStrings.kAppInterSemiBold),
            ),
          ),
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

      /*  _checkOutController.updatePaymentStatus(
          _checkOutController.checkoutModel!.data.invoice.invoiceMasterid,
          Preference.getPaymentId());*/

      Future.delayed(
        const Duration(seconds: 1),
        () {
          Get.back();

          _checkOutController.checkout(
              memberId: Preference.getMemberId(),
              addressId: _addressController
                  .memberAddressModel!.data.addresses[0].addressBookId,
              useDifrentShipping: 2,
              cardNo: '',
              currency: '1',
              fullName: _addressController
                  .memberAddressModel!.data.addresses[0].fullName,
              mobileNumber: _addressController
                  .memberAddressModel!.data.addresses[0].mobileNumber,
              area:
                  _addressController.memberAddressModel!.data.addresses[0].area,
              appartment: _addressController
                  .memberAddressModel!.data.addresses[0].apartmentNo,
              extraDirection: _addressController
                  .memberAddressModel!.data.addresses[0].extraDirection,
              currentLocation: _addressController
                  .memberAddressModel!.data.addresses[0].currentLocation,
              latitude: _addressController
                  .memberAddressModel!.data.addresses[0].latitude,
              longitude: _addressController
                  .memberAddressModel!.data.addresses[0].longitude,
              paymentMethodId: paymentMethodId,
              paymentId: Preference.getPaymentId());

          Get.defaultDialog(
            title: "Please Wait..",
            content: Obx(
              () {
                if (_checkOutController.checkOutLoading.value) {
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
                  if (_checkOutController.checkoutModel != null) {
                    Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        //  setState(() {
                        //  initThePaymentSheet();
                        Get.back();
                        Get.back();

                        //TODO uncomment
                        Get.offAllNamed(ThankYouPage.routeName, arguments: [
                          _checkOutController.checkoutModel!.data.invoice.refNo
                        ]);
                        //    });
                      },
                    );
                    return const Text('Success');
                  } else {
                    Future.delayed(
                      const Duration(seconds: 2),
                      () {
                        setState(() {
                          Get.toNamed(HomeScreen.routeName);
                        });
                      },
                    );
                    return const Text('Failed');
                  }
                }
              },
            ),
          );

          /*    setState(() {
                                        Get.back();
                                        Get.offAllNamed(ThankYouPage.routeName,arguments: [_checkOutController.checkoutModel!.data.invoice.refNo]);
                                      });*/
        },
      );

      /*   Get.offAllNamed(ThankYouPage.routeName,
          arguments: [_checkOutController.checkoutModel!.data.invoice.refNo]);
*/
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
