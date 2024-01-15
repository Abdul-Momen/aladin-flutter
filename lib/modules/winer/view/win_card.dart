import 'package:aladin/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WinCard extends StatelessWidget {
  final double? winH;
  final double? carH;

  const WinCard({
    Key? key,
    this.winH,
    this.carH,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, bottom: 5),
      height: 305.h,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
      child: Column(
        children: [
          Container(
            height: winH??140.h,
            width: 255.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/winner_background.png"),
                  fit: BoxFit.fill),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 60.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(60),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/winner_profile.png"),
                        fit: BoxFit.fill),
                  ),
                ),
                Text(
                  "Congratulation",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontFamily: ConstantStrings.kAppInterRegular,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  "Hassan Alshamsi",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: ConstantStrings.kAppInterBold,
                      color: Colors.white),
                ),
                Text(
                  "on Winning Car",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: ConstantStrings.kAppInterMedium,
                      color: Colors.white),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height:carH?? 90.h,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/win_car.png',
                  fit: BoxFit.fill,
                ),
              ),
              Divider(
                color: Colors.black45,
                thickness: 0.5,
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:10.w),
                child: SizedBox(
                  height: 68.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: Row(
                          children: [
                            Text("no. ",
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.black,
                                  fontFamily: ConstantStrings.kAppInterBold,)),
                            Expanded(
                              child: Text("LS-00065-65268-56",
                                  softWrap: false,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontFamily: ConstantStrings.kAppInterRegular,
                                    color: Colors.black45,
                                  )),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 150.w,
                        child: Row(
                          children: [
                            Text("Announced on: ",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color: Colors.black,
                                    fontFamily: ConstantStrings.kAppInterBold)),
                            Expanded(
                              child: Text("July 29, 2023 | 4:00PM",
                                  softWrap: false,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontFamily: ConstantStrings.kAppInterRegular,
                                    color: Colors.black45,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
