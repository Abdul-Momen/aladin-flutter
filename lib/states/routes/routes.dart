import 'package:aladin/modules/address/view/screen/add_edit_address.dart';
import 'package:aladin/modules/address/view/screen/address_book.dart';
import 'package:aladin/modules/aladin_products/view/aladin_products_screen.dart';
import 'package:aladin/modules/all_campaign/view/all_campaign.dart';
import 'package:aladin/modules/all_sold_out/view/sold_out.dart';
import 'package:aladin/modules/auth/view/Login.dart';
import 'package:aladin/modules/auth/view/RegisterPage.dart';
import 'package:aladin/modules/campaign_details/view/screen/campaign_details.dart';
import 'package:aladin/modules/checkout/view/checkout_page.dart';
import 'package:aladin/modules/coupons/view/coupons.dart';
import 'package:aladin/modules/home/view/screens/home_screen.dart';
import 'package:aladin/modules/notification/view/notification_screen.dart';
import 'package:aladin/modules/onbording/view/onbording_screen.dart';
import 'package:aladin/modules/profile/view/profile_screen.dart';
import 'package:aladin/modules/splash/splash_screen.dart';
import 'package:aladin/modules/thank_you/thankyou_page.dart';
import 'package:aladin/modules/wallet/view/top_up_screen.dart';
import 'package:aladin/modules/wallet/view/wallet_screen.dart';
import 'package:aladin/modules/winer/view/winners_screen.dart';
import 'package:aladin/modules/wishlist/view/wishlist_screen.dart';
import 'package:get/route_manager.dart';
import '../../modules/forgot_password/view/createNewPasswordScreen.dart';
import '../../modules/forgot_password/view/forgotPasswordScreen.dart';
import '../../modules/forgot_password/view/verify_email_screen.dart';
import '../bindings/bindings.dart';

class AllRoutes {
  static List<GetPage> allRoutes = [
    GetPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: ThankYouPage.routeName,
      page: () => const ThankYouPage(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: WishListScreen.routeName,
      page: () => const WishListScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: SoldOutScreen.routeName,
      page: () => const SoldOutScreen(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: AladinProductsScreen.routeName,
      page: () => const AladinProductsScreen(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: AllCampaignScreen.routeName,
      page: () => const AllCampaignScreen(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: AddressBook.routeName,
      page: () => const AddressBook(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: AddEditAddressScreen.routeName,
      page: () => const AddEditAddressScreen(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: NotificationScreen.routeName,
      page: () => const NotificationScreen(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: CampaignDetailsScreen.routeName,
      page: () => const CampaignDetailsScreen(),
      binding: CampaignDetailsBinding(),
    ),
    GetPage(
      name: Onboard.routeName,
      page: () => const Onboard(),
      binding: BannerBinding(),
    ),
    GetPage(
      name: LoginPage.routeName,
      page: () => const LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: RegistrationPage.routeName,
      page: () => const RegistrationPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: WinnerScreen.routeName,
      page: () => const WinnerScreen(),
      binding: WinnersBinding(),
    ),
    GetPage(
      name: ProfileScreen.routeName,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: CheckOutPage.routeName,
      page: () => const CheckOutPage(),
      binding: CheckOutBinding(),
    ),
    GetPage(
      name: CouponsScreen.routeName,
      page: () => const CouponsScreen(),
      binding: CouponBinding(),
    ),
    GetPage(
      name: WalletScreen.routeName,
      page: () => const WalletScreen(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: TopUpScreen.routeName,
      page: () => const TopUpScreen(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: ForgotPasswordScreen.routeName,
      page: () => const ForgotPasswordScreen(),
      binding: PasswordBinding(),
    ),
    GetPage(
      name: CreateNewPassScreen.routeName,
      page: () =>  CreateNewPassScreen(),
      binding: PasswordBinding(),
    ),
    GetPage(
      name: VerifyEmailScreen.routeName,
      page: () => VerifyEmailScreen(),
      binding: PasswordBinding(),
    ),
  ];
}
