import 'package:aladin/helper/helper.dart';
import 'package:aladin/modules/checkout/view/checkout_page.dart';
import 'package:aladin/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constants/color.dart';
import '../../../home/view/screens/home_screen.dart';

class MyCartBottomSheet extends StatelessWidget {
  const MyCartBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 335,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.start,
          children: [
            addH(20),
            Text("Summary",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),),
            addH(10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sub Total"),
                Text("AED 2,360",style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            addH(5),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Vat"),
                Text("AED 30",style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const Divider(
              thickness: 0.5,
              color: Colors.black26,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Order Total",),
                Text("AED 2,630",style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const Divider(
              thickness: 0.5,
              color: Colors.black26,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 260.w,
                  child: const Text(
                      "Danate your products to our partner sharity and get 1 extra Draw ticket"),
                ),
                const Icon(Icons.check_box_outlined),
              ],
            ),
            const Divider(
              thickness: 0.5,
              color: Colors.black26,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Products"),
                Text("2",style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            addH(5),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Tickets"),
                Text("2",style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                      width: MediaQuery.sizeOf(context).width / 1.9,
                      height: 50.sp,
                      onPressed: () {
                        Get.offAndToNamed(HomeScreen.routeName);

                      },
                      border: Border.all(
                          color: Colors.black, style: BorderStyle.solid, width: 0.3),
                      borderRadius: BorderRadius.circular(5),
                      child: Text(
                        'Continue Shopping',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    CustomElevatedButton(
                      width: MediaQuery.sizeOf(context).width / 2.6,
                      height: 50.sp,
                      onPressed: () {
                        Get.to(() => const CheckOutPage());
                      },
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [ConstantColors.lightYellow,ConstantColors.darkYellow]),
                      borderRadius: BorderRadius.circular(5),
                      child: Text('Checkout',style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
