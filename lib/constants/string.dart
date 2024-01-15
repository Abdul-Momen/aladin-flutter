class ConstantStrings {
  // APIs
  // static String kBaseUrl = 'https://aladin.r-y-x.net';
  //static String kBaseUrl = 'https://hazadeals.r-y-x.net/';
  static String kBaseUrl = 'https://hazadeals.com/';


  static String kAPIVersion = '/api/v1';
  static String kAppBanner = '/webHtmls/list-by-identifier';
  static String kClosingList = '/campaigns/closing-soon-list';
  static String kRunningCampaignList = '/campaigns/runing-list';
  static String kAllCampaignList = '/campaigns/all-runing-list';
  static String kCampaignDetails = '/campaigns/detail';
  static String kSoldOutList = '/campaigns/sold-out-list';
  static String kRegistration = '/auth/registration';
  static String kLogin = '/auth/login';
 // static String kWinner = '/winners/recent-list';
  static String kMemberCart = '/cart/product/list-by-member';
  static String kMemberSummaryCart = '/cart-summary/product/list-by-member';
  static String kCardAddList = '/cart/add-to-list';
  static String kCartDeleteItem = '/cart/delete-to-list';
  static String kCartItemCount = '/cart/total/product/by-member';
  static String kQuantityAddCart = '/cart/product/quantity-add';
  static String kRemoveCart = '/cart/product/remove';
  static String kNotificationList = '/get-notification-list';
  static String kProfileInfo = '/member/profile-information';
  static String kProfileUpdate = '/member/profile-update';
  static String kPasswordUpdate = '/member/password-update';
  static String kWishList = '/wishList/recent-list-by-member';
  static String kAllWishList = '/wishList/all-list-by-member';
  static String kAddWishList = '/WishList/add-remove';
  static String kWinnerAllList = '/winners/all-list';
  static String kAllCountryList = '/settings/country/all-list';
  static String kCountry = '/settings/city/by-country';
  static String kAllCampaign = '/campaigns/all-runing-list';
  static String kAllClosingSoon = '/campaigns/all-coming-soon-list';
  static String kAllSoldOut = '/campaigns/all-sold-out-list';
  static String kRelatedList = '/campaigns/related-list';
  static String kLanguage = '/language/all-list';
  static String kTicketActive = '/tickets/active-list-by-member';
  static String kMemberAddressAll = '/address/list-by-member-all';
  static String kMemberAddress = '/address/list-by-member';
  static String kAddressDetails = '/address/details';
  static String kAddAddress = '/address/add';
  static String kEditeAddress = '/address/edit';
  static String kRemoveAddress = '/address/remove';
  static String kDefaultAddress = '/address/set-default';
  static String kCheckoutStripeApi = '/cart/product/checkoutStrip';
  static String kUpdatePaymentStatusApi = '/cart/product/UpdateStatusPayment';
  static String kForgotPasswordApi = '/auth/ForgetPassword';


  //wallet
  static String kWalletData = '/wallet/memberswallet';
  static String kUpdateWallet = '/wallet/UpdateWallet';

  //fonts
  static String kAppInterFont = 'Inter';
  static String kAppInterRegular = 'Inter-Regular';
  static String kAppInterBold = 'Inter-Bold';
  static String kFontInterLight = 'Inter-light';
  static String kAppInterBlack = 'Inter-Black';
  static String kAppInterExtraBold = 'Inter-ExtraBold';
  static String kAppInterExtraLight = 'Inter-ExtraLight';
  static String kAppInterLight = 'Inter-Light';
  static String kAppInterMedium = 'Inter-Medium';
  static String kAppInterSemiBold = 'Inter-SemiBold';
  static String kAppInterThin = 'Inter-Thin';

  // error msgs
  static String kWentWrong = 'Something went wrong';
  static String kEmptyFields = 'Please fill all fields';
  static String kValidEmail = 'Please enter a valid email';
  static String kPasswordLength = 'Password must be at least 6 characters';
}

/// Value	Common weight name
/// 400	Normal (Regular)
/// 500	Medium
/// 600	Semi Bold (Demi Bold)
/// 700	Bold
