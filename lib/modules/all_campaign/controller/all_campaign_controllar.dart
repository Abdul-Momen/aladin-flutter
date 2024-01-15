import 'dart:convert';
import 'package:aladin/modules/all_campaign/model/all_campaign_model.dart';
import 'package:aladin/modules/all_campaign/service/all_campaign_service.dart';
import 'package:get/state_manager.dart';

class AllCampaignController extends GetxController {
  RxBool pAllCampaignLoading= false.obs;
  AllCanpaignModel? allCampaignModel;


  /// get All Campaign
  void getAllCampaign({required int memberId}) async {
    pAllCampaignLoading = true.obs;
    try {
      var rAllCampaign =
      await AllCampaignService.getAllCampaign();
      allCampaignModel =
          allCanpaignModelFromJson(jsonEncode(rAllCampaign));
      print("TEst Get All Campaign Res");
      print("TEst Get = $rAllCampaign");
    } finally {
      pAllCampaignLoading.value = false;
    }
  }
}