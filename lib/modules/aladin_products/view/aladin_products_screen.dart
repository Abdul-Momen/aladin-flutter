import 'package:aladin/constants/string.dart';
import 'package:aladin/helper/helper.dart';
import 'package:aladin/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AladinProductsScreen extends StatelessWidget {
  static String routeName = "/aladinproduct";

  const AladinProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 75.h,
        title: "Aladin Products",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: GridView.builder(
            itemCount: 15,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 15.w,
                mainAxisExtent: 160.h,
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      // <-- SEE HERE
                      title: SizedBox(
                        height: 200.h,
                        width: 214.w,
                        child: Image.asset("assets/images/pen_two.png",fit: BoxFit.fill),
                      ),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            const Divider(
                              color: Colors.black45,
                              thickness: 0.5,
                            ),
                            addH(15.h),
                            Center(
                                child: Text(
                              "Pen",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: ConstantStrings.kAppInterBold),
                            )),
                            addH(15.h),
                            Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: ConstantStrings.kAppInterRegular),
                            ),
                          ],
                        ),
                      ),
                    ),
                    /*  Container(
                    margin: EdgeInsets.all(5),
                    height: 160.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(3.5, 4.7),
                          blurRadius: 5,
                          spreadRadius: 3,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 120.h,
                          width: 100.w,
                          child: Image.asset("assets/images/pen_two.png"),
                        ),
                        Text(
                          "Pen",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),*/
                  );
                },
                child:
                    //AladinProductSkeleton(),
                    Container(
                  margin: EdgeInsets.only(top: 15.h),
                  height: 160.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 110.h,
                        width: 100.w,
                        child: Image.asset("assets/images/pen_two.png"),
                      ),
                      Text(
                        "Pen",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      addH(5.h),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
