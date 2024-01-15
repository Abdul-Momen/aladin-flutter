import 'dart:async';

import 'package:aladin/constants/color.dart';
import 'package:aladin/modules/coupons/view/coupons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../modules/auth/view/Login.dart';
import '../modules/cart/controller/cart_controller.dart';
import '../modules/cart/views/screen/my_cart_page.dart';
import '../modules/home/view/screens/home_screen.dart';
import '../modules/winer/view/winners_screen.dart';
import '../modules/wishlist/view/wishlist_screen.dart';
import '../states/data/prefs.dart';
import 'nav_icon.dart';

class CustomBottomNavigation extends StatefulWidget {
  int selectedNavIndex;
  Color? btnBgClr;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final bool _open = false;

  CustomBottomNavigation({
    Key? key,
    required this.selectedNavIndex,
  }) : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  final bool _loginFlag = false;
  CartController cartController = Get.find<CartController>();

  //final CartController _cartController = CartController();
  Timer? timer;

  // int? count;
  bool isOpen = false;

  int get selectedNavIndex => widget.selectedNavIndex;
  late PersistentBottomSheetController _controller;

  @override
  void initState() {

  /*  if (Preference.getLoggedInFlag()) {
      //TODO UNCOMMENT
      timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        cartController.getCartCount(memberId: Preference.getMemberId());

      });
    }
*/

  if (Preference.getLoggedInFlag()) {
      //TODO UNCOMMENT
      cartController.getCartCount(memberId: Preference.getMemberId());
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      width: double.infinity,

      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
            top: BorderSide(
          color: Colors.black12,
          width: 1,
        )),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavIcon(
            isSelected: widget.selectedNavIndex == 0,
            icon: (selectedNavIndex == 0) ? Icons.home : Icons.home_outlined,
            title: 'Home',
            onTapFn: () {
              widget.selectedNavIndex = 0;
              if (selectedNavIndex == 0) {
                widget.selectedNavIndex = 0;

                if (Get.currentRoute != HomeScreen.routeName) {
                  Get.toNamed(
                    HomeScreen.routeName,
                  );
                }
                setState(() {});
              }
            },
          ),
          NavIcon(
              isSelected: widget.selectedNavIndex == 1,
              icon: (selectedNavIndex == 1)
                  ? Icons.favorite
                  : Icons.favorite_border,
              title: 'Wishlist',
              onTapFn: () {
                if (Preference.getLoggedInFlag()) {
                  Get.toNamed(
                    WishListScreen.routeName,
                  );
                } else {
                  Get.toNamed(
                    LoginPage.routeName,
                  );
                }
              }),
          NavIcon(
              isSelected: widget.selectedNavIndex == 2,
              icon: (selectedNavIndex == 2)
                  ? Icons.print
                  : Icons.local_print_shop_outlined,
              title: 'Draws',
              onTapFn: () {
                Get.toNamed(
                  WinnerScreen.routeName,
                );
              }),
          NavIcon(
              isSelected: widget.selectedNavIndex == 3,
              icon: (selectedNavIndex == 3)
                  ? Icons.explore
                  : Icons.explore_outlined,
              title: 'Coupons',
              onTapFn: () {
                if (Preference.getLoggedInFlag()) {
                  Get.toNamed(
                    CouponsScreen.routeName,
                  );
                } else {
                  Get.toNamed(
                    LoginPage.routeName,
                  );
                }
              }),
          Stack(children: [
            NavIcon(
                isSelected: widget.selectedNavIndex == 4,
                icon: (selectedNavIndex == 4)
                    ? Icons.shopping_cart
                    : Icons.shopping_cart_outlined,
                title: 'Cart',
                onTapFn: () {
                  print(
                      "Preference.getLoggedInFlag() ${Preference.getLoggedInFlag()}");
                  if (Preference.getLoggedInFlag()) {
                    Get.to(() => MyCartPage(cartController: cartController));

                    //  Get.to(MyCartPage(cartController:cartController));
                  } else {
                    Get.toNamed(
                      LoginPage.routeName,
                    );
                  }
                }),
            Obx(() {
              if (!cartController.pCartCountLoading.value &&
                  Preference.getLoggedInFlag()) {
                print("cart countttttt  ${cartController.cartItemCount.value}");
                return Positioned(
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: (cartController.cartItemCount.value == 0)
                          ? Colors.white
                          : ConstantColors.darkYellow,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: Text(
                      '${cartController.cartItemCount.value}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              } else {
                return const Text("");
              }
            }),
          ]),
        ],
      ),
      // ),//
    );
  }
}
