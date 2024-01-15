import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOnbordingImg extends StatelessWidget {
  String imgBackUrl;
  String imgUrl;
  double? imgHeight;
  double? imgWidth;
  BoxFit? imgFit;

  CustomOnbordingImg({
    Key? key,
    required this.imgBackUrl,
    required this.imgUrl,
    this.imgHeight,
    this.imgWidth,
    this.imgFit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //  print('promo url');
    // print(imgUrl);
    return SizedBox(
      width: imgWidth ?? 348.w,
      height: imgHeight,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imgBackUrl),
                  fit: BoxFit.fill),
            ),
            width: MediaQuery.of(context).size.width,
            height: 518.h,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 80.h),
                child: SizedBox(
                    height: 200.h,
                    width: 378.w,
                    child: Image.asset(
                      imgUrl,
                      fit: BoxFit.fill,
                    )),
              ),
              /*Image.network(
                imgUrl,
                loadingBuilder: (context, child, progress) => progress == null
                    ? child
                    : Center(
                  child: CircularProgressIndicator(
                    value: progress.expectedTotalBytes != null
                        ? progress.cumulativeBytesLoaded /
                        progress.expectedTotalBytes!
                        : null,
                  ),
                ),
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.image,
                  size: 30.h,
                  color: Colors.grey,
                ),
                fit: imgFit ?? BoxFit.cover,
              ),*/
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 100.h),
              child: SizedBox(
                  width: 110.w,
                  height: 95.w,
                  child: Image.asset('assets/images/logo.png')),
            ),
          ),
        ],
      ),
    );
  }
}
