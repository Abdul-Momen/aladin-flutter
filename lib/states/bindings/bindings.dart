import 'package:aladin/modules/address/controller/address_controller.dart';
import 'package:aladin/modules/all_sold_out/controller/sold_out_controller.dart';
import 'package:aladin/modules/auth/controller/auth_controller.dart';
import 'package:aladin/modules/campaign_details/controller/product_details_controller.dart';
import 'package:aladin/modules/cart/controller/cart_controller.dart';
import 'package:aladin/modules/checkout/controller/my_cart_controller.dart';
import 'package:aladin/modules/coupons/controller/coupons_controller.dart';
import 'package:aladin/modules/forgot_password/controller/forgot_password_controller.dart';
import 'package:aladin/modules/home/controller/homepage_controller.dart';
import 'package:aladin/modules/notification/controller/notification_controller.dart';
import 'package:aladin/modules/onbording/controller/bannar_controller.dart';
import 'package:aladin/modules/profile/controller/profile_controller.dart';
import 'package:aladin/modules/winer/controller/winner_controller.dart';
import 'package:aladin/modules/wishlist/controller/wishlist_controller.dart';
import 'package:aladin/states/controller/InitalController.dart';
import 'package:aladin/states/controller/country_controller.dart';
import 'package:get/get.dart';

import '../../modules/wallet/controller/wallet_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InitialController());
    Get.lazyPut(() => HomePageController());
  }
}

class BannerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BannerController());
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => WishlistController());
    Get.lazyPut(() => CountryController());

  }
}

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => CountryController());
    Get.lazyPut(() => HomePageController());
  }
}

class CampaignDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CampaignDetailsController());
  }
}

class MyCartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}

class WinnersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WinnerController());
    Get.lazyPut(() => HomePageController());
  }
}

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => WalletController());

  }
}

class AddAddressBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressController());
    Get.lazyPut(() => CountryController());

  }
}

class CheckOutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressController());
    Get.lazyPut(() => WalletController());

  }
}

class CouponBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => CouponsController());
  }
}

class NotificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
}

class SoldOutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SoldOutController());
  }
}

class WalletBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WalletController());
    Get.lazyPut(() => CheckOutController());

  }
}
class PasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPassController());

  }
}
