import 'package:aladin/constants/color.dart';
import 'package:aladin/constants/string.dart';
import 'package:aladin/helper/helper.dart';
import 'package:aladin/modules/profile/controller/profile_controller.dart';
import 'package:aladin/modules/profile/view/edit_profile_page.dart';
import 'package:aladin/modules/wallet/view/wallet_screen.dart';
import 'package:aladin/states/data/prefs.dart';
import 'package:aladin/widget/border_gradian_color.dart';
import 'package:aladin/widget/custom_appbar.dart';
import 'package:aladin/widget/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widget/custom_elevated_button.dart';
import '../../wallet/controller/wallet_controller.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/ProfileScreen";

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.find<ProfileController>();
  final WalletController walletController = Get.find<WalletController>();

  @override
  void initState() {
    walletController.getWalletData();
    profileController.getProfileInfo(memberId: Preference.getMemberId());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: CustomAppBar(height: 75.h, title: "Profile"),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        /*    Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Profile",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: ConstantStrings.kAppInterBold,
                      color: ConstantColors.grayBlack),
                ),
                SizedBox(
                  height: 32.h,
                  width: 180.w,
                  child: BorderGradianColorButton(
                    thickness: 0.5,
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                    ),
                    onPressed: () {
                      Get.to(() => const EditProfilePage());
                    },
                    gradient: const LinearGradient(colors: [
                      Colors.pink,
                      Colors.indigo,
                    ]),
                    child: Row(
                      children: [
                        Icon(
                          Icons.mode_edit_outline_outlined,
                          size: 18.sp,
                          color: Colors.black,
                        ),
                        addW(10),
                        Text(
                          "Edit Profile",
                          style: TextStyle(
                              fontFamily: ConstantStrings.kAppInterMedium,
                              color: ConstantColors.grayBlack),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: ConstantColors.grayShade,
              thickness: 0.2,
            ),
            addH(8),*/
            Obx(() {
              if (profileController.pProfileInfo.value) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Skeleton(
                          height: 10.h,
                          width: 100.w,
                        ),
                        Skeleton(
                          height: 10.h,
                          width: 100.w,
                        )
                      ],
                    ),
                    addH(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Skeleton(
                          height: 10.h,
                          width: 120.w,
                        ),
                        Skeleton(
                          height: 10.h,
                          width: 150.w,
                        )
                      ],
                    ),
                    addH(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Skeleton(
                          height: 10.h,
                          width: 120.w,
                        ),
                        Skeleton(
                          height: 10.h,
                          width: 150.w,
                        )
                      ],
                    ),
                    addH(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Skeleton(
                          height: 10.h,
                          width: 120.w,
                        ),
                        Skeleton(
                          height: 10.h,
                          width: 150.w,
                        )
                      ],
                    ),
                    addH(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Skeleton(
                          height: 10.h,
                          width: 120.w,
                        ),
                        Skeleton(
                          height: 10.h,
                          width: 150.w,
                        )
                      ],
                    ),
                    addH(10.h),
                  ],
                );
              } else {
                if (profileController.profileInfoModel!.isSuccess) {
                  return Column(
                    children: [
                      ProfileInfo(
                        title: "Full Name",
                        infoText: profileController
                            .profileInfoModel!.data.user.fullName,
                      ),
                      const Divide(thickness: 0.2),
                      ProfileInfo(
                        title: "Email",
                        infoText:
                            profileController.profileInfoModel!.data.user.email,
                      ),
                      const Divide(thickness: 0.2),
                      ProfileInfo(
                        title: "Mobile Number",
                        infoText: profileController
                            .profileInfoModel!.data.user.phoneNumber,
                      ),
                      const Divide(thickness: 0.2),
                      const ProfileInfo(
                        title: "Language",
                        infoText: 'English',
                      ),
                      const Divide(thickness: 0.2),
                      const ProfileInfo(
                        title: "Password",
                        infoText: "******",
                      ),
                      const Divide(thickness: 0.2),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        width: double.infinity,
                        height: 65.0.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: ConstantColors.darkYellow)
                            /*  gradient: LinearGradient(colors: [
                            ConstantColors.lightYellow,
                            ConstantColors.darkYellow,
                          ]),*/
                            ),
                        child: Obx(() {
                          if (walletController.walletDataLoadingFlag.value) {
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
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "Wallet Balance : ",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: ConstantStrings
                                                  .kAppInterSemiBold,
                                              fontSize: 16.sp,
                                            )),
                                        TextSpan(
                                            text:
                                                "${walletController.walletResponseModel!.data.wallet.currency} ${walletController.walletResponseModel!.data.wallet.actualBalance}",
                                            style: TextStyle(
                                              color: ConstantColors.grayBlack,
                                              fontFamily:
                                                  ConstantStrings.kAppInterBold,
                                              fontSize: 16.sp,
                                            )),
                                      ]),
                                    ),
                                  ),
                                  CustomElevatedButton(
                                    width: 120,
                                    height: 45.h,
                                    onPressed: () {
                                      Get.toNamed(WalletScreen.routeName);
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
                                    child: Text('Top Up',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily:
                                              ConstantStrings.kAppInterBold,
                                          fontSize: 16.sp,
                                        )),
                                  ),
                                ],
                              );
                            }
                          }
                        }),
                      ),
                      addH(60.h),                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(
                          width: Get.width,
                          child: CustomElevatedButton(
                            width: 100,
                            height: 45.h,
                            onPressed: () {
                              Get.dialog(
                                name: 'Warning',
                                // content:
                                Center(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 20),
                                    height: 210,
                                    width: Get.width - 50,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Column(
                                      children: [
                                        DefaultTextStyle(
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: ConstantStrings.kAppInterFont,
                                              fontSize: 18.sp,
                                            ), child: Text('Warning'),),
                                        addH(20),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                  text:
                                                      "If you wish to close your account,please send an email with reason to ",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    // fontFamily: ConstantStrings.kFontFamily
                                                  )),
                                              TextSpan(
                                                  text: 'info@hazadeals.com',
                                                  style: TextStyle(
                                                    color:
                                                        ConstantColors.blackShade,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontFamily: ConstantStrings
                                                        .kAppInterFont,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        addH(20),
                                        CustomElevatedButton(
                                          width:80,
                                          height: 45.h,
                                          onPressed: () {
                                            Get.back();
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
                                          child: Text('OK',
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
                            child: Text('Delete Account',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: ConstantStrings.kAppInterBold,
                                  fontSize: 16.sp,
                                )),
                          ),

                          /*       CustomElevatedButton(
                            btnRadius: BorderRadius.circular(8),
                            btnBgClr: ConstantColors.pantone,
                            btnFn: () {
                              setState(() {
                                // _loggingIn = true;
                                // Get.toNamed(RidersListScreen.routeName);
                                //Get.offAllNamed(HomeScreen.routeName);
                              });

                              Get.dialog(
                                name: 'Warning',
                                // content:
                                Center(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 20),
                                    height: 210,
                                    width: Get.width - 50,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Column(
                                      children: [
                                        AppText(
                                          text: 'Warning',
                                          textColor: ConstantColors.black,
                                          textSize: 20,
                                          isBold: true,
                                        ),
                                        addH(20),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                  text:
                                                  "If you wish to close your account,please send an email with reason to ",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.normal,
                                                    // fontFamily: ConstantStrings.kFontFamily
                                                  )),
                                              TextSpan(
                                                  text: 'nxbroadmin@nanostix.com',
                                                  style: TextStyle(
                                                    color: ConstantColors.pantone,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.normal,
                                                    decoration:
                                                    TextDecoration.underline,
                                                    fontFamily:
                                                    ConstantStrings.kAppFont,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        addH(20),
                                        CustomButton(
                                          btnSize: Size(60, 40),
                                          btnRadius: BorderRadius.circular(5),
                                          btnBgClr: ConstantColors.pantone,
                                          btnFn: () {
                                            Get.back();
                                          },
                                          btnText: 'OK',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            btnText:
                            //_loggingIn ? 'Processing...' :
                            'Delete Account',
                          ),*/
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Text("List is Empty");
                }
              }
            }),
          ],
        ),
      ),
    );
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
