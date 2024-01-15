import 'dart:convert';

import 'package:aladin/modules/wishlist/model/add_wish_list_model.dart';
import 'package:aladin/modules/wishlist/model/all_list_wishlist_model.dart';
import 'package:aladin/modules/wishlist/model/recent_list_wishlist_model.dart';
import 'package:aladin/modules/wishlist/service/wishlist_service.dart';
import 'package:get/state_manager.dart';

class WishlistController extends GetxController {
  RxBool pWishListLoading = false.obs;
  RecentListWishlistModel? wishlistModel;
  RxBool pAllWishListLoading = false.obs;
  AllListWishlistModel? allWishlistModel;
  RxBool pAddWishListLoading = false.obs;
  AddWishListModel? addWishListModel;

  /// Post Add Wish List

  void postAddWishList({
    required int memberId,
    required String sessionId,
    required int productId,
    required int qty,
  }) async {
    pAddWishListLoading.value = true;
    print("member id $memberId");
    try {
      var rAddWishList = await WishlistService.postAddWishList(
        memberId: memberId,
        sessionId: sessionId,
        productId: productId,
        qty: qty,
      );
      addWishListModel = addWishListModelFromJson(jsonEncode(rAddWishList));
      getWishList(memberId: memberId);
      print(addWishListModel!.code.toString());
    } finally {
      pAddWishListLoading.value = false;
    }
  }

  /// Wish List
  void getWishList({required int memberId}) async {
    pWishListLoading = true.obs;
    try {
      var rWishList = await WishlistService.getWishList(memberId: memberId);
      wishlistModel = recentListWishlistModelFromJson(jsonEncode(rWishList));
      print("TEst Get = $rWishList");
    } finally {
      pWishListLoading.value = false;
    }
  }

  ///All Wish List
  void getAllWishList({required int memberId}) async {
    pAllWishListLoading = true.obs;
    try {
      var rAllWishList =
          await WishlistService.getAllWishList(memberId: memberId);
      allWishlistModel = allListWishlistModelFromJson(jsonEncode(rAllWishList));
      print("TEst Get All Wish List Res");
      print("TEst Get = $rAllWishList");
    } finally {
      pAllWishListLoading.value = false;
    }
  }
}
