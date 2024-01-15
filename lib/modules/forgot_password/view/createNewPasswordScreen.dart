import 'package:aladin/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/color.dart';
import '../../../helper/helper.dart';
import '../../../states/utils/methods.dart';
import '../../../widget/custom_appbar.dart';
import '../../../widget/error_box.dart';
import '../../auth/view/Login.dart';
import '../controller/forgot_password_controller.dart';

class CreateNewPassScreen extends StatefulWidget {
  static String routeName = "/newPassword";

  // String email;
  // String otp;

  // CreateNewPassScreen({required this.email, required this.otp, super.key});
  const CreateNewPassScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewPassScreen> createState() => _CreateNewPassScreenState();
}

class _CreateNewPassScreenState extends State<CreateNewPassScreen> {

  final TextEditingController newPassCon = TextEditingController();

  final TextEditingController confirmPassCon = TextEditingController();

  final ForgotPassController forgotPassController = ForgotPassController();
 late String email;
 late String otp;
  @override
  void initState() {
    super.initState();

    if (Get.arguments != null) {
      email = Get.arguments[0];
      otp = Get.arguments[1];

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 65.h,
        title: "Create New Password",
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

                  Container(
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
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(

                                "Your new password cannot be the same as your current password",
                            style: TextStyle(
                            fontSize: 15,
                            fontFamily: ConstantStrings.kAppInterSemiBold,),
                          ),
                          addH(18.h),

                         Text( "New password",style: TextStyle(
                           fontSize: 16,
                           fontFamily: ConstantStrings.kAppInterFont,),
                         ),
                          addH(5.h),
                          // Password Field

                          TextField(
                            onChanged: (value) {
                              print(value);
                            },
                            controller: newPassCon,
                            decoration: InputDecoration(
                              hintText: 'Enter new password',
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: ConstantColors.normalTextColor,
                                  fontFamily: ConstantStrings.kAppInterRegular),
                              prefixIcon: Icon(Icons.lock_outlined,
                                  color: ConstantColors.normalTextColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    6), //circular border for TextField.
                              ),
                            ),
                          ),






                          addH(18.h),
                          Text( "Confirm password",style: TextStyle(
                          fontSize: 16,
                          fontFamily: ConstantStrings.kAppInterFont,),
                    ),
                          addH(5.h),
                          // Password Field




                          TextField(
                            onChanged: (value) {
                              print(value);
                            },
                            controller: confirmPassCon,
                            decoration: InputDecoration(
                              hintText: 'Confirm password',
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: ConstantColors.normalTextColor,
                                  fontFamily: ConstantStrings.kAppInterRegular),
                              prefixIcon: Icon(Icons.lock_outlined,
                                  color: ConstantColors.normalTextColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    6), //circular border for TextField.
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

                                // Get.toNamed(LoginScreen.routeName);
                                if (newPassCon.text.isEmpty ||
                                    confirmPassCon.text.isEmpty ) {
                                  Methods.showSnackbar(
                                    msg: ConstantStrings.kEmptyFields,
                                  );
                                  return;
                                }

                                if (newPassCon.text.length < 6 || confirmPassCon.text.length < 6) {
                                  Methods.showSnackbar(
                                    msg: ConstantStrings.kPasswordLength,
                                  );
                                  return;
                                }
                                if (newPassCon.text != confirmPassCon.text) {
                                  Methods.showSnackbar(
                                    msg: 'Passwords don\'t match',
                                  );
                                  return;
                                }



                                if (newPassCon.text == confirmPassCon.text) {
                                  forgotPassController.getForgotPasswordChangePass(
                                      email,

                                      newPassCon.text,
                                     );
                                  Get.dialog(
                                    // title: 'Processing...',
                                    // content:
                                    Obx(
                                          () {
                                        if (forgotPassController
                                            .getForgotPassChangePassLoadingFlag
                                            .value) {
                                          return  Center(
                                            child: CircularProgressIndicator(
                                              color: ConstantColors.darkYellow,
                                            ),
                                          );
                                        } else {
                                          if (forgotPassController
                                              .forgotPassChangePassRes ==
                                              null) {
                                            return  Text("Something went wrong");
                                          } else {
                                           Get.back();
                                            Future.delayed(
                                              const Duration(seconds: 2),
                                                  () => Get.toNamed(
                                                  LoginPage.routeName),
                                            );
                                            return
                                              ErrorBox(
                                                  errorMessage:
                                                  forgotPassController
                                                      .forgotPassChangePassRes!
                                                      .message);


                                          }
                                        }
                                      },
                                    ),
                                  );
                                } else {
                                  Methods.showSnackbar(
                                    msg: "Password doesn't match",
                                  );
                                }

                           /*     _authController.registration(
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
                                'Update',
                                style: TextStyle(
                                    color: ConstantColors.white,
                                    fontFamily: ConstantStrings.kAppInterSemiBold,
                                    fontSize: 18),
                              ),
                            ),
                          ),


         /*                 SizedBox(
                            width: Get.width,
                            child: CustomButton(
                              btnRadius: BorderRadius.circular(8),
                              btnBgClr: ConstantColors.pantone,
                              btnFn: () {
                                if (newPassCon.text == confirmPassCon.text) {
                                  forgorCon.getForgotPasswordChangePass(
                                      widget.email,
                                      widget.otp,
                                      newPassCon.text,
                                      confirmPassCon.text);
                                  Get.dialog(
                                    // title: 'Processing...',
                                    // content:
                                    Obx(
                                      () {
                                        if (forgorCon
                                            .getForgotPassChangePassLoadingFlag
                                            .value) {
                                          return const Center(
                                            child: CircularProgressIndicator(
                                              backgroundColor: Color(0xFFC39E83),
                                            ),
                                          );
                                        } else {
                                          if (forgorCon
                                                  .forgotPassChangePassRes ==
                                              null) {
                                            return ErrorBox(
                                                errorMessage:
                                                    "Something went wrong");
                                          } else {
                                            Navigator.pop(context);
                                            Future.delayed(
                                              const Duration(seconds: 2),
                                              () => Get.toNamed(
                                                  LoginScreen.routeName),
                                            );
                                            return Center(
                                              child: ErrorBox(
                                                  errorMessage: forgorCon
                                                      .forgotPassChangePassRes!
                                                      .message),
                                            );
                                          }
                                        }
                                      },
                                    ),
                                  );
                                } else {
                                  Methods.showSnackbar(
                                    context: context,
                                    msg: "Password doesn't match",
                                  );
                                }
                              },
                              btnText: 'Save',
                            ),
                          ),*/
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
