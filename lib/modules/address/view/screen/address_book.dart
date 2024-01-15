import 'package:aladin/constants/color.dart';
import 'package:aladin/constants/string.dart';
import 'package:aladin/helper/helper.dart';
import 'package:aladin/modules/address/controller/address_controller.dart';
import 'package:aladin/modules/address/view/screen/add_edit_address.dart';
import 'package:aladin/modules/address/view/widget/custom_address.dart';
import 'package:aladin/states/data/prefs.dart';
import 'package:aladin/widget/border_gradian_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../widget/custom_elevated_button.dart';
import '../../../../widget/error_box.dart';
import '../../../checkout/view/checkout_page.dart';

class AddressBook extends StatefulWidget {
  static String routeName = "/addressBook";

  const AddressBook({super.key});

  @override
  State<AddressBook> createState() => _AddressBookState();
}

class _AddressBookState extends State<AddressBook> {
  final AddressController addressController = Get.put(AddressController());
  int aId = 0;
  bool isSideMenuNavigation = false;

  @override
  void initState() {
    if (Get.arguments != null) {
      isSideMenuNavigation = Get.arguments[0];
    }
    addressController.getMemberAddressAll(memberId: Preference.getMemberId());
    addressController.removeAddress(AddressBookId: aId);
    // TODO: implement initState
    super.initState();
  }

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
        addressController.getMemberAddress(memberId: Preference.getMemberId());

        if (isSideMenuNavigation) {
          Get.back();
        } else {
          Get.back();
          Get.offAndToNamed(CheckOutPage.routeName);
        }

        return false;
      },
      child: Scaffold(
        //   appBar:
        /*CustomAppBar(
          height: 50.h,
          color: Colors.white,
          title: "Address Book",
        ),*/

        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 45.h),
                height: 50.h,
                color: Colors.white,
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            //setState(() {
                            addressController.getMemberAddress(
                                memberId: Preference.getMemberId());

                            if (isSideMenuNavigation) {
                              Get.back();
                            } else {
                              Future.delayed(const Duration(seconds: 1), () {
                                Get.back();
                                Get.offAndToNamed(CheckOutPage.routeName);
                              });
                            }

                            //    });
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                        //   if(onBack!=null)

                        addW(15.w),
                        Text(
                          "Address Book",
                          style: TextStyle(
                              color: ConstantColors.grayBlack,
                              fontSize: 20.sp,
                              fontFamily: ConstantStrings.kAppInterSemiBold),
                        ),
                      ],
                    ),
                    /* IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
            ),
          ),*/
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0.r),
                child: Column(
                  children: [











                    Align(
                      alignment: Alignment.topRight,
                      child:      CustomElevatedButton(
                        width: 220,
                        height: 40.h,
                        onPressed: () {
                          Get.toNamed(AddEditAddressScreen.routeName);

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
                          'Add New Address',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontFamily: ConstantStrings.kAppInterSemiBold),
                        ),
                      ),

                      /*Container(
                          width: 180.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              width: 0.5,
                              color: Colors.grey,
                            ),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(AddEditAddressScreen.routeName);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.add_circle_outline,
                                    size: 18.sp,
                                  ),
                                  Text(
                                    "Add New Address",
                                    style: TextStyle(
                                        color: ConstantColors.normalTextColor,
                                        fontFamily:
                                            ConstantStrings.kAppInterMedium),
                                  ),
                                ],
                              ),
                            ),
                          )),*/
                    ),
                    addH(10.h),
                    Obx(() {
                      if (addressController.pMemberAddressAllLoading.value) {
                        return  Center(
                          child: CircularProgressIndicator(
                            color: ConstantColors.darkYellow,

                          ),
                        );
                      /*  return SizedBox(
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
                        if (addressController
                            .memberAllAddressModel!.data.addresses.isNotEmpty) {
                          return SizedBox(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: addressController
                                  .memberAllAddressModel!.data.addresses.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Container(
                                    padding: EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: ConstantColors.darkYellow,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        if (!isSideMenuNavigation) {
                                          print("kooooooiiiiiiii,${addressController
                                              .memberAllAddressModel!
                                              .data
                                              .addresses[index]
                                              .addressBookId}" );
                                          addressController.postEditeAddress(
                                              addressBookId: addressController
                                                  .memberAllAddressModel!
                                                  .data
                                                  .addresses[index]
                                                  .addressBookId,
                                              fullName: Preference.getFullName(),
                                              mobileNumber: addressController
                                                  .memberAllAddressModel!
                                                  .data
                                                  .addresses[index]
                                                  .mobileNumber,
                                              area: addressController
                                                  .memberAllAddressModel!
                                                  .data
                                                  .addresses[index]
                                                  .area,
                                              apartmentNo: addressController
                                                  .memberAllAddressModel!
                                                  .data
                                                  .addresses[index]
                                                  .apartmentNo,
                                              extraDirection: addressController
                                                  .memberAllAddressModel!
                                                  .data
                                                  .addresses[index]
                                                  .extraDirection,
                                              currentLocation: addressController
                                                  .memberAllAddressModel!
                                                  .data
                                                  .addresses[index]
                                                  .currentLocation,
                                              latitude: "",
                                              longitude: '',
                                              memberId: Preference.getMemberId(),
                                              isDefault: true);
                                          addressController.getMemberAddress(
                                              memberId: Preference.getMemberId());
                                          Get.dialog(
                                            // title: 'Processing...',
                                            // content:
                                            Obx(
                                                  () {
                                                if (addressController
                                                    .pEditeAddressLoading.value) {
                                                  return  Center(
                                                    child: CircularProgressIndicator(
                                                      color: ConstantColors.darkYellow,
                                                    ),
                                                  );
                                                } else {
                                                  if (!addressController
                                                      .editeAddressModel!.isSuccess) {
                                                    return ErrorBox(
                                                        errorMessage:
                                                        addressController
                                                            .editeAddressModel!.message);
                                                    //  SnackBar(content: Text("Something went wrong"));
                                                  } else {
                                                    addressController.getMemberAddress(memberId: Preference.getMemberId());
                                                    Get.back();
                                                    //  Navigator.pop(context);
                                                    Future.delayed(
                                                      const Duration(seconds: 2),
                                                          () =>          Get.offAndToNamed(CheckOutPage.routeName)
                                                      ,
                                                    );
                                                    return const Center(
                                                      child: null,
                                                      //Text('Order placed successfully'),
                                                    );
                                                  }
                                                }
                                              },
                                            ),
                                          );
                                     /*     Future.delayed(
                                              const Duration(seconds: 1), () {
                                            Get.back();
                                            //o Get.offAndToNamed(CheckOutPage.routeName);
                                          });*/
                                        }
                                      },
                                      child: CustomAddress(
                                        // address: addressController.memberAllAddressModel!.data.addresses[index],
                                        nameLocation: addressController
                                            .memberAllAddressModel!
                                            .data
                                            .addresses[index]
                                            .fullName,

                                        icon: const Icon(
                                          Icons.location_on_outlined,
                                          color: Colors.black,
                                        ),
                                        addresslocation: addressController
                                            .memberAllAddressModel!
                                            .data
                                            .addresses[index]
                                            .extraDirection,
                                        number: addressController
                                            .memberAllAddressModel!
                                            .data
                                            .addresses[index]
                                            .mobileNumber,
                                        edite: SizedBox(
                                          width: 60.w,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.edit_outlined,
                                                size: 18,
                                                color: ConstantColors
                                                    .normalTextColor,
                                              ),
                                              addW(20.w),
                                              InkWell(
                                                  onTap: () {
                                                    addressController.removeAddress(
                                                        AddressBookId:
                                                            addressController
                                                                .memberAllAddressModel!
                                                                .data
                                                                .addresses[index]
                                                                .addressBookId);
                                                    Get.defaultDialog(
                                                      title: "Please wait..",
                                                      content: Obx(
                                                        () {
                                                          if (addressController
                                                              .pRemoveAddressLoading
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
                                                            if (addressController
                                                                    .removeAddressModel!
                                                                    .code ==
                                                                200) {
                                                              Future.delayed(
                                                                const Duration(
                                                                    seconds: 1),
                                                                () {
                                                                  setState(() {
                                                                    addressController
                                                                        .getMemberAddressAll(
                                                                            memberId:
                                                                                Preference.getMemberId());
                                                                    addressController
                                                                        .getMemberAddress(
                                                                            memberId:
                                                                                Preference.getMemberId());
                                                                    Get.back();
                                                                    Get.toNamed(
                                                                        AddressBook
                                                                            .routeName);
                                                                  });
                                                                },
                                                              );
                                                              return const Text(
                                                                  '');
                                                            } else {
                                                              return const Text(
                                                                  'Failed to remove');
                                                            }
                                                          }
                                                        },
                                                      ),
                                                    );
                                                  },
                                                  child: SvgPicture.asset(
                                                      'assets/svg/delete.svg')),
                                            ],
                                          ),
                                        ),
                                        addressId: addressController
                                            .memberAllAddressModel!
                                            .data
                                            .addresses[index]
                                            .addressBookId
                                            .toString(),
                                        apartmentName: addressController
                                            .memberAllAddressModel!
                                            .data
                                            .addresses[index]
                                            .apartmentNo,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          return const Text("List is Empty");
                        }
                      }
                    }),
                    addH(10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
