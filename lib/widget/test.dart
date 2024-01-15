import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WinGridViewItem extends StatelessWidget {

  const WinGridViewItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 291.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.red,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(3.5, 4.7),
            blurRadius: 5,
            spreadRadius: 3,
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
