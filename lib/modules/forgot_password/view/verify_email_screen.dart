import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../constants/color.dart';
import '../../../constants/string.dart';
import '../../../helper/helper.dart';
import '../../../states/utils/methods.dart';
import '../../../widget/custom_appbar.dart';
import '../../../widget/error_box.dart';
import '../controller/forgot_password_controller.dart';
import 'createNewPasswordScreen.dart';



class VerifyEmailScreen extends StatefulWidget {
  static String routeName = "/verifyEmail";

  //String email;

  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  //final _scaffoldKey = GlobalKey<ScaffoldState>();
late String email;
  final ForgotPassController forgotPassController = ForgotPassController();

  @override
  void initState() {
    super.initState();
    if (Get.arguments != null) {
      email = Get.arguments[0];
    }
  }

  String otpField = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 65.h,
        title: "Verify Email",
        onBack: () {
          Get.back();
        },
      ),

      body: SingleChildScrollView(
        child: Stack(
          children: [

            Padding(
              padding: const EdgeInsets.only(
                  top: 60.0, left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              /*    const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                        "Verify your email", style: TextStyle(fontSize: 20,)),
                  ),*/
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: ConstantColors.white,
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.white,
                        width: 1.0,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                            offset: Offset(0, -2)),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                           Text(

                                "Please check your inbox for the 4-digit verification code sent ",
                            style: TextStyle(
                                fontFamily: ConstantStrings.kAppInterSemiBold,
                                color: Colors.black,
                                fontSize: 16.sp),
                          ),
                          addH(18.h),
                          SizedBox(
                            width: 260.w,
                            height: 65.h,
                            child: PinCodeTextField(
                              appContext: context,
                              length: 4,
                              textStyle: TextStyle(
                                fontSize: 40.sp,
                                fontFamily: ConstantStrings.kAppInterFont,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.underline,
                                fieldOuterPadding:
                                    EdgeInsets.symmetric(horizontal: 5.w),
                                fieldHeight: 60.h,
                                fieldWidth: 55.w,
                                selectedColor: Colors.black,
                                inactiveColor: ConstantColors.grayBlack,
                                activeColor: ConstantColors.darkYellow,
                                borderWidth: 2.w,
                              ),
                              onChanged: (value) {
                                otpField = value;
                              },
                            ),
                          ),
                          addH(18.h),
                          InkWell(
                            onTap: () {
                              forgotPassController.getForgotPassword(email);
                            },
                            child:  Text(
                              "Resend code",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: ConstantStrings.kAppInterSemiBold,

                                decoration: TextDecoration.underline,
                                color: Colors.black,
                              ),

                            ),
                          ),
                          addH(18.h),


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
                                forgotPassController.getForgotPasswordVerifyOTP(
                                    email, otpField);
                                Get.dialog(
                                  // title: 'Processing...',
                                  // content:
                                  Obx(
                                        () {
                                      if (forgotPassController
                                          .getForgotPassVerifyOTPLoadingFlag
                                          .value) {
                                        return  Center(
                                          child: CircularProgressIndicator(
                                            color: ConstantColors.darkYellow,
                                          ),
                                        );
                                      } else {
                                        if (!forgotPassController.forgotPassVerifyRes!
                                            .isSuccess/* ||
                                            forgotPassController.forgotPassVerifyRes!
                                                .message !=
                                                "Otp Matched"*/) {


print('kkkkkkkkkkkkkkkkk');

                                          return ErrorBox(
                                              errorMessage: (forgotPassController
                                                  .forgotPassVerifyRes!
                                                  .message ));
                                        } else {
                                        Get.back();
                                          Future.delayed(
                                            const Duration(seconds: 2),
                                                () => Get.to(CreateNewPassScreen(

                                            ),
                                                    arguments: [email,otpField])
                                          );
                                          return const Center(
                                            child: null,
                                            //Text('Order placed successfully'),
                                          );
                                        }
                                      }
                                    },
                                  ),
                                );
                                // Get.toNamed(LoginScreen.routeName);



                                /*      _authController.registration(
                                  fullName: _fullName.text,
                                  gender: "Male",
                                  email: _email.text,
                                  phoneNumber: _phone.text,
                                  password: _password.text,
                                  confirmPassword: _cPassword.text,
                                  deviceId: '0',
                                  firebaseToken:  Preference.getFirebaseToken(),
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
                                        return const Center(
                                          child: CircularProgressIndicator(),
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
                                          return Text(
                                              _authController.registrationResponseModel!.message.toString());
                                        } else {
                                          return Text(
                                              _authController.registrationResponseModel!.message.toString());
                                        }
                                      }
                                    },
                                  ),
                                );*/

                                // Get.toNamed(LoginPage.routeName);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: Text(
                                'Verify',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: ConstantStrings.kAppInterSemiBold,
                                    fontSize: 18),
                              ),
                            ),
                          ),





                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
