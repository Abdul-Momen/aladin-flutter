import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavIcon extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String title;
  VoidCallback? onTapFn;

  NavIcon({
    Key? key,
    required this.isSelected,
    required this.icon,
    required this.title,
    this.onTapFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFn,
      child: SizedBox(
        height: 65.h,
        width: 70.w,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
              Icon(icon,
              color: isSelected ? Colors.orange : Colors.black45,),

            Text(
              title,
              style: TextStyle(
                fontSize: 11.sp,
                color: isSelected ? Colors.orange : Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
