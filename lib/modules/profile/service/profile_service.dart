import 'package:aladin/constants/string.dart';
import 'package:aladin/states/services/base_client.dart';

class ProfileService {

  /// get Profile Info
  static Future<dynamic> getProfileInfo({required int memberId}) async {
    var rProfileInfo = BaseClient.getData(
        parameter: {
          'memberId':memberId,
        },
        api: ConstantStrings.kProfileInfo);
    return rProfileInfo;
  }

  /// get Profile Update
  static Future<dynamic> postProfileUpdate({
    required int memberId,
    required String fullName,
    required String gender,
    required String phoneNumber,
    required int countryId,
    required int cityId,
    required String postCode,
    required String streetAddressOne,
    required String streetAddressTwo,
  }) async {
    Map<String, dynamic> pBody = {
      "memberId": memberId,
      "fullName": fullName,
      "gender": gender,
      "phoneNumber": phoneNumber,
      "countryId": countryId,
      "cityId": cityId,
      "postCode": postCode,
      "streetAddressOne": streetAddressOne,
      "streetAddressTwo": streetAddressTwo
    };
    var rProfileUpdate = BaseClient.postData(
      api: ConstantStrings.kProfileUpdate,
      body: pBody,
    );
    return rProfileUpdate;
  }

  ///PassWord Update
  static Future<dynamic> postPasswordUpdate({
    required int memberId,
    required String oldPassword,
    required String password,
    required String confirmPassword,
  }) async {
    Map<String, dynamic> pBody = {
      "memberId": memberId,
      "oldPassword": oldPassword,
      "password": password,
      "confirmPassword": confirmPassword,
    };
    var rPasswordUpdate = BaseClient.postData(
      api: ConstantStrings.kPasswordUpdate,
      body: pBody,
    );
    return rPasswordUpdate;
  }
}