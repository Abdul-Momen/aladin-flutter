import 'package:aladin/constants/color.dart';
import 'package:aladin/constants/string.dart';
import 'package:aladin/modules/address/view/screen/address_book.dart';
import 'package:aladin/modules/all_campaign/view/all_campaign.dart';
import 'package:aladin/modules/auth/view/Login.dart';
import 'package:aladin/modules/home/view/widget/drawer_item.dart';
import 'package:aladin/modules/notification/view/notification_screen.dart';
import 'package:aladin/modules/profile/view/profile_screen.dart';
import 'package:aladin/modules/wallet/view/wallet_screen.dart';
import 'package:aladin/modules/wishlist/view/wishlist_screen.dart';
import 'package:aladin/states/data/prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../helper/helper.dart';
import '../../../../states/controller/country_controller.dart';
import '../../../../states/model/all_country_model.dart';
import '../../../cart/controller/cart_controller.dart';
import '../../../coupons/view/coupons.dart';
import '../../controller/homepage_controller.dart';
import 'home_page/home_page.dart';
import 'home_screen.dart';

class HomeDrawer extends StatefulWidget {
  final void Function(int) navigatingFn;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomeDrawer({
    Key? key,
    //required this.userDetails,
    required this.navigatingFn,
    // required this.context,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  final CountryController _countryController = Get.find<CountryController>();
  HomePageController homePageController = Get.find<HomePageController>();
  CartController cartController = Get.find<CartController>();

  @override
  void initState() {
    _countryController.getAllCountry();

    //cartController.getCartCount(memberId: Preference.getMemberId());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> menuTitle = [
      // section 1
      'Home',
      'Profile',
      'My Coupons',
      'Wishlist',
      'Campaigns',
      'Products',
      'Notifications',
      //  'Share this App',
      'Logout',
    ];

    return Drawer(
      backgroundColor: Colors.white,
      width: 300.w,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: ConstantColors.lightRed,
          width: 1,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Drawer Header
            Container(
              height: 230.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  'assets/images/drawer_bg.png',
                ),
                fit: BoxFit.fill,
              )),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    addH(5),
                    //profile image
                    InkWell(
                      onTap: () {
                        Get.toNamed(ProfileScreen.routeName);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/img.png',
                            fit: BoxFit.fill,
                            // height: double.infinity,
                            // width: double.infinity,
                            width: 50.w,
                            height: 50.h,
                            alignment: Alignment.center,
                            repeat: ImageRepeat.noRepeat,
                          ),
                          addW(7.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                Preference.getLoggedInFlag()
                                    ? Preference.getFullName()
                                    : '',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              addH(5.h),
                            ],
                          )
                        ],
                      ),
                    ),

                    Container(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          addH(5.h),
                        //  print("  Preference.getLoggedInFlag() ${  Preference.getLoggedInFlag()}");
                          Visibility(
                            //Preference.getLoggedInFlag()==true?false:true
                            visible:
                            Preference.getLoggedInFlag() == false,
                          /*  visible:
                                Preference.getLoggedInFlag() ? false : true,*/
                            child: Container(
                              width: 270.w,
                              height: 46.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white.withOpacity(0.3),
                                  border: Border.all(
                                      width: 2,
                                      color: Colors.white.withOpacity(0.5),
                                      strokeAlign:
                                          BorderSide.strokeAlignCenter)),
                              child: DropdownButtonHideUnderline(
                                child: Obx(() {
                                  if (_countryController
                                      .pAllCountryLoading.value) {
                                    return const Column(
                                      children: [
                                        Center(
                                          child: Text(''),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return DropdownButton<Country>(
                                      elevation: 0,
                                      value: _countryController
                                          .dropdownvalue.value,
                                      icon: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Icon(
                                            Icons.arrow_drop_down_outlined,
                                            size: 20,
                                            color: Colors.black),
                                      ),
                                      items: _countryController
                                          .allCountryModel
                                          .value
                                          .data!
                                          .countries
                                          .map(
                                            (map) =>
                                                DropdownMenuItem<Country>(
                                              value: map,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  map.countryName ?? '',
                                                  style: const TextStyle(
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (Country? newValue) {
                                        //setState(() {
                                        _countryController
                                            .dropdownvalue.value = newValue!;
                                        Preference.setCountryId(
                                            _countryController.dropdownvalue
                                                    .value!.countryId ??
                                                201);
                                        Future.delayed(
                                          const Duration(seconds: 2),
                                          () {
                                            setState(() {
                                              Get.offAllNamed(
                                                  HomeScreen.routeName);
                                            });
                                          },
                                        );
                                        //   });
                                      },
                                    );
                                  }
                                }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /*   Padding(
              padding: EdgeInsets.only(left: 18.w),
              child: Text(
                "Dashboard",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: ConstantColors.grayBlack),
              ),
            ),*/
            //  buildDivider(),

            Container(
              color: Colors.white,
              child: Column(
                children: [
                  addH(10.h),
                  DrawerItem(
                    title: menuTitle[0],
                    onTap: () {
                      widget.scaffoldKey.currentState!.openEndDrawer();
                    },
                    iconData: Icons.home,
                  ),
                  DrawerItem(
                    title: menuTitle[1],
                    onTap: () {
                      if (Preference.getLoggedInFlag()) {
                        Get.toNamed(ProfileScreen.routeName);
                      } else {
                        Get.toNamed(LoginPage.routeName);
                      }
                    },
                    iconData: Icons.person,
                  ),
                  DrawerItem(
                    title: menuTitle[2],
                    onTap: () {
                      if (Preference.getLoggedInFlag()) {
                        Get.toNamed(CouponsScreen.routeName);
                      } else {
                        Get.toNamed(LoginPage.routeName);
                      }
                    },
                    iconData: Icons.money,
                  ),
                  DrawerItem(
                    title: menuTitle[3],
                    onTap: () {
                      if (Preference.getLoggedInFlag()) {
                        Get.toNamed(WishListScreen.routeName);
                      } else {
                        Get.toNamed(LoginPage.routeName);
                      }
                    },
                    iconData: Icons.favorite_border_outlined,
                  ),
                  DrawerItem(
                    title: 'Wallet',
                    onTap: () {
                      if (Preference.getLoggedInFlag()) {
                        Get.toNamed(WalletScreen.routeName);
                      } else {
                        Get.toNamed(LoginPage.routeName);
                      }
                    },
                    iconData: Icons.wallet,
                  ),
                  DrawerItem(
                    title: menuTitle[4],
                    onTap: () => Get.toNamed(AllCampaignScreen.routeName),
                    iconData: Icons.campaign,
                  ),
                  /*    DrawerItem(
              title: menuTitle[5],
              onTap: () => Get.toNamed(AladinProductsScreen.routeName),
              iconData: Icons.production_quantity_limits_rounded,
            ),*/
                  DrawerItem(
                    title: menuTitle[6],
                    onTap: () {
                      if (Preference.getLoggedInFlag()) {
                        Get.toNamed(NotificationScreen.routeName);
                      } else {
                        Get.toNamed(LoginPage.routeName);
                      }
                    },
                    iconData: Icons.notifications_none_outlined,
                  ),
                  DrawerItem(
                    title: "Address Book",
                    onTap: () {
                      if (Preference.getLoggedInFlag()) {
                        Get.toNamed(AddressBook.routeName, arguments: [true]);
                      } else {
                        Get.toNamed(LoginPage.routeName);
                      }
                    },
                    iconData: Icons.edit_location_alt,
                  ),
                  /* DrawerItem(
                    title: menuTitle[7],
                    onTap: () {},
                    iconData: Icons.share,
                  ),
*/
                  DrawerItem(
                    title: Preference.getLoggedInFlag() ? "Logout" : 'Login',
                    onTap: () {
                      if (Preference.getLoggedInFlag()) {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Logout!'),
                              content:
                                  const Text('Are you sure want to logout?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily:
                                            ConstantStrings.kAppInterFont,
                                        fontSize: 16.sp),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                    Get.back();
                                    Preference.logOut();

                                    setState(() {
                                      cartController.cartItemCount.value = 0;

                                      homePageController.getRunningCampaign(
                                          Preference.getCountryId());
                                      homePageController.getClosingSoon(
                                          Preference.getCountryId());
                                      homePageController.getALlRunningCampaign(
                                          Preference.getCountryId());
                                      homePageController.getSoldOut(
                                          Preference.getCountryId());
                                      homePageController
                                          .getWinner(Preference.getCountryId());
                                    });
                                  },
                                  child: Text(
                                    'Confirm',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily:
                                            ConstantStrings.kAppInterFont,
                                        fontSize: 16.sp),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                      if (!Preference.getLoggedInFlag()) {
                        print("logged in flag ${Preference.getLoggedInFlag()}");
                        //   () =>
                        Get.toNamed(LoginPage.routeName);
                      }
                    },
                    iconData: Icons.login_outlined,
                  ),
                  addH(50.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          homePageController.launchURL(
                              'https://hazadeals.com/privacy-policy');
                        },
                        child: const Text(
                          "Privacy Policy",
                          style: TextStyle(
                            fontSize: 13,
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          homePageController.launchURL(
                              'https://hazadeals.com/user-aggrement');
                        },
                        child: const Text(
                          "Terms and Conditions",
                          style: TextStyle(
                            fontSize: 13,
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  addH(50.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDivider() {
    return Divider(
      color: Colors.grey,
      thickness: 0.2,
      indent: 15.w,
      endIndent: 15.w,
    );
  }

/*
  Widget footerImg(String svgImg, String url) {
    return Container(
      width: 30.w,
      height: 30.h,
      margin: EdgeInsets.only(right: 10.w, top: 15.h),
      child: InkWell(
        onTap: () {},
        child: Center(
          child: SvgPicture.asset(
            svgImg,
            height: 30.h,
            width: 30.w,
            allowDrawingOutsideViewBox: true,
          ),
        ),
      ),
    );
  }*/

  Widget buildMenuTitle({
    required String title,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 18.w),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: ConstantStrings.kAppInterBold,
        ),
      ),
    );
  }
}
