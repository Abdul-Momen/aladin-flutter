import 'package:aladin/modules/forgot_password/view/verify_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/color.dart';
import '../../../constants/string.dart';
import '../../../helper/helper.dart';
import '../../../states/utils/methods.dart';
import '../../../widget/custom_appbar.dart';
import '../../../widget/custom_navigation_bar.dart';
import '../../../widget/error_box.dart';
import '../controller/forgot_password_controller.dart';



class ForgotPasswordScreen extends StatefulWidget {
  static String routeName = "/forgotPassword";

  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  //final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController emailCon = TextEditingController();
  final ForgotPassController forgotPassController = ForgotPassController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 65.h,
        title: "Forgot Password",
        onBack: () {
          Get.back();
        },
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
              20),
          child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                addH(22.h),
                 Text(

                      "We will send you a link to reset your password.",
              style: TextStyle(
            fontSize: 16,
            fontFamily: ConstantStrings.kAppInterFont,),

                ),
                addH(22.h),

                TextField(
                  onChanged: (value) {
                    print(value);
                  },
                  controller: emailCon,
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
                addH(15.h),
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

                      // Get.toNamed(LoginScreen.routeName);
                      if (
                          emailCon.text.isEmpty ) {
                        Methods.showSnackbar(
                          msg: ConstantStrings.kEmptyFields,
                        );
                        return;
                      }
                      if (!emailCon.text.isEmail) {
                        Methods.showSnackbar(msg: ConstantStrings.kValidEmail);
                        return;
                      }

                      forgotPassController.getForgotPassword(emailCon.text);

                      Get.dialog(
                        // title: 'Processing...',
                        // content:
                        Obx(
                              () {
                            if (forgotPassController
                                .getForgotPassLoadingFlag.value) {
                              return  Center(
                                child: CircularProgressIndicator(
                                  color: ConstantColors.darkYellow,
                                ),
                              );
                            } else {
                              if (!forgotPassController
                                  .forgotPasswordResponseModel!.isSuccess) {
                                return ErrorBox(
                                    errorMessage:
                                    forgotPassController
                                        .forgotPasswordResponseModel!.message);
                                //  SnackBar(content: Text("Something went wrong"));
                              } else {
                                Get.back();
                              //  Navigator.pop(context);
                                Future.delayed(
                                  const Duration(seconds: 2),
                                      () => Get.to(VerifyEmailScreen(
                                  ),
                                          arguments: [emailCon.text]),
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
                      'Continue',
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
      ),

    );
  }
}
