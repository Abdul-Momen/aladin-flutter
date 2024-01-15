import 'package:aladin/constants/string.dart';
import 'package:aladin/states/services/base_client.dart';

class WishlistService {

  ///Post Add Wish List
  static Future<dynamic> postAddWishList({
    required int memberId,
    required String sessionId,
    required int productId,
    required int qty,
  }) async {
    Map<String, dynamic> pBody = {
      "memberId": memberId,
      "sessionId": sessionId,
      "productId": productId,
      "qty": qty,
    };
    var rAddWishList = BaseClient.postData(
      api: ConstantStrings.kAddWishList,
      body: pBody,
    );
    return rAddWishList;
  }

  /// get WishList
  static Future<dynamic> getWishList({required int memberId}) async {
    var rWishList = BaseClient.getData(
        parameter: {
          'memberId':memberId,
        },
        api: ConstantStrings.kWishList);
    return rWishList;
  }

  /// get All WishList
  static Future<dynamic> getAllWishList({required int memberId}) async {
    var rAllWishList = BaseClient.getData(
        parameter: {
          'memberId':memberId,
        },
        api: ConstantStrings.kAllWishList);
    return rAllWishList;
  }

}