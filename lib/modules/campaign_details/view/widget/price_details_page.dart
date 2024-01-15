import 'package:aladin/constants/color.dart';
import 'package:aladin/constants/string.dart';
import 'package:aladin/modules/campaign_details/model/campaign_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helper/helper.dart';

class PriceDetailsPage extends StatelessWidget {
  final Campaign campaign;

  const PriceDetailsPage({
    Key? key,
    required this.campaign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        addH(10.h),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Get chance to ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontFamily: ConstantStrings.kAppInterRegular,
              )),
          TextSpan(
              text: "Win",
              style: TextStyle(
                color: Colors.pink,
                fontSize: 15.sp,
                fontFamily: ConstantStrings.kAppInterBold,
              ))
        ])),
        Text(campaign.prizeName,
            style: TextStyle(
                height: 1.5,
                color: Colors.black,
                fontFamily: ConstantStrings.kAppInterSemiBold,
                fontSize: 20.sp)),
        addH(5.h),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Buy a ${campaign.productName} for : ",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: ConstantStrings.kAppInterRegular,
                  color: Colors.black)),
          TextSpan(
              text: "${campaign.currency} ${campaign.price.toStringAsFixed(0)}",
              style: TextStyle(
                fontSize: 16.sp,
                color: ConstantColors.darkYellow,
                fontFamily: ConstantStrings.kAppInterBold,
              ))
        ])),
        addH(15.h),
        Html(
          data: campaign.description,
        ),
      ],
    );
  }
}
