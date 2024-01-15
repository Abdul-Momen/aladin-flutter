import 'package:aladin/constants/color.dart';
import 'package:aladin/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/custom_field.dart';

class TopUpScreen extends StatefulWidget {
  static String routeName = "/TopUpScreen";
  const TopUpScreen({super.key});

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  final TextEditingController _cardCon = TextEditingController();
  final TextEditingController _dateCon = TextEditingController();
  final TextEditingController _cvvCon = TextEditingController();

  @override
  void initState() {

  //  profileController.getProfileInfo(memberId: Preference.getMemberId());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: CustomAppBar(height: 75.h, title: "Top-Up"),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomField(
              brdrClr: ConstantColors.grayShade,
              fillClr: ConstantColors.grayShade,
              textCon: _cardCon,
              hintText: 'Credit or Debit Card Number',
              validatorFn: (value) {
                if (value!.length < 3) {
                  return 'Enter a valid name';
                }
                return null;
              },
            ),
            Row(
              children: [
                CustomField(

                  brdrClr: ConstantColors.grayShade,
                  fillClr: ConstantColors.grayShade,
                  textCon: _dateCon,
                  hintText: 'Expiry Date',
                  validatorFn: (value) {
                    if (value!.length < 3) {
                      return 'Enter a valid date';
                    }
                    return null;
                  },
                ),
                CustomField(
                  brdrClr: ConstantColors.grayShade,
                  fillClr: ConstantColors.grayShade,
                  textCon: _cvvCon,
                  hintText: 'Enter CVV',
                  validatorFn: (value) {
                    if (value!.length < 3) {
                      return 'Enter a valid cvv';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

