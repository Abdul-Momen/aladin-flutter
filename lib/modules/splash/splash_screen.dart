import 'dart:async';
import 'package:aladin/modules/home/view/screens/home_screen.dart';
import 'package:aladin/modules/onbording/view/onbording_screen.dart';
import 'package:aladin/states/data/prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../onbording/controller/bannar_controller.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';

  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final BannerController _bannerController = Get.put(BannerController());

  @override
  void initState() {
    super.initState();
    _bannerController.getOnboardImg();

    Future.delayed(
      const Duration(seconds: 1),
      //go home page
      () {
        if (Preference.getIsFristOnbordingFlag()) {

          // Get.offAndToNamed(WalletScreen.routeName
          // );
//TODO uncomment
          //   if (Preference.getLoggedInFlag()) {
          Get.offAndToNamed(HomeScreen.routeName);
         /* } else {
            Get.offAndToNamed(LoginPage.routeName);
          }*/
        } else {
         // Get.offAndToNamed(HomeScreen.routeName);

              // TODO uncomment
       Get.offAndToNamed(Onboard.routeName);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: <Widget>[
          Image.asset(
            'assets/images/splash_screen.png',
            fit: BoxFit.fill,
            // height: double.infinity,
            // width: double.infinity,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            repeat: ImageRepeat.noRepeat,
          ),
        ]),
      ),
    );
  }
}
