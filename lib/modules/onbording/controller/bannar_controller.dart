import 'dart:convert';
import 'package:aladin/modules/onbording/model/on_board_model.dart';
import 'package:aladin/modules/onbording/service/banner_service.dart';
import 'package:get/get.dart';


class BannerController extends GetxController {

  RxBool loading = false.obs;
  RxBool pLoading = false.obs;


  OnboardModel? onboardModel;
 // final onboard = Rxn<OnboardModel>();
  RxString postValue = ''.obs;

  void getOnboardImg() async {
    loading.value = true;
    try {
      var response = await BannerService.getOnboardImage();
      onboardModel= onboardModelFromJson(jsonEncode(response));
        print("Test Get ");
        print(onboardModel!.data.webHtmls.length.toString());
    } finally {
      loading.value = false;
    }
  }

  // task status
  void postTest({
    required int bankAc,
    required int addBalance,
    required int userId,
  }) async {
    pLoading.value = true;
    try {
      var response = await BannerService.testPost(
        bankAc: bankAc,
        addBalance: addBalance,
        userId: userId,
      );
      //print("TEst Post Bank");
      postValue.value = response.toString();
      //print(response.toString());
    } finally {
      pLoading.value = false;
    }
  }
}
