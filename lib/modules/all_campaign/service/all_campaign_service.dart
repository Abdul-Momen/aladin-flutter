import 'package:aladin/constants/string.dart';
import 'package:aladin/states/services/base_client.dart';

class AllCampaignService {

  /// get All Campaign
  static Future<dynamic> getAllCampaign() async {
    var rAllCampaign = BaseClient.getData(
        api: ConstantStrings.kAllCampaign);
    return rAllCampaign;
  }

}