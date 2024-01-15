import 'package:aladin/constants/string.dart';
import 'package:aladin/states/data/prefs.dart';
import 'package:aladin/states/services/base_client.dart';

class WalletService {
  /// get Wallet balance
  static Future<dynamic> getWalletData() async {
    var rNotifications = BaseClient.getData(

        api:'${ ConstantStrings.kWalletData}?MemberId=${Preference.getMemberId()}');
    return rNotifications;
  }




  static Future<dynamic> addMoneyToWallet({
    required int amount,
  }) async {
    Map<String, dynamic> pBody =
      {
        "memberId": Preference.getMemberId(),
        "debitedprice": 0,
        "creditedPrice": amount,
        "invoiceId": 0,
        "paymentId": Preference.getPaymentId()

    };
    var response = BaseClient.postData(
      api: ConstantStrings.kUpdateWallet,
      body: pBody,
    );
    return response;
  }


}