import 'package:aladin/constants/string.dart';
import 'package:aladin/states/services/base_client.dart';
import 'package:get/get.dart';

import '../../../states/controller/country_controller.dart';
import '../../../states/data/prefs.dart';

class HomeService {
  final CountryController _countryController = Get.find<CountryController>();

  // get closing list
  static Future<dynamic> getClosingSoon(int countryId) async {
    if (Preference.getLoggedInFlag()) {
      var cResponse = BaseClient.getData(
          api:
              '${ConstantStrings.kClosingList}?MemberId=${Preference.getMemberId()}');
      return cResponse;
    } else {
      var cResponse = BaseClient.getData(
          api: '${ConstantStrings.kClosingList}?countryId=$countryId');
      return cResponse;
    }
  }

  // get runningCampaign list
  static Future<dynamic> getRunningCampaign(int countryId) async {
    if (Preference.getLoggedInFlag()) {
      print("logged in");
      var rCampaignResponse = BaseClient.getData(
          // api: ConstantStrings.kRunningCampaignList
          api:
              '${ConstantStrings.kRunningCampaignList}?MemberId=${Preference.getMemberId()}');
      return rCampaignResponse;
    } else {
      print("not logged in");

      var rCampaignResponse = BaseClient.getData(
          // api: ConstantStrings.kRunningCampaignList
          api: '${ConstantStrings.kRunningCampaignList}?countryId=$countryId');
      return rCampaignResponse;
    }
  }

  // get runningCampaign list
  static Future<dynamic> getAllRunningCampaign(int countryId) async {
    if (Preference.getLoggedInFlag()) {
      var rAllCampaignResponse =
          BaseClient.getData(api: '${ConstantStrings.kAllCampaignList}?MemberId=${Preference.getMemberId()}');
      return rAllCampaignResponse;
    } else {
      var rAllCampaignResponse =
          BaseClient.getData(api: '${ConstantStrings.kAllCampaignList}?countryId=$countryId');
      return rAllCampaignResponse;
    }
  }

  // get Soldout list
  static Future<dynamic> getSoldOut(int countryId) async {
    if (Preference.getLoggedInFlag()) {
      var rSoldOutResponse =
      BaseClient.getData(api: '${ConstantStrings.kSoldOutList}?MemberId=${Preference.getMemberId()}');
      return rSoldOutResponse;
    }
    else{
      var rSoldOutResponse =
      BaseClient.getData(api: '${ConstantStrings.kSoldOutList}?countryId=$countryId');
      return rSoldOutResponse;
    }


  }

  // get Winner list
  static Future<dynamic> getWinner() async {
  /*  if (Preference.getLoggedInFlag()) {
      var rWinner = BaseClient.getData(api: '${ConstantStrings.kWinner}?MemberId=${Preference.getMemberId()}');
      return rWinner;
    }
    else{
      var rWinner = BaseClient.getData(api: '${ConstantStrings.kWinner}?countryId=$countryId');
      return rWinner;
    }*/

    var rWinner = BaseClient.getData(api: ConstantStrings.kWinnerAllList);
    return rWinner;

  }

  // get Related list
  static Future<dynamic> getRelatedList({required int ProductId}) async {
    if (Preference.getLoggedInFlag()) {
      var rRelatedList = BaseClient.getData(parameter: {
        'ProductId': ProductId,
      }, api:  '${ConstantStrings.kRelatedList}?MemberId=${Preference.getMemberId()}');
      return rRelatedList;
    }
    else{
      var rRelatedList = BaseClient.getData(parameter: {
        'ProductId': ProductId,
      }, api: '${ConstantStrings.kRelatedList}?countryId=${Preference.getCountryId()}');
      return rRelatedList;
    }


  }
}
