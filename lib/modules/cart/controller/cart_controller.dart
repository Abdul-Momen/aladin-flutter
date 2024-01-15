import 'dart:convert';

import 'package:aladin/modules/cart/model/CartSummaryModel.dart';
import 'package:aladin/modules/cart/model/add_list_cart_model.dart';
import 'package:aladin/modules/cart/model/cart_quantity_add.dart';
import 'package:aladin/modules/cart/model/list_by_member_cart_model.dart';
import 'package:aladin/modules/cart/model/remove_cart_model.dart';
import 'package:aladin/modules/cart/service/cart_service.dart';
import 'package:aladin/states/data/prefs.dart';
import 'package:get/state_manager.dart';

import '../model/cart_item_count_model.dart';

class CartController extends GetxController {
  RxBool pMemberCartLoading = false.obs;
  RxBool pMemberSummaryCartLoading = false.obs;
  ListByMemberCartModel? memberCartModel;
  CartSummaryModel? memberSummaryCartModel;
  RxBool pAddCartLoading = false.obs;
  RxBool pDeleteCartLoading = false.obs;
  AddToListCartModel? addToListCartModel;
  AddToListCartModel? deleteCartModel;
  RxBool pQuantityAddLoading = false.obs;
  CartQuantityAdd? cartQuantityAdd;
  RxBool pRemoveCartLoading = false.obs;
  RxBool pCartCountLoading = false.obs;
  CartCountModel? cartCountModel;
  RemoveCartModel? removeCartModel;
  Rx<int> cartItemCount = 0.obs;
  RxBool rememberMe = false.obs;
  Rx<int> productCount = 0.obs;

  /// MemberCart
  void getMemberCart({required int memberId}) async {
    pMemberCartLoading = true.obs;
    try {
      var rListByMemberCart =
          await CartService.getMemberCart(memberId: memberId);
      memberCartModel =
          listByMemberCartModelFromJson(jsonEncode(rListByMemberCart));
      print("Test Get Member Cart");
      print("Test Get Member Cart res$rListByMemberCart");
    } finally {
      pMemberCartLoading.value = false;
    }
  }

  // MemberSummaryCart
  void getMemberSummaryCart({required int memberId}) async {
    pMemberSummaryCartLoading = true.obs;
    try {
      var rListByMemberCart =
          await CartService.getMemberSummaryCart(memberId: memberId);
      memberSummaryCartModel =
          cartSummaryModelFromJson(jsonEncode(rListByMemberCart));
      print("Test Get Summary Member Cart");
      print("Test Get Summary Member Cart res$rListByMemberCart");
      print("Test Get id = ${memberSummaryCartModel!.data.cartProducts.totalAmount}");


      Preference.setTotalPrice(memberSummaryCartModel!.data.cartProducts.totalAmount);





    } finally {
      pMemberSummaryCartLoading.value = false;
    }
  }

  /// Post Add Cart List

  void postAddCart({
    required int memberId,
    required String cookieId,
    required int productId,
    required int qty,
  }) async {
    pAddCartLoading.value = true;
    try {
      var rAddCart = await CartService.postAddCart(
        memberId: memberId,
        cookieId: '$memberId',
        productId: productId,
        qty: qty,
      );
      addToListCartModel = addToListCartModelFromJson(jsonEncode(rAddCart));
      getCartCount(memberId: Preference.getMemberId());
      /*    Future.delayed(const Duration(seconds: 2),
          //go home page
          () {
        getMemberCart(memberId: memberId);
        getMemberSummaryCart(memberId: memberId);
      });*/
      // TODO: implement initState
      print(addToListCartModel!.code.toString());
    } finally {
      pAddCartLoading.value = false;
    }
  }

  /// Post decrement Cart Item quantity

  void postDecrementCartItemQuantity({
    required int memberId,
    required String cookieId,
    required int productId,
    required int qty,
  }) async {
    pDeleteCartLoading.value = true;
    try {
      var rDeleteCart = await CartService.postDeleteCartItemQuantity(
        memberId: memberId,
        cookieId: cookieId,
        productId: productId,
        qty: qty,
      );
      deleteCartModel = addToListCartModelFromJson(jsonEncode(rDeleteCart));
      getCartCount(memberId: Preference.getMemberId());
      // TODO: implement initState
      print(deleteCartModel!.code.toString());
    } finally {
      pDeleteCartLoading.value = false;
    }
  }

  ///Post Quantity Add List
  void postQuantityAddCart({required int id}) async {
    pQuantityAddLoading = true.obs;
    try {
      var rQuantityAdd = await CartService.postQuantityAddCart(id: id);
      cartQuantityAdd = cartQuantityAddFromJson(jsonEncode(rQuantityAdd));
      print("Test Get Quantity Add List Res");
      print("Test Get = $rQuantityAdd");
    } finally {
      pQuantityAddLoading.value = false;
    }
  }

  ///Remove Cart
  void removeCart({required int id}) async {
    pRemoveCartLoading = true.obs;
    try {
      var rCartRemove = await CartService.removeCart(id: id);
      removeCartModel = removeCartModelFromJson(jsonEncode(rCartRemove));
      getCartCount(memberId: Preference.getMemberId());
      print("Test Get Remove Res");
      print("Test Get = $rCartRemove");
    } finally {
      pRemoveCartLoading.value = false;
    }
  }

  ///Get cart item count
  void getCartCount({required int memberId}) async {
    print('Memmmber Id ${memberId}');
    pCartCountLoading = true.obs;
    try {
      var cartItemCountResponse = await CartService.getCartItemCount(
        memberId: memberId,
      );
      cartCountModel =
          cartCountModelFromJson(jsonEncode(cartItemCountResponse));
      cartItemCount = cartCountModel!.data.cartProducts.totalProducts.obs;
      print("Cart count $cartItemCount");
    } finally {
      pCartCountLoading.value = false;
    }
  }
}
