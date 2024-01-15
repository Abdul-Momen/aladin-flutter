import 'package:aladin/constants/string.dart';
import 'package:aladin/states/services/base_client.dart';

import '../../../states/data/prefs.dart';

class CampaignDetailsService {
  // get Campaign Details list
  static Future<dynamic> getCampaignDetails({required int productId}) async {
    if (Preference.getLoggedInFlag()) {
      var rCampaignDetails = BaseClient.getData(parameter: {
        'productId': productId,
      }, api: '${ConstantStrings.kCampaignDetails}?MemberId=${Preference.memberId}');
      return rCampaignDetails;
    } else {
      var rCampaignDetails = BaseClient.getData(parameter: {
        'productId': productId,
      }, api: '${ConstantStrings.kCampaignDetails}?countryId=${Preference.getCountryId()}');
      return rCampaignDetails;
    }
  }

  static Future<dynamic> testPost({
    required int id,
    required int name,
    required int num,
  }) async {
    Map<String, dynamic> pBody = {
      "addressBookId": id,
      "fullName": name,
      "mobileNumber": num,
    };
    var response = BaseClient.postData(
      api: 'post-data',
      body: pBody,
    );
    return response;
  }
}
