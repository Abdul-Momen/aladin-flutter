import 'package:aladin/constants/color.dart';
import 'package:aladin/constants/string.dart';
import 'package:aladin/modules/campaign_details/model/campaign_details_model.dart';
import 'package:aladin/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CustomBottomSheet extends StatefulWidget {
  final Campaign campaign;
  final VoidCallback Fn;
  final Function(int) callback;

  const CustomBottomSheet({
    Key? key,
    required this.campaign,
    required this.Fn,
    required this.callback,
  }) : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  int countNom = 1;

  @override
  Widget build(BuildContext context) {
    var percent = widget.campaign.soldQty * 1.0 /  widget.campaign.ticketQty;
    return Container(
      height: 110.h,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: ConstantColors.grayShade,
            spreadRadius: 8,
            blurRadius: 5,
            offset: const Offset(0, 5)),
      ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LinearPercentIndicator(
                  width: 220.w,
                  barRadius: const Radius.circular(10),
                  animation: true,
                  lineHeight: 10.0,
                  animationDuration: 2000,
                  percent: percent,
                  center: const Text("",
                      style: TextStyle(fontSize: 9, color: Colors.white)),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        ConstantColors.lightYellow,
                        ConstantColors.darkYellow,
                      ]),
                ),
                Text(
                  " ${widget.campaign.soldQty} sold out of ${widget.campaign.productLimit}",
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: ConstantStrings.kAppInterRegular),
                ),
              ],
            ),
          ),
          Divider(
            color: ConstantColors.grayShade,
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          countNom -= 1;
                          widget.callback(countNom);

                        });
                      },
                      child: Container(
                        height: 32.h,
                        width: 32.w,
                        decoration: BoxDecoration(
                          color: ConstantColors.grayShade,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.remove,
                            color: Colors.black,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                    Text(countNom.toString(),
                        style: TextStyle(
                            fontSize: 19.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    InkWell(
                      onTap: () {
                        setState(() {
                          countNom += 1;
                          widget.callback(countNom);
                        });
                      },
                      child: Container(
                        height: 32.h,
                        width: 32.w,
                        decoration: BoxDecoration(
                          color: ConstantColors.grayShade,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text("AED ${widget.campaign.price.toStringAsFixed(0)}",
                  style: TextStyle(
                      fontSize: 15.sp,
                      color:ConstantColors.darkYellow,
                      fontFamily: ConstantStrings.kAppInterBold)),
              CustomElevatedButton(
                width: MediaQuery.sizeOf(context).width / 2.8,
                height: 46.h,
                onPressed: widget.Fn,
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ConstantColors.lightYellow,
                      ConstantColors.darkYellow,
                    ]),
                borderRadius: BorderRadius.circular(5.r),
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                      color: Colors.black,

                      fontSize: 16.sp,
                   //   fontFamily: ConstantStrings.kAppInterSemiBold
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
