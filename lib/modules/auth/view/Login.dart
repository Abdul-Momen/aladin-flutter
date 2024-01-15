import 'package:aladin/constants/color.dart';
import 'package:aladin/constants/string.dart';
import 'package:aladin/helper/helper.dart';
import 'package:aladin/modules/auth/controller/auth_controller.dart';
import 'package:aladin/modules/auth/view/RegisterPage.dart';
import 'package:aladin/modules/forgot_password/view/forgotPasswordScreen.dart';
import 'package:aladin/modules/home/view/screens/home_screen.dart';
import 'package:aladin/states/data/prefs.dart';
import 'package:aladin/states/utils/methods.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../widget/custom_field.dart';
import '../../onbording/view/componant.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login";

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  bool rememberMe = false;

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passCon = TextEditingController();
  final AuthController _authController = Get.find<AuthController>();

  bool _loggingIn = false;

  @override
  void initState() {
    rememberMe = Preference.getRememberMeFlag();
    if (rememberMe) {
      _emailCon.text = Preference.getLoginEmail();
      _passCon.text = Preference.getLoginPass();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 270.h,
            width: MediaQuery.of(context).size.width,
            child:  Image.asset(
              'assets/images/sc3.png',
              fit: BoxFit.fill,
              // height: double.infinity,
              // width: double.infinity,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              repeat: ImageRepeat.noRepeat,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0, top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello Again!",
                          style: TextStyle(
                              fontSize: 16,
                              color: ConstantColors.grayBlack,
                              fontFamily: ConstantStrings.kAppInterSemiBold),
                        ),
                        addH(5),
                        Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 24,
                            color: ConstantColors.grayBlack,
                            fontFamily: ConstantStrings.kAppInterSemiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                addH(20.h),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*     TextField(
                        onChanged: (value) {
                          print(value);
                        },
                        controller: _emailCon,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                              fontFamily: ConstantStrings.kAppInterRegular,
                              fontSize: 14,
                              color: ConstantColors.normalTextColor),
                          prefixIcon: const SizedBox(
                            width: 10,
                              height: 10,
                              child: Icon(Icons.email_outlined)),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ConstantColors.grayShade),
                            borderRadius: BorderRadius.circular(
                                6), //circular border for TextField.
                          ),
                        ),
                      ),*/
                      CustomField(
                        brdrClr: ConstantColors.grayShade,
                        fillClr: ConstantColors.grayShade,
                        textCon: _emailCon,
                        hintText: 'Email ',
                        prefixIcon:'assets/svg/mail.svg',
                        validatorFn: (value) {
                          if (value!.length < 3) {
                            return 'Enter a valid name';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomField(
                        brdrClr: ConstantColors.grayShade,
                        isPassField: true,
                        fillClr: ConstantColors.grayShade,
                        textCon: _passCon,
                        hintText: '********',
                        prefixIcon: 'assets/svg/lock.svg',
                        validatorFn: (value) {
                          if (value!.length < 3) {
                            return 'Enter a valid password';
                          }
                          return null;
                        },
                      ),
                      /* TextField(
                        onChanged: (value) {
                          print(value);
                        },
                        controller: _passCon,
                        obscureText: hidePassword, //show/hide password
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              fontFamily: ConstantStrings.kAppInterRegular,
                              fontSize: 14,
                              color: ConstantColors.normalTextColor),
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: hidePassword
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ConstantColors.grayShade),
                            borderRadius: BorderRadius.circular(
                                6), //circular border for TextField.
                          ),
                        ),
                      ),*/
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /*       Row(
                      // mainAxisSize: MainAxisSize.min,
                        children: [

                            Checkbox(
                              checkColor: AppClrs.black,
                              activeColor: Colors.white,
                              side: MaterialStateBorderSide.resolveWith(
                                    (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return const BorderSide(color: AppClrs.grey);
                                  }
                                  return const BorderSide(color: AppClrs.grey);
                                },
                              ),
                              materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                              value: controller.isChecked.value,
                              onChanged: (newValue) {

                                controller.isChecked.value = newValue!;
                                //Do Something When Value Changes to True Or False
                              },
                            ),

                          const Padding(
                            padding: EdgeInsets.only(top:5,left: 5),
                            child: Text.rich(
                              TextSpan(
                                text: 'I accept and agree to  ',
                                style: TextStyle(fontSize: 14, color: AppClrs.grey),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Terms and Conditions \n',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,

                                      )),
                                  TextSpan(
                                      text: 'and ',
                                      style: TextStyle(
                                        color: AppClrs.grey,
                                      )),
                                  TextSpan(
                                      text: 'Privacy Policy',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ]),*/
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
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
                            child: Text(
                              "Remember",
                              style: TextStyle(
                                  color: ConstantColors.normalTextColor,
                                  fontFamily: ConstantStrings.kAppInterRegular,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),

                      /*
                      CheckboxListTile(
                        title: Text(
                          "Remember",
                          style: TextStyle(
                              color: ConstantColors.normalTextColor,
                              fontFamily: ConstantStrings.kAppInterRegular,
                              fontSize: 14),
                        ),
                        value: rememberMe,
                        onChanged: (newValue) {
                          setState(() {
                            rememberMe = newValue!;

                          });
                        },
                        controlAffinity: ListTileControlAffinity
                            .leading, //  <-- leading Checkbox
                      ),*/
                    ),
                    InkWell(
                      onTap: (){
                        Get.toNamed(ForgotPasswordScreen.routeName);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.0.h),
                        child: Text(
                          "Forgot password?",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: ConstantColors.normalTextColor,
                            fontFamily: ConstantStrings.kAppInterRegular,
                            fontSize: 14,
                          ), // has impact
                        ),
                      ),
                    )
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
                      if (_emailCon.text.isEmpty || _passCon.text.isEmpty) {
                        Methods.showSnackbar(msg: ConstantStrings.kEmptyFields);
                        return;
                      }
                      if (!_emailCon.text.isEmail) {
                        Methods.showSnackbar(
                          msg: ConstantStrings.kValidEmail,
                        );
                        return;
                      }
                      if (_passCon.text.length < 6) {
                        Methods.showSnackbar(
                          msg: ConstantStrings.kPasswordLength,
                        );
                        return;
                      }
                      Preference.setLoginEmail(_emailCon.text);
                      Preference.setLoginPass(_passCon.text);

                      if (rememberMe) {
                        Preference.setRememberMeFlag(true);
                        Preference.setLoginEmail(_emailCon.text);
                        Preference.setLoginPass(_passCon.text);
                      } else {
                        Preference.setLoginEmail(_emailCon.text);
                        Preference.setLoginPass(_passCon.text);
                        Preference.setRememberMeFlag(false);
                      }
                      setState(() => _loggingIn = true);
                      _authController.login(
                        email: _emailCon.text,
                        password: _passCon.text,
                        deviceId: '',
                        firebaseToken:  Preference.getFirebaseToken(),
                        returnURL: '',
                      );

                      Get.defaultDialog(
                        title: "Login..",
                        content: Obx(
                          () {
                            if (_authController.loginLoading.value) {
                              return  Column(
                                children: [
                                  Center(
                                    child: CircularProgressIndicator(
                                      color: ConstantColors.darkYellow,

                                    ),
                                  ),
                                ],
                              );
                            } else {
                              if (_authController.isLoggedIn.value) {
                                Future.delayed(
                                  const Duration(seconds: 1),
                                  () {
                                    setState(() {
                                      Get.back();
                                      Get.offAllNamed(HomeScreen.routeName);
                                    });
                                  },
                                );
                                return const Text('Login Success');
                              } else {
                                return const Text('Login Failed');
                              }
                            }
                          },
                        ),
                      );
                      // Get.toNamed(HomeScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.black,
                          fontFamily: ConstantStrings.kAppInterSemiBold,
                          fontSize: 18.sp),
                    ),
                  ),
                ),
                addH(20.0.h),
                Text(
                  "Or Continue with",
                  style: TextStyle(
                      color: ConstantColors.normalTextColor,
                      fontFamily: ConstantStrings.kAppInterRegular,
                  fontSize: 14),
                ),
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
                              side:  BorderSide(
                                width: 1.0,
                                color: ConstantColors.grayShade,
                              )),
                          width: 60,
                          height: 60),
                      addW(20.w),
                      CustomButton(
                          widget: SvgPicture.asset('assets/svg/ios.svg'),
                          onPressed: () {},
                          buttonStyle: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.black,
                              elevation: 0,
                              side:  BorderSide(
                                width: 1.0,
                                color: ConstantColors.grayShade,
                              )),
                          width: 60,
                          height: 60),
                      addW(20.w),
                      CustomButton(
                          widget: SvgPicture.asset('assets/svg/facebook.svg'),
                          onPressed: () {},
                          buttonStyle: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.black,
                              elevation: 0,
                              side:  BorderSide(
                                width: 1.0,
                                color: ConstantColors.grayShade,
                              )),
                          width: 60,
                          height: 60)
                    ],
                  ),
                ),
                addH(30.h),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Don't Have an Account? ",
                      style: TextStyle(
                          fontFamily: ConstantStrings.kAppInterRegular,
                          fontSize: 16,
                          color: ConstantColors.normalTextColor
                      )),
                  TextSpan(
                      text: "Register",
                      style: TextStyle(
                          fontFamily: ConstantStrings.kAppInterRegular,
                          decoration: TextDecoration.underline,
                          color: ConstantColors.darkYellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => const RegistrationPage()))
                ])),
                addH(30.h),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
