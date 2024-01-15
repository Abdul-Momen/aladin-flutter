import 'dart:convert';

import 'package:aladin/modules/profile/model/passowrd_update_model.dart';
import 'package:aladin/modules/profile/model/profile_info_model.dart';
import 'package:aladin/modules/profile/model/profile_update_model.dart';
import 'package:aladin/modules/profile/service/profile_service.dart';
import 'package:get/state_manager.dart';

class ProfileController extends GetxController {
  RxBool pProfileInfo = false.obs;
  ProfileInfoModel? profileInfoModel;
  RxBool pUpdateProfile = false.obs;
  ProfileUpdateModel? profileUpdateModel;
  RxBool pUpdatePassword = false.obs;
  PasswordUpdateModel? passwordUpdateModel;

  /// ProfileInfo
  void getProfileInfo({required int memberId}) async {
    pProfileInfo = true.obs;
    try {
      var rProfileInfo =
          await ProfileService.getProfileInfo(memberId: memberId);
      profileInfoModel = profileInfoModelFromJson(jsonEncode(rProfileInfo));
      print("Test Get ProfileInfo Res");
      print("Test Get = $rProfileInfo");
    } finally {
      pProfileInfo.value = false;
    }
  }

  /// Profile Update
  void getProfileUpdate({
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
    pUpdateProfile.value = true;
    try {
      var rProfileUpdate = await ProfileService.postProfileUpdate(
          memberId: memberId,
          fullName: fullName,
          gender: gender,
          phoneNumber: phoneNumber,
          countryId: countryId,
          cityId: cityId,
          postCode: postCode,
          streetAddressOne: streetAddressOne,
          streetAddressTwo: streetAddressTwo);
      profileUpdateModel =
          profileUpdateModelFromJson(jsonEncode(rProfileUpdate));
      print(profileUpdateModel!.code.toString());
    } finally {
      pUpdateProfile.value = false;
    }
  }

  /// Password Update
  void getPasswordUpdate({
    required int memberId,
    required String oldPassword,
    required String password,
    required String confirmPassword,
  }) async {
    pUpdatePassword.value = true;
    try {
      var rPasswordUpdate = await ProfileService.postPasswordUpdate(
        memberId: memberId,
        oldPassword: oldPassword,
        password: password,
        confirmPassword: confirmPassword,
      );
      passwordUpdateModel =
          passowrdUpdateModelFromJson(jsonEncode(rPasswordUpdate));
      print(passwordUpdateModel!.code.toString());
    } finally {
      pUpdatePassword.value = false;
    }
  }
}
