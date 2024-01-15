import 'package:aladin/constants/string.dart';
import 'package:aladin/states/data/prefs.dart';
import 'package:aladin/states/services/base_client.dart';

class CartService {

  // get cart list by member
  static Future<dynamic> getMemberCart({required int memberId}) async {
    var rMemberCart = BaseClient.getData(
        parameter: {
          'memberId':memberId,
          'CookieId': memberId,

        },
        api: ConstantStrings.kMemberCart);
    return rMemberCart;
  }

  // get cart list by member
  static Future<dynamic> getMemberSummaryCart({required int memberId}) async {
    var rMemberCart = BaseClient.getData(
        parameter: {
          'memberId':memberId,
          'CookieId': memberId,

        },
        api: ConstantStrings.kMemberSummaryCart);
    return rMemberCart;
  }

 //Post Add Cart List
  static Future<dynamic> postAddCart({
    required int memberId,
    required String cookieId,
    required int productId,
    required int qty,
  }) async {
    Map<String, dynamic> pBody = {
      "memberId": memberId,
      "cookieId": '$memberId',
      "productId": productId,
      "qty": qty,
    };
    var rPostAddCart = BaseClient.postData(
      api: ConstantStrings.kCardAddList,
      body: pBody,
    );
    return rPostAddCart;
  }




  //Post Add Cart List
  static Future<dynamic> postDeleteCartItemQuantity({
    required int memberId,
    required String cookieId,
    required int productId,
    required int qty,
  }) async {
    Map<String, dynamic> pBody = {
      "memberId": memberId,
      "cookieId": '$memberId',
      "productId": productId,
      "qty": qty,
    };
    var rPostAddCart = BaseClient.postData(
      api: ConstantStrings.kCartDeleteItem,
      body: pBody,
    );
    return rPostAddCart;
  }


  ///Post Quantity Add List
  static Future<dynamic> postQuantityAddCart({required int id}) async {
    var rQuantityAddCart = BaseClient.postData(
      parameter: {
        'id':id,
      },
      api: ConstantStrings.kQuantityAddCart,
    );
    return rQuantityAddCart;
  }


  ///Remove Cart
  static Future<dynamic> removeCart({required int id}) async {
    var rCartRemove = BaseClient.postData(
      parameter: {
        'CartId':id,
      },
      api: ConstantStrings.kRemoveCart,
    );
    return rCartRemove;
  }

  // get cart list by member
  static Future<dynamic> getCartItemCount({required int memberId}) async {
    var cartCountResponse = BaseClient.getData(
        parameter: {
          'memberId':Preference.getMemberId(),
          "cookieId": '${Preference.getMemberId()}',

        },
        api: ConstantStrings.kCartItemCount);
    return cartCountResponse;
  }

}