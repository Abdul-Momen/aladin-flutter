

import 'dart:convert';

import 'package:aladin/modules/forgot_password/model/update_password_response_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


import '../model/verify_otp_response_model.dart';
import '../service/forgot_password_service.dart';

class ForgotPassController extends GetxController {
 RxBool getForgotPassLoadingFlag = true.obs;
 ForgotPasswordResponseModel? forgotPasswordResponseModel;

 //ForgotPasswordResponseModel? ForgotPasswordResponseModel;

  void getForgotPassword(String email) async {
    getForgotPassLoadingFlag(true);
    try {
      var response = await ForgotPasswordServices.getForgotPassword(
        email: email,
        // otp: otp,
        // password: pass,
        // confirmPassword: confirmPass,
      );

      forgotPasswordResponseModel = forgotPasswordResponseModelFromJson(jsonEncode(response));
    } finally {
      getForgotPassLoadingFlag(false);
    }
  }

  RxBool getForgotPassVerifyOTPLoadingFlag = true.obs;

 VerifyOtpResponseModel? forgotPassVerifyRes;

  void getForgotPasswordVerifyOTP(String email, String otp) async {
    getForgotPassVerifyOTPLoadingFlag(true);
    try {
      var response = await ForgotPasswordServices.getForgotPasswordVerifyOTP(
        email: email,
        otp: otp,
      );

      forgotPassVerifyRes = verifyOtpResponseModelFromJson(jsonEncode(response));
      print("forgotPassVerifyRes ${forgotPassVerifyRes!.message}");
    } finally {
      getForgotPassVerifyOTPLoadingFlag(false);
    }
  }

  RxBool getForgotPassChangePassLoadingFlag = true.obs;

  ForgotPasswordResponseModel? forgotPassChangePassRes;

  void getForgotPasswordChangePass(
      String email,  String pass) async {
    getForgotPassChangePassLoadingFlag(true);
    try {
      var response = await ForgotPasswordServices.getChangePassword(
        email: email,
        otp: '',
        password: pass,
      );

      forgotPassChangePassRes = forgotPasswordResponseModelFromJson(jsonEncode(response));
    } finally {
      getForgotPassChangePassLoadingFlag(false);
    }
  }
}
