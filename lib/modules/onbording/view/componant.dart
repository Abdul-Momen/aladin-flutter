import 'package:aladin/constants/string.dart';
import 'package:aladin/helper/helper.dart';
import 'package:aladin/modules/onbording/view/widget/custom_onbording_img.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class SlideTile extends StatelessWidget {
  String? imageBackPath, title, desc,imagePath;

  SlideTile({
    super.key,
    this.imageBackPath,
    this.imagePath,
    this.title,
    this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CustomOnbordingImg(
            imgBackUrl: imageBackPath!,
            imgUrl: imagePath!,
            imgHeight: 580.h,
            imgWidth: double.infinity,
            imgFit: BoxFit.fill,
          ),

          Text(
            "Get Chance to",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: ConstantStrings.kAppInterRegular,
            ),
          ),  Text(
            "Win Big Prizes",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              fontFamily: ConstantStrings.kAppInterSemiBold,
            ),
          ),
           SizedBox(
            height: 20.h,
          ),
          // Text(desc!,
          Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontFamily: ConstantStrings.kAppInterRegular,
              )),

          addH(20.h),
        ],
      ),
    );
  }
}

/*
class CustomClipPath extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    double w= size.width;
    double h = size.height;
    Path path = Path();
    path.lineTo(0, h-120);
    path.quadraticBezierTo(w*0.5, h, w, h-120);
    path.lineTo(w, 0);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}*/

class CustomButton extends StatelessWidget {
  final Widget widget;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;
  final Color? color;
  final double width;
  final double height;

  const CustomButton({
    Key? key,
    required this.widget,
    required this.onPressed,
    required this.buttonStyle,
    this.color,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: widget,
      ),
    );
  }
}

TextStyle styleText() {
  return TextStyle(
      letterSpacing: 2.0,
      fontFamily: 'Poppins',
      fontSize: 16.sm,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF000000));
}
