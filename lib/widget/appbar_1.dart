import 'package:aladin/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Appbar1 extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const Appbar1({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Row(
      //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => scaffoldKey.currentState!.openDrawer(),
              child: const Row(
                children: [
                  Icon(Icons.menu,color: Colors.white,),
                ],
              ),
            ),
            addW(Get.width/3),
            Image.asset(
              'assets/images/app_icon.png',
              scale: 2,
              fit: BoxFit.fill,
            ),
    /*        InkWell(
              onTap: () {
                Get.toNamed(ProfileScreen.routeName);
              },
              child: SizedBox(
                height: 40.h,
                width: 40.w,
                child: Image.asset(
                  'assets/images/profile_icon.png',
                  scale: 2,
                  fit: BoxFit.fill,
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
