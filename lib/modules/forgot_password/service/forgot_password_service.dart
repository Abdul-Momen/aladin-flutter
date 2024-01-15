import '../../../constants/string.dart';
import '../../../states/services/base_client.dart';

class ForgotPasswordServices {
  static Future<dynamic> getForgotPassword({
    required String email,
  }) async {
    var response = await BaseClient.postData(
      api: ConstantStrings.kForgotPasswordApi,
      body: {
        "email":email,
        "otp": 0,
        "password": ''
      },
    );
    return response;
  }

  static Future<dynamic> getForgotPasswordVerifyOTP({
    required String email,
    required String otp,
  }) async {
    var response = await BaseClient.postData(
      api: ConstantStrings.kForgotPasswordApi,
      body: {
        "email":email,
        "otp": otp,
        "password": ''
      },
    );
    return response;
  }

  static Future<dynamic> getChangePassword({
    required String email,
    required String otp,
    required String password,

  }) async {
    var response = await BaseClient.postData(
      api: ConstantStrings.kForgotPasswordApi,
      body: {
        "email": email,
        "otp": otp,
        "password": password
      },
    );
    return response;
  }
}