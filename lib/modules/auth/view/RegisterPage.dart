import 'package:aladin/constants/string.dart';
import 'package:aladin/helper/helper.dart';
import 'package:aladin/modules/auth/controller/auth_controller.dart';
import 'package:aladin/modules/auth/view/Login.dart';
import 'package:aladin/modules/home/controller/homepage_controller.dart';
import 'package:aladin/modules/onbording/view/componant.dart';
import 'package:aladin/states/model/all_country_model.dart';
import 'package:aladin/states/utils/methods.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../constants/color.dart';
import '../../../states/controller/country_controller.dart';
import '../../../states/data/prefs.dart';

class RegistrationPage extends StatefulWidget {
  static String routeName = "/registration";

  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool hidePassword = true;
  bool rememberMe = false;
  String selectLang = 'Language';
  var lItems = ['language', 'English', 'Bangla'];

  String dropdownvaluelan = 'Language';

  /* var items = [
    'Country',
    'Bangladesh',
    'India',
    'China',
    'UAE',
    'Singapure',
    'USA'
  ];
*/

  var lanItems = ['Language', 'English', 'Bangla', 'Hindi'];

  final AuthController _authController = Get.find<AuthController>();
  final CountryController _countryController = Get.find<CountryController>();
  final HomePageController homePageController = Get.find<HomePageController>();


  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _cPassword = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  @override
  void initState() {
    _countryController.getAllCountry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width / 2.00,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/sc2.png',
                fit: BoxFit.fill,
                // height: double.infinity,
                // width: double.infinity,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                repeat: ImageRepeat.noRepeat,
              ),
            ),
            addH(10.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello!",
                      style: TextStyle(
                          color: ConstantColors.grayBlack,
                          fontSize: 16,
                          fontFamily: ConstantStrings.kAppInterSemiBold),
                    ),
                    addH(10),
                    Text(
                      "Signup to Get Started",
                      style: TextStyle(
                          color: ConstantColors.grayBlack,
                          fontSize: 20,
                          fontFamily: ConstantStrings.kAppInterSemiBold),
                    ),
                  ],
                ),
              ),
            ),
            addH(20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    onChanged: (value) {
                      print(value);
                    },
                    controller: _fullName,
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: ConstantColors.normalTextColor,
                          fontFamily: ConstantStrings.kAppInterRegular),
                      prefixIcon: Icon(Icons.account_circle_outlined,
                          color: ConstantColors.normalTextColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            6), //circular border for TextField.
                      ),
                    ),
                  ),
                ],
              ),
            ),
            addH(10.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    onChanged: (value) {
                      print(value);
                    },
                    controller: _email,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          color: ConstantColors.normalTextColor,
                          fontSize: 14,
                          fontFamily: ConstantStrings.kAppInterRegular),
                      prefixIcon: Icon(Icons.email_outlined,
                          color: ConstantColors.normalTextColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            6), //circular border for TextField.
                      ),
                    ),
                  ),
                ],
              ),
            ),
            addH(10.h),
            /*Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Container(
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 0.80),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(Icons.g_translate_outlined),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        elevation: 0,
                        value: selectLang,
                        icon: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10),
                          child: Icon(Icons.keyboard_arrow_down),
                        ),
                        items: lItems.map((String lItems) {
                          return DropdownMenuItem(
                              value: lItems,
                              child: Text(
                                lItems,
                                style: TextStyle(
                                    fontFamily: ConstantStrings
                                        .kAppInterRegular),
                              ));
                        }).toList(),
                        onChanged: (String? newLValue) {
                          setState(() {
                            selectLang = newLValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),*/
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 0.80),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(
                              Icons.pin_drop_outlined,
                              color: ConstantColors.normalTextColor,
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: Obx(() {
                                if (_countryController
                                    .pAllCountryLoading.value) {
                                  return const Column(
                                    children: [
                                      Center(
                                        child: Text(''),
                                      ),
                                    ],
                                  );
                                } else {
                                  return DropdownButton<Country>(
                                    elevation: 0,
                                    value:
                                        _countryController.dropdownvalue.value,
                                    icon: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Icon(Icons.keyboard_arrow_down),
                                    ),
                                    items: _countryController
                                        .allCountryModel.value.data!.countries
                                        .map(
                                          (map) => DropdownMenuItem<Country>(
                                            value: map,
                                            child: Text(
                                                map.countryName ?? 'India'),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (Country? newValue) {
                                      //setState(() {
                                      _countryController.dropdownvalue.value =
                                          newValue!;
                                      //   });
                                    },
                                  );
                                }
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  /*       addW(8.w),
                  Expanded(
                    child: Container(
                      height: 60.h,
                      child: TextField(
                        onChanged: (value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'City',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: ConstantColors.normalTextColor,
                              fontFamily: ConstantStrings.kAppInterRegular),
                          prefixIcon: Icon(Icons.pin_drop_outlined,
                              color: ConstantColors.normalTextColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                6), //circular border for TextField.
                          ),
                        ),
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
            addH(10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    onChanged: (value) {
                      print(value);
                    },
                    controller: _password,
                    obscureText: hidePassword, //show/hide password
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: ConstantColors.normalTextColor,
                          fontFamily: ConstantStrings.kAppInterRegular),
                      prefixIcon: Icon(Icons.lock_outline,
                          color: ConstantColors.normalTextColor),
                      suffixIcon: IconButton(
                        icon: hidePassword
                            ? Icon(Icons.visibility_off_outlined,
                                color: ConstantColors.normalTextColor)
                            : Icon(Icons.visibility_outlined,
                                color: ConstantColors.normalTextColor),
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            6), //circular border for TextField.
                      ),
                    ),
                  ),
                ],
              ),
            ),
            addH(10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    onChanged: (value) {
                      print(value);
                    },
                    controller: _cPassword,
                    obscureText: hidePassword, //show/hide password
                    decoration: InputDecoration(
                      hintText: 'Retype Password',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: ConstantColors.normalTextColor,
                          fontFamily: ConstantStrings.kAppInterRegular),
                      prefixIcon: Icon(Icons.lock_outline,
                          color: ConstantColors.normalTextColor),
                      suffixIcon: IconButton(
                        icon: hidePassword
                            ? Icon(Icons.visibility_off_outlined,
                                color: ConstantColors.normalTextColor)
                            : Icon(Icons.visibility_outlined,
                                color: ConstantColors.normalTextColor),
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            6), //circular border for TextField.
                      ),
                    ),
                  ),
                ],
              ),
            ),
            addH(10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    onChanged: (value) {
                      print(value);
                    },
                    controller: _phone,
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: ConstantColors.normalTextColor,
                          fontFamily: ConstantStrings.kAppInterRegular),
                      prefixIcon: Icon(Icons.call,
                          color: ConstantColors.normalTextColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            6), //circular border for TextField.
                      ),
                    ),
                  ),
                ],
              ),
            ),
            addH(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                        child: Checkbox(
                          checkColor: Colors.black,
                          activeColor: Colors.white,
                          side: MaterialStateBorderSide.resolveWith(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return const BorderSide(color: Colors.grey);
                              }
                              return const BorderSide(color: Colors.grey);
                            },
                          ),
                          materialTapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                          value: rememberMe,
                          onChanged: (newValue) {
                            setState(() {
                              rememberMe = newValue!;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "By Signing up you agree to our ",
                                  style: TextStyle(
                                      color: ConstantColors.normalTextColor,
                                      fontFamily: ConstantStrings.kAppInterRegular,
                                      fontSize: 14),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                       homePageController.launchURL('https://hazadeals.com/privacy-policy');

                                      },
                                      child: Text(
                                          "Privacy Policy",
                                          style: TextStyle(
                                              fontFamily: ConstantStrings.kAppInterBold,
                                              color: ConstantColors.normalTextColor)),
                                    ),
                                    Text(
                                        " and",
                                        style: TextStyle(
                                            fontFamily: ConstantStrings.kAppInterRegular,
                                            color: ConstantColors.normalTextColor)),
                                    InkWell(
                                      onTap: () {
                                        homePageController.launchURL('https://hazadeals.com/user-aggrement');

                                      },
                                      child: Text(
                                          " Terms and conditions",
                                          style: TextStyle(
                                              fontFamily: ConstantStrings.kAppInterBold,
                                              color: ConstantColors.normalTextColor)),
                                    )
                                  ],
                                ),

                              ],
                            ),


                          ],
                        ),
                      ),

            /*          CheckboxListTile(
                        title: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "By Signing up you agree to our ",
                              style: TextStyle(
                                  fontFamily: ConstantStrings.kAppInterRegular,
                                  color: ConstantColors.normalTextColor)),
                          TextSpan(
                              text: "User agreement",
                              style: TextStyle(
                                  fontFamily: ConstantStrings.kAppInterBold,
                                  color: ConstantColors.normalTextColor)),
                          TextSpan(
                              text: " and",
                              style: TextStyle(
                                  fontFamily: ConstantStrings.kAppInterRegular,
                                  color: ConstantColors.normalTextColor)),
                          TextSpan(
                              text: " Terms and conditions",
                              style: TextStyle(
                                  fontFamily: ConstantStrings.kAppInterBold,
                                  color: ConstantColors.normalTextColor))
                        ])),
                        value: rememberMe,
                        onChanged: (newValue) {
                          setState(() {
                            rememberMe = newValue!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity
                            .leading, //  <-- leading Checkbox
                      ),*/
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              width: double.infinity,
              height: 55.0.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  ConstantColors.lightYellow,
                  ConstantColors.darkYellow,
                ]),
                borderRadius: BorderRadius.circular(5),
              ),
              child: ElevatedButton(
                onPressed: () {
                  print(
                      '${_countryController.dropdownvalue.value!.countryId!}');
                  // Get.toNamed(LoginScreen.routeName);
                  if (_fullName.text.isEmpty ||
                      _phone.text.isEmpty ||
                      _email.text.isEmpty ||
                      _password.text.isEmpty ||
                      _cPassword.text.isEmpty) {
                    Methods.showSnackbar(
                      msg: ConstantStrings.kEmptyFields,
                    );
                    return;
                  }
                  if (!_email.text.isEmail) {
                    Methods.showSnackbar(msg: ConstantStrings.kValidEmail);
                    return;
                  }
                  if (_password.text.length < 6 || _cPassword.text.length < 6) {
                    Methods.showSnackbar(
                      msg: ConstantStrings.kPasswordLength,
                    );
                    return;
                  }
                  if (_password.text != _cPassword.text) {
                    Methods.showSnackbar(
                      msg: 'password don\'t match',
                    );
                    return;
                  }
                  if (rememberMe == false) {
                    Methods.showSnackbar(
                      msg: 'Please accept the terms and conditions',
                    );
                    return;
                  }
                  _authController.registration(
                    fullName: _fullName.text,
                    gender: "Male",
                    email: _email.text,
                    phoneNumber: _phone.text,
                    password: _password.text,
                    confirmPassword: _cPassword.text,
                    deviceId: '0',
                    firebaseToken: Preference.getFirebaseToken(),
                    countryId:
                        _countryController.dropdownvalue.value!.countryId!,
                    cityId: 28,
                    postCode: '0',
                    streetAddressOne: '',
                    streetAddressTwo: '',
                    invitationCode: '',
                    image: '',
                  );

                  Get.defaultDialog(
                    title: "Please wait...",
                    content: Obx(
                      () {
                        if (_authController.registrationLoading.value) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: ConstantColors.darkYellow,
                            ),
                          );
                        } else {
                          if (_authController.isRegistered.value) {
                            Future.delayed(
                              const Duration(seconds: 1),
                              () {
                                setState(() {
                                  Get.back();
                                  Get.offAllNamed(LoginPage.routeName);
                                });
                              },
                            );
                            return Text(_authController
                                .registrationResponseModel!.message
                                .toString());
                          } else {
                            return Text(_authController
                                .registrationResponseModel!.message
                                .toString());
                          }
                        }
                      },
                    ),
                  );

                  // Get.toNamed(LoginPage.routeName);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: ConstantColors.white,
                      fontFamily: ConstantStrings.kAppInterSemiBold,
                      fontSize: 18),
                ),
              ),
            ),
            addH(20.0),
            Text("Or Continue With",
                style: TextStyle(
                    color: ConstantColors.normalTextColor,
                    fontFamily: ConstantStrings.kAppInterRegular)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                      widget: SvgPicture.asset('assets/svg/google.svg'),
                      onPressed: () {},
                      buttonStyle: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.black,
                          elevation: 0,
                          side: BorderSide(
                            width: 1.0,
                            color: ConstantColors.grayShade,
                          )),
                      width: 60,
                      height: 60),
                  addW(20),
                  CustomButton(
                      widget: SvgPicture.asset('assets/svg/ios.svg'),
                      onPressed: () {},
                      buttonStyle: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.black,
                          elevation: 0,
                          side: BorderSide(
                            width: 1.0,
                            color: ConstantColors.grayShade,
                          )),
                      width: 60,
                      height: 60),
                  addW(20),
                  CustomButton(
                      widget: SvgPicture.asset('assets/svg/facebook.svg'),
                      onPressed: () {},
                      buttonStyle: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.black,
                          elevation: 0,
                          side: BorderSide(
                            width: 1.0,
                            color: ConstantColors.grayShade,
                          )),
                      width: 60,
                      height: 60)
                ],
              ),
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Have an Account? ",
                  style: TextStyle(
                      fontFamily: ConstantStrings.kAppInterRegular,
                      color: ConstantColors.normalTextColor)),
              TextSpan(
                  text: "Login",
                  style: TextStyle(
                      fontFamily: ConstantStrings.kAppInterBold,
                      decoration: TextDecoration.underline,
                      color: ConstantColors.darkYellow,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.to(() => const LoginPage()))
            ])),
            addH(20.h),
          ],
        ),
      ),
    );
  }
}
