
import 'package:aladin/modules/onbording/controller/bannar_controller.dart';
import 'package:aladin/modules/onbording/view/widget/onboard_bottom_skeleton.dart';
import 'package:aladin/modules/onbording/view/widget/onboard_skeleton.dart';
import 'package:aladin/states/data/prefs.dart';
import 'package:aladin/states/model/SliderModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/color.dart';
import '../../home/view/screens/home_screen.dart';
import 'componant.dart';

class Onboard extends StatefulWidget {
  static String routeName = "/onBoard";

  const Onboard({Key? key}) : super(key: key);

  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final BannerController _bannerController = Get.find<BannerController>();
  List<SliderModel> mySLides = <SliderModel>[];
  int slideIndex = 0;
  PageController? controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 8.0 : 6.0,
      width: isCurrentPage ? 18.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mySLides = getSlides();
    controller = PageController();
    Preference.setLoggedInFlag(false);
    // _bannerController.getOnboardImg();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() {
          if (_bannerController.loading.value) {
            return  Center(
              child: CircularProgressIndicator(
                color: ConstantColors.darkYellow,
              ),
            );
        //    return const OnBoardSkeleton();
          } else {
            if (_bannerController.onboardModel != null) {
              return SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: PageView(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      slideIndex = index;
                    });
                  },
                  children: <Widget>[
                    SlideTile(
                      //   imagePath: _bannerController.onboard!.data.webHtmls[0].pictureOne,
                      //  imagePath: 'https://e7.pngegg.com/pngimages/468/92/png-clipart-blue-bmw-car-2017-bmw-m2-bmw-2-series-car-bmw-5-series-blue-bmw-m2-coupe-car-compact-car-sedan-thumbnail.png',
                      imageBackPath: 'assets/images/onbording_back_one.png',
                      imagePath: 'assets/images/win_car.png',
                      title: _bannerController
                          .onboardModel!.data.webHtmls[0].smallDetailsOne,
                      desc: _bannerController
                          .onboardModel!.data.webHtmls[0].bigDetailsOne,
                    ),
                    SlideTile(
                      // imagePath: _bannerController.onboard!.data.webHtmls[0].pictureOne,
                      imageBackPath: 'assets/images/onbording_back_two.png',
                      imagePath: 'assets/images/win_car_two.png',
                      title: _bannerController
                          .onboardModel!.data.webHtmls[0].smallDetailsTwo,
                      desc: _bannerController
                          .onboardModel!.data.webHtmls[0].bigDetailsTwo,
                    ),
                  ],
                ),
              );
            } else {
              return const Text("OnBoard is Empty");
            }
          }
        }),
        bottomSheet: slideIndex != 1
            ? Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
                child: Obx(() {
                  if (_bannerController.loading.value) {
                    return const OnBoardBottomSkeleton();
                  } else {
                    if (_bannerController.onboardModel != null) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          /* CustomButton(
                      title: "SKIP",
                      onPressed: () {
                        controller!.animateToPage(2,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.linear);
                      },
                      buttonStyle: ButtonStyle(),
                      // width: 60,
                      // height: 50
                  ),*/
                          Row(
                            children: [
                              for (int i = 0; i < 2; i++)
                                i == slideIndex
                                    ? _buildPageIndicator(true)
                                    : _buildPageIndicator(false),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              print("this is slideIndex: $slideIndex");
                              controller!.animateToPage(slideIndex + 1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.linear);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.black,
                                elevation: 0,
                                side: BorderSide(
                                  width: 1.0,
                                  color: ConstantColors.darkYellow,
                                )),
                            child: const Text(
                              "Skip",
                              style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  }
                }),
              )
            : Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
                child: Obx(() {
                  if (_bannerController.loading.value) {
                    return const OnBoardBottomSkeleton();
                  } else {
                    if (_bannerController.onboardModel != null) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          /* CustomButton(
                      title: "SKIP",
                      onPressed: () {
                        controller!.animateToPage(2,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.linear);
                      },
                      buttonStyle: ButtonStyle(),
                      // width: 60,
                      // height: 50
                  ),*/
                          Row(
                            children: [
                              for (int i = 0; i < 2; i++)
                                i == slideIndex
                                    ? _buildPageIndicator(true)
                                    : _buildPageIndicator(false),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              print("this is slideIndex: $slideIndex");
                              controller!.animateToPage(slideIndex + 2,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.linear);
                              Get.offAndToNamed(HomeScreen.routeName);

                              //  Get.toNamed(LoginPage.routeName);
                              Preference.setIsFristOnbordingFlag(true);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.black,
                                elevation: 0,
                                side: const BorderSide(
                                  width: 1.0,
                                  color: Colors.red,
                                )),
                            child: const Text(
                              "Skip",
                              style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  }
                }),
              ));
  }
}

/*
ClipPath(
child: Container(
width: MediaQuery.of(context).size.width,
height: 380.h,
color: ColorResources.getBgColor(context),
child: Image.asset(Images.schoolLogo),
),
clipper: CustomClipPath(),
),*/
