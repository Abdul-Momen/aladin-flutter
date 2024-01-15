import 'package:aladin/constants/color.dart';
import 'package:aladin/constants/string.dart';
import 'package:aladin/helper/helper.dart';
import 'package:aladin/modules/wishlist/controller/wishlist_controller.dart';
import 'package:aladin/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class ProductCardWithDate extends StatefulWidget {
  final String soldText;
  final double progressPersen;
  final double productPrice;
  final double? progresswidth;
  final double? borderH;
  final double? borderW;
  final String productImg;
  final String currency;
  final String winText;
  final String campaignSubTitle;
  final String? campaignTitle;
  final String image;
  final double? width;
  final Widget? date;
  final double height;
  final Widget widgetFavorite;
  final VoidCallback onClick;
  final String fFirst;


  const ProductCardWithDate({
    Key? key,
    required this.soldText,
    required this.progressPersen,
    required this.productPrice,
    required this.productImg,
    required this.winText,
    required this.campaignSubTitle,
    required this.image,
    required this.currency,
    this.date,
    this.width,
    this.progresswidth,
    this.borderH,
    this.borderW,
    required this.height,
    required this.widgetFavorite,
    required this.onClick,
    required this.fFirst,
     this.campaignTitle,
  }) : super(key: key);

  @override
  State<ProductCardWithDate> createState() => _ProductCardWithDateState();
}

class _ProductCardWithDateState extends State<ProductCardWithDate> {
  final WishlistController wishlistController = Get.put(WishlistController());
  bool isEndingSoon = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.progressPersen>50){
      isEndingSoon = true;
    }
  }

  bool activeWish = false;


  @override
  Widget build(BuildContext context) {
    print('widget.productImg ${widget.productImg}');
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(1.2, 3.3),
            blurRadius: 2,
            spreadRadius: 0.1,
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(15.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.soldText,
                  style: TextStyle(
                      color: ConstantColors.grayBlack,
                      fontSize: 13.sp,
                      fontFamily: ConstantStrings.kAppInterRegular),
                ),
                LinearPercentIndicator(
                  width: widget.progresswidth,
                  barRadius: const Radius.circular(10),
                  animation: true,
                  lineHeight: 10.0.sp,
                  animationDuration: 2000,
                  percent: widget.progressPersen,
                /*  center: Text(widget.progressPersen.toString(),
                      style: const TextStyle(fontSize: 9, color: Colors.white)),*/
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [ConstantColors.lightYellow, ConstantColors.darkYellow]),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 5.h),
              height: 220.h,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.network(
                    widget.image,
                    fit: BoxFit.fill,
                    height: 215.h,
                    width: double.infinity,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10.h,right: 5.h
                      ),
                      child: widget.widgetFavorite,
                    ),
                  ),
                ],
              ),
            ),
            addH(9.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: isEndingSoon,
                      child: Container(
                          decoration: BoxDecoration(
                              color: ConstantColors.darkYellow,
                              borderRadius: BorderRadius.circular(3)),
                          height: 24.h,
                          width: 120.w,
                          child: Center(
                              child: Text(
                           // widget.fFirst!,
                                'FINISHING FAST!',
                            style: TextStyle(
                                fontFamily: ConstantStrings.kAppInterSemiBold,
                                fontSize: 13.sp,
                                color: Colors.white),
                          ))),
                    ),
                    addH(7.h),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "WIN: ",
                            style: TextStyle(
                              color: Colors.pink,
                              fontFamily: ConstantStrings.kAppInterBold,
                              fontSize: 16.sp,
                            )),
                        TextSpan(
                            text: widget.winText,
                            style: TextStyle(
                              color: ConstantColors.grayBlack,
                              fontFamily: ConstantStrings.kAppInterSemiBold,
                              fontSize: 16.sp,
                            )),
                      ]),
                    ),
                    addH(5),
                    SizedBox(
                      width: 190.h,
                      child: /*Text(
                          'Buy ${widget.fFirst} for AED ${widget.productPrice.toStringAsFixed(0)}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: TextStyle(
                            color: Colors.blue,
                            fontFamily: ConstantStrings.kAppInterBold,
                            fontSize: 16.sp,
                          )),*/



                      Text.rich(
                        TextSpan(
                          text: 'Buy ${widget.fFirst} for ',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: ConstantStrings.kAppInterRegular,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: '${widget.currency} ${widget.productPrice.toStringAsFixed(0)}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: ConstantStrings.kAppInterBold,
                                    color: ConstantColors.darkYellow)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: widget.borderH,
                  width: widget.borderW,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: ConstantColors.grayShade,
                        style: BorderStyle.solid),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.network(widget.productImg, fit: BoxFit.fitWidth),
                  ),
                )
              ],
            ),
            addH(16.h),
            CustomElevatedButton(
              width: double.infinity,
              height: 46.w,
              onPressed: widget.onClick,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [ConstantColors.lightYellow, ConstantColors.darkYellow]),
              borderRadius: BorderRadius.circular(5),
              child: Text(
                'Add to Cart',
                style: TextStyle(
                    color: Colors.black,

                    //fontFamily: ConstantStrings.kAppInterSemiBold,
                    fontSize: 16.sp),
              ),
            ),
            addH(16.h),
            SizedBox(
              height: 56.h,
              child: widget.date,
            )
          ],
        ),
      ),
    );
  }
}

///Drow Date

class DrowDate extends StatelessWidget {
  final String date;
  final String campaignStatus;
  final String currentStatus;

  const DrowDate(
      {Key? key,
      required this.date,
      required this.campaignStatus,
      required this.currentStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            Icons.event_available,
            color: Colors.green,
            size: 30.sp,
          ),
          addW(10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250.w,
                child: Text(
                  date,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontFamily: ConstantStrings.kAppInterMedium,
                    color: ConstantColors.grayBlack,
                    fontSize: 13.sp,
                  ),
                ),
              ),
              addH(2.h),
              Row(
                children: [
                  Text(
                    campaignStatus,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: ConstantColors.grayBlack,
                        fontFamily: ConstantStrings.kAppInterRegular,
                        fontSize: 12.sp),
                  ),
                  Text(
                    currentStatus,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: ConstantColors.grayBlack,
                      fontSize: 12.sp,
                      fontFamily: ConstantStrings.kAppInterSemiBold,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
