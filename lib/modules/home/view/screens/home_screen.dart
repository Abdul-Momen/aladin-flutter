import 'package:aladin/modules/auth/view/Login.dart';
import 'package:aladin/modules/cart/controller/cart_controller.dart';
import 'package:aladin/modules/coupons/view/coupons.dart';
import 'package:aladin/modules/home/controller/homepage_controller.dart';
import 'package:aladin/modules/home/view/screens/drawer.dart';
import 'package:aladin/modules/home/view/screens/home_page/home_page.dart';
import 'package:aladin/modules/cart/views/screen/my_cart_page.dart';
import 'package:aladin/modules/winer/view/winners_screen.dart';
import 'package:aladin/modules/wishlist/view/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../states/data/prefs.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/homeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedPage = 0;

  HomePageController homePageController = Get.find<HomePageController>();
  CartController cartController = Get.find<CartController>();


  @override
  void initState() {
    List<String> args = Get.arguments ?? [];
    if (args.isNotEmpty) {
      _selectedPage = int.parse(args[0]);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: HomeDrawer(
        scaffoldKey: _scaffoldKey,
        navigatingFn: (value) {
          _scaffoldKey.currentState!.closeDrawer();
          setState(
            () => _selectedPage = value,
          );
          /* if (value != 5) {
          }*/
        },
      ),
      body: getBodyView(),

    );
  }

  Widget getBodyView() {
    switch (_selectedPage) {
      case 0:
        return HomePage(
          scaffoldKey: _scaffoldKey,
          homePageController: homePageController,
        );
      case 1:
        if (Preference.getLoggedInFlag()){
          return const WishListScreen();
        }else {

          return const LoginPage();}
      case 2:
        return const WinnerScreen();
      case 3:
        return const CouponsScreen();
      case 4:
        if (Preference.getLoggedInFlag()){
          return MyCartPage(
            cartController: cartController,
          );
        }else {

          return const LoginPage();}


      default:
        return const Center(
          child: Text(
            "Something wrong",
          ),
        );
    }
  }
}
