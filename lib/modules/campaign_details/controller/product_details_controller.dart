import 'dart:convert';

import 'package:aladin/modules/campaign_details/model/campaign_details_model.dart';
import 'package:aladin/modules/campaign_details/service/campaign_details_service.dart';
import 'package:get/state_manager.dart';


class CampaignDetailsController extends GetxController {
  RxBool pCampaignDetailsLoading = false.obs;
  CampaignDetailsModel? campaignDetailsModel;

  /// Campaign Details
  void getCampaignDetails({required int productId}) async {
    pCampaignDetailsLoading = true.obs;
    try {

      var rCampaignDetails = await CampaignDetailsService.getCampaignDetails(
        productId: productId,
      );
      campaignDetailsModel =
          campaignDetailsModelFromJson(jsonEncode(rCampaignDetails));
      print("Test Get Campaign Details Res");
      print("product details ${(jsonEncode(rCampaignDetails))}");
    } finally {
      pCampaignDetailsLoading.value = false;
    }
  }
}
