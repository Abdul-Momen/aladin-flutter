import 'package:aladin/constants/string.dart';
import 'package:aladin/states/services/base_client.dart';

class AuthService {
  static Future<dynamic> login({
    required String email,
    required String password,
    required String deviceId,
    required String firebaseToken,
    required String returnURL,
  }) async {
    Map<String, dynamic> pBody = {
      "email": email,
      "password": password,
      "deviceId": deviceId,
      "firebaseToken": firebaseToken,
      "returnURL":returnURL
    };
    var response = BaseClient.postData(
      api: ConstantStrings.kLogin,
      body: pBody,
    );
    return response;
  }

  static Future<dynamic> registration({
    required String fullName,
    required String gender,
    required String email,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
    required String deviceId,
    required String firebaseToken,
    required int countryId,
    required int cityId,
    required String postCode,
    required String streetAddressOne,
    required String streetAddressTwo,
    required String invitationCode,
    required String image,
  }) async {
    Map<String, dynamic> pBody = {
      "fullName": fullName,
      "gender":gender,
      "email": email,
      "phoneNumber":phoneNumber,
      "password": password,
      "confirmPassword":confirmPassword,
      "deviceId":deviceId,
      "firebaseToken": firebaseToken,
      "countryId": countryId,
      "cityId": cityId,
      "postCode": postCode,
      "streetAddressOne":streetAddressOne,
      "streetAddressTwo": streetAddressTwo,
      "invitationCode": invitationCode,
      "image":image
    };
    var response = BaseClient.postData(
      api: ConstantStrings.kRegistration,
      body: pBody,
    );
    return response;
  }
}
