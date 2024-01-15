import 'package:aladin/constants/color.dart';
import 'package:aladin/constants/string.dart';
import 'package:aladin/helper/helper.dart';
import 'package:aladin/modules/home/view/screens/home_screen.dart';
import 'package:aladin/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ThankYouPage extends StatefulWidget {
  static String routeName = "/thankyou";

  const ThankYouPage({Key? key}) : super(key: key);

  @override
  State<ThankYouPage> createState() => _ThankYouPageState();
}

class _ThankYouPageState extends State<ThankYouPage> {
  String ref='';
  @override
  void initState() {
    // TODO: implement initState
    if (Get.arguments != null) {
      ref = Get.arguments[0];
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Thank you!',
                style: TextStyle(
                  color: ConstantColors.darkYellow,
                  fontFamily:
                  ConstantStrings.kAppInterBold,
                  fontSize: 50,
                )),
            addH(15),
            Text("For participating in the Campaign",
                style: TextStyle(
                    fontFamily: ConstantStrings.kAppInterRegular,
                    color: Colors.black87)),
            addH(5),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Your invoice number is: ",
                  style: TextStyle(
                      fontFamily: ConstantStrings.kAppInterRegular,
                      color: Colors.black87)),
              TextSpan(
                  text: "#$ref",
                  style: TextStyle(
                      fontFamily: ConstantStrings.kAppInterBold,
                      color: Colors.black)),
            ])),
            addH(30.h),
            CustomElevatedButton(
                width: 230.w,
                height: 40.h,
                onPressed: () {
                  Get.offAndToNamed(HomeScreen.routeName);
                },
                border: Border.all(color: ConstantColors.grayBlack, width: 0.3),
                borderRadius: BorderRadius.circular(5),
                child: Text(
                  'Continue Shopping',
                  style: TextStyle(
                      fontFamily: ConstantStrings.kAppInterSemiBold,
                      color: Colors.black,
                      fontSize: 16.sp),
                )),
          ],
        ),
      ),
    );
  }
}
