import 'package:aladin/constants/string.dart';
import 'package:aladin/states/services/base_client.dart';

class CountryService {
  /// get All Country
  static Future<dynamic> getAllCountry() async {
    var rAllCountryList =
        BaseClient.getData(api: ConstantStrings.kAllCountryList);
    return rAllCountryList;
  }

  /// get Country
  static Future<dynamic> getCountry({required int countryId}) async {
    var rCountry = BaseClient.getData(parameter: {
      'countryId': countryId,
    }, api: ConstantStrings.kCountry);
    return rCountry;
  }
}
