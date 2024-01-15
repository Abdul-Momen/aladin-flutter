import 'dart:convert';
import 'package:aladin/modules/home/model/campaign_runing_model.dart';
import 'package:aladin/modules/home/model/closing_soon_model.dart';
import 'package:aladin/modules/home/model/related_list_model.dart';
import 'package:aladin/modules/home/model/sold_out_model.dart';
import 'package:aladin/modules/home/service/home_service.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../winer/model/winners_list_model.dart';

class HomePageController extends GetxController {
  RxBool pRelatedLoading = true.obs;
  RxBool pClosingLoading = false.obs;
  RxBool pCampaignLoading=false.obs;
  RxBool pAllCampaignLoading=false.obs;
  RxBool pSoldOutLoading=false.obs;
  RxBool pRecentWinnerLoading=false.obs;
  ClosingSoonModel? closingSoon;
  CampaignRuningModel? runningCampaign;
  CampaignRuningModel? allRunningCampaign;
  SoldOutModel? soldOutModel;
  WinnersListModel? winnersListModel;

  //WinnerRecentModel? winnerRecentModel;
  RelatedListModel? relatedListModel;

  /// Related List
  void getRelatedList({required int ProductId}) async {
    pRelatedLoading = true.obs;
    try {
      var rRelatedList = await HomeService.getRelatedList(ProductId: ProductId);
      relatedListModel = relatedListModelFromJson(jsonEncode(rRelatedList));
      print("Test Get Related List Res");
      print("Test Get = $rRelatedList");
    } finally {
      pRelatedLoading.value = false;
    }
  }

  ///closing soon
 void getClosingSoon(int countryId)async{
    pClosingLoading.value =true;
    try{
      var closingResponse = await HomeService.getClosingSoon(countryId);
      closingSoon= closingSoonModelFromJson(jsonEncode(closingResponse));
      print("Test Get Closing res");
      print("Test Get = $closingResponse");
    }finally{
      pClosingLoading.value = false;
    }
  }
  
  ///Running Campaign
  void getRunningCampaign(int countryId)async{
      pCampaignLoading=true.obs;
    try{
      var runningResponse= await HomeService.getRunningCampaign(countryId);
      runningCampaign = campaignRuningModelFromJson(jsonEncode(runningResponse));
      print("Test Get Running Res");
      print("Test Get = $runningCampaign");
    }finally{
      pCampaignLoading.value=false;
    }
  }
  ///All Running Campaign
  void getALlRunningCampaign(int countryId)async{
    pAllCampaignLoading=true.obs;
    try{
      var runningResponse= await HomeService.getAllRunningCampaign(countryId);
      allRunningCampaign = campaignRuningModelFromJson(jsonEncode(runningResponse));
      print("Test Get Running Res");
      print("Test Get = $allRunningCampaign");
    }finally{
      pAllCampaignLoading.value=false;
    }
  }
    ///SoldOut Campaign
  void getSoldOut(int countryId)async{
      pSoldOutLoading=true.obs;
    try{
      var rSoldOutResponse= await HomeService.getSoldOut(countryId);
      soldOutModel = soldOutModelFromJson(jsonEncode(rSoldOutResponse));
      print("Test Get SoldOut Res");
      print("Test Get = $rSoldOutResponse");
    }finally{
      pSoldOutLoading.value=false;
    }
  }

  ///Recent Winner
  void getWinner(int countryId)async{
    pRecentWinnerLoading=true.obs;
    try{
      var rWinnerRecent= await HomeService.getWinner();
      print("Test Get Winner Res");
      print("Test Get = $rWinnerRecent");
      winnersListModel = winnersListModelFromJson(jsonEncode(rWinnerRecent));
 //     winnerRecentModel = winnerRecentModelFromJson(jsonEncode(rWinnerRecent));

    }finally{
      pRecentWinnerLoading.value=false;
    }
  }
  void launchURL(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
