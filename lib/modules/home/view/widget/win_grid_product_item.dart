import 'package:aladin/constants/color.dart';
import 'package:aladin/constants/string.dart';
import 'package:aladin/helper/helper.dart';
import 'package:aladin/modules/home/model/campaign_runing_model.dart';
import 'package:aladin/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../states/data/prefs.dart';

class WinGridViewItems extends StatelessWidget {
  final VoidCallback onTapCart;
  final Campaign campaign;

  const WinGridViewItems({
    Key? key,
    required this.onTapCart,
    required this.campaign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('campaign.soldQty ${campaign.soldQty }');
    print('campaign.productLimit ${campaign. ticketQty}');

    var percent = campaign.soldQty * 1.0 / campaign.ticketQty;
    print('percent ${percent}');


    String prizeText = campaign.prizeName;
    String prizeImage = campaign
        .prizeImage;
    List<PrizeFor> prizeForUae =
        campaign
            .prizeForUae;
    List<PrizeFor> prizeForIndia =
        campaign
            .prizeForIndia;

    if (Preference.getCountryId() ==
        prizeForUae[0].countryId) {
      prizeImage =
          prizeForUae[0].prizeImage;
      prizeText =
          prizeForUae[0].prizeName;
    } else {
      prizeImage =
          prizeForIndia[0].prizeImage;
      prizeText =
          prizeForIndia[0].prizeName;
    }
    return Container(
      height: 291.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(2.5, 3.7),
            blurRadius: 2,
            spreadRadius: 2,
          )
        ],
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${campaign.soldQty} Sold out of ${campaign.productLimit}",
                  style: TextStyle(
                      color: ConstantColors.normalTextColor,
                      fontSize: 12.sp,
                      fontFamily: ConstantStrings.kAppInterRegular),
                ),
                addH(5.h),
                LinearPercentIndicator(
                  padding: EdgeInsets.zero,
                  width: 168.w,
                  barRadius: const Radius.circular(10),
                  animation: true,
                  lineHeight: 10.0.h,
                  animationDuration: 2000,
                  // percent: percent,
                  percent: percent>1?1:percent,
                  /* center: const Text("90.0%",
                      style: TextStyle(fontSize: 9, color: Colors.white)),*/
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ConstantColors.lightYellow,
                      ConstantColors.darkYellow,
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 8.h),
                  height: 110.h,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Image.network(
                        prizeImage,
                        fit: BoxFit.fitHeight,
                      ),
                      Positioned(
                        right: 5.w,
                        // top: 3.h,
                        child: Container(
                          margin: EdgeInsets.only(top: 5.h, right: 5.w),
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: SvgPicture.asset(
                            'assets/svg/fav.svg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: -20.h,
                    right: 0,
                    child: Container(
                      height: 40.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: ConstantColors.grayShade,
                            style: BorderStyle.solid),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.network(
                          campaign.productImage,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ))
              ],
            ),
            addH(16.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      Text("WIN: ",
                          style: TextStyle(
                            color: Colors.pink,
                            fontFamily: ConstantStrings.kAppInterBold,
                            fontSize: 16.sp,
                          )),
                      Expanded(
                        child: Text(prizeText,
                            softWrap: false,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: ConstantColors.grayBlack,
                              fontFamily: ConstantStrings.kAppInterSemiBold,
                              fontSize: 16.sp,
                            )),
                      ),
                    ],
                  ),
                ),
                addH(2.h),
                SizedBox(
                  child: Row(
                    children: [
                      Expanded(
                        child: /*Text(  'Buy ${campaign.productName} for AED ${campaign.price.toStringAsFixed(0)}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.blue,
                              fontFamily: ConstantStrings.kAppInterBold,
                              fontSize: 13.sp,
                            )),*/

                            Text.rich(
                          TextSpan(
                            text: 'Buy ${campaign.productName} for ',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: ConstantStrings.kAppInterRegular,
                              fontSize: 13.sp,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      '${campaign.currency} ${campaign.price.toStringAsFixed(0)}',
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: ConstantStrings.kAppInterBold,
                                      fontSize: 13.sp,
                                      color: ConstantColors.darkYellow)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            addH(10.h),
            CustomElevatedButton(
              width: double.infinity,
              height: 46.h,
              onPressed: onTapCart,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ConstantColors.lightYellow,
                  ConstantColors.darkYellow,
                ],
              ),
              borderRadius: BorderRadius.circular(5),
              child: Text('Add to Cart',
                  style: TextStyle(
                    color: Colors.black,
                 //   fontFamily: ConstantStrings.kAppInterBold,
                    fontSize: 16.sp,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
