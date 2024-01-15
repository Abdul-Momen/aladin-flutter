
import 'package:aladin/constants/color.dart';
import 'package:aladin/constants/string.dart';
import 'package:aladin/helper/helper.dart';
import 'package:aladin/widget/border_gradian_color.dart';
import 'package:aladin/widget/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAddress extends StatelessWidget {
  //final Address address;
  final String nameLocation;
  final String addressId;
  final String apartmentName;
  final Widget edite;
  final Widget icon;
  final String addresslocation;
  final String number;
  const CustomAddress(
      {Key? key,
        required this.nameLocation,
        required this.icon,
        required this.addresslocation,
        required this.number,
        required this.edite, required this.addressId, required this.apartmentName,
        //required this.address
   })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
      child: InkWell(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    icon,
                    addW(5),
                    Text(
                      apartmentName,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: ConstantStrings.kAppInterMedium,
                        color: ConstantColors.normalTextColor,
                      ),
                    ),
                  ],
                ),
                edite,
              ],
            ),
            Row(
              children: [
                addW(30.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addH(3),
                    SizedBox(
                      width: 300.w,
                      child: Text(
                        nameLocation,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: ConstantStrings.kAppInterRegular,
                          color: ConstantColors.normalTextColor,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text("Phone Number: ",
                            style: TextStyle(
                                height: 2,
                                fontFamily: ConstantStrings.kAppInterBold,
                                color: ConstantColors.normalTextColor)),
                        Text(number,
                            style: TextStyle(
                                height: 2,
                                fontFamily: ConstantStrings.kAppInterRegular,
                                color: ConstantColors.normalTextColor)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}








class CustomAddressSkeleton extends StatelessWidget {

  const CustomAddressSkeleton(
      {Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BorderGradianColorButton(
      style: ButtonStyle(
        padding: MaterialStatePropertyAll(
          EdgeInsets.only(bottom: 20.h),
        ),

      ),

      onPressed: (){},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          children: [

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Skeleton(height: 15.h,width: 100.h,),
                Skeleton(height: 25.h,width: 100.h,),
              ],
            ),
            addW(30.w),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeleton(height: 10.h,width: double.infinity,),
                  addH(10),
                  Skeleton(height: 10.h,width: double.infinity,),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}