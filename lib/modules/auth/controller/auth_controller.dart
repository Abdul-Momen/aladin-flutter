import 'dart:convert';

import 'package:aladin/modules/auth/model/login_model.dart';
import 'package:aladin/modules/auth/model/registration_response_model.dart';
import 'package:aladin/modules/auth/service/auth_service.dart';
import 'package:aladin/states/data/prefs.dart';
import 'package:get/state_manager.dart';

class AuthController extends GetxController {
  RxBool loginLoading = false.obs;
  RxBool registrationLoading = false.obs;
  RxBool isLoggingIn = true.obs;
  RxBool isRegistered = false.obs;
  RxBool isLoggedIn = false.obs;

  AuthModel? authModel;
  RegistrationResponseModel? registrationResponseModel;


  // login
  void login({
    required String email,
    required String password,
    required String deviceId,
    required String firebaseToken,
    required String returnURL,
  }) async {
    loginLoading.value = true;
    try {
      var response = await AuthService.login(
        email: email,
        password: password,
        deviceId: deviceId,
        firebaseToken: firebaseToken,
        returnURL: returnURL,
      );
     authModel= authModelFromJson(jsonEncode(response));
    //  print(authModel!.code.toString());
      if(authModel!.code==200){
        isLoggedIn.value=true;
        Preference.setMemberId(authModel!.data.user.memberId);
        print("MMMMember id ${Preference.getMemberId()}");
        Preference.setLoggedInFlag(true);
        Preference.setFullName(authModel!.data.user.fullName);
        Preference.setLoginEmail(authModel!.data.user.email);
        Preference.setCountryId(authModel!.data.user.country.countryId);
        print('memberId : ${authModel!.data.user.memberId}');

      }else{
        isLoggedIn.value=false;
      }

    } finally {
      loginLoading.value = false;
    }
  }

  // registration
  void registration({
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
    registrationLoading.value = true;
    try {
      var response = await AuthService.registration(
        fullName: fullName,
        gender: gender,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        confirmPassword: confirmPassword,
        deviceId: deviceId,
        firebaseToken: firebaseToken,
        countryId: countryId,
        cityId: cityId,
        postCode: postCode,
        streetAddressTwo: streetAddressTwo,
        streetAddressOne: streetAddressOne,
        invitationCode: invitationCode,
        image: image,
      );

      print(response.toString());
      registrationResponseModel= registrationResponseModelFromJson(jsonEncode(response));
      print(registrationResponseModel!.code.toString());
      if(registrationResponseModel!.code==200){
        isRegistered.value=true;
      }else{
        isRegistered.value=false;
      }

    } finally {
      registrationLoading.value = false;
    }
  }
}
