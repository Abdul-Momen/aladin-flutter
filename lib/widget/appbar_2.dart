import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../helper/helper.dart';

class Appbar2 extends StatelessWidget {
  const Appbar2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          /*   image: DecorationImage(
                image: AssetImage(
                  'assets/images/sp_bg.png',
                ),
                fit: BoxFit.fill),*/
          color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(8.0.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          //  addH(10.h),
            Row(
        //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              /*  SizedBox(
                  height: 30.h,
                  width: 30.w,
                  child: Image.asset(
                    'assets/images/cate_icon.png',
                    scale: 2,
                    fit: BoxFit.fill,
                  ),
                ),*/
                addW(Get.width/3),
                Image.asset(
                  'assets/images/app_icon.png',
                  scale: 2,
                  fit: BoxFit.fill,
                ),
               /* SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: SvgPicture.asset("assets/svg/profile.svg"),
                ),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}
