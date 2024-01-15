import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '../../modules/home/view/screens/home_page/home_page.dart';

class Preference {
  static final prefs = GetStorage();
  static const userDetails = 'userDetails';
  static const loggedInFlag = 'loginFlag';
  static const rememberMeFlag = 'rememberMeFlag';
  static const loginEmail = 'loginEmail';
  static const loginPass = 'loginPass';
  static const cartId = 'cartIc';
  static const customerToken = 'customerToken';
  static const cartNote = 'cartNote';
  static const cartCheckOutId = 'cartCheckOut';
  static const memberId = 'memberId';
  static const countryId = 'countryId';
  static const guestCheckOutId = 'guestCheckOut';
  static const guestUserEmail = 'guestEmail';
  static const guestUserFName = 'guestFName';
  static const fullName = 'FullName';
  static const guestUserLName = 'guestLName';
  static const guestUserAddress = 'guestUserAddress';
  static const guestUserCity = 'guestUserCity';
  static const guestUserPhone = 'guestUserPhone';
  static const isFirsTimeOnboard = 'isFirsTimeOnboard';
  static const isArabicLang = 'isArabic';
  static const exChangeRate = 'exchange';
  static const promoCodes = 'promoCode';
  static const promoImages = 'promoImage';
  static const firebaseToken = 'firebaseToken';
  static const totalPrice = 'totalPrice';


  //Stripe
  static const stripeKey = 'stripeKey';
  static const clientSecret = 'clientSecret';
  static const paymentId = 'paymentId';
  static const ephemeralKey = 'ephemeralKey';
  static const customerKey = 'customerKey';
  static const totalAmount = 'totalAmount';
  static const currency = 'currency';




/*

  // get
  static CustomerModel getUserDetails() {
    var result = prefs.read(userDetails);
    return CustomerModel.fromJson(json.decode(result));
  }

  // set
  static void setUserDetails(CustomerModel value) {
    print('Storing User Details: ${json.encode(value.toJson())}');
    prefs.write(userDetails, json.encode(value.toJson()));
  }
*/

  // get
  static bool getLoggedInFlag() {
    return prefs.read(loggedInFlag) ?? false;
  }

  // set
  static void setLoggedInFlag(bool value) {
    print('Storing Login flag: $value');
    prefs.write(loggedInFlag, value);
  }

// get
  static bool getIsArabicFlag() {
    return prefs.read(isArabicLang) ?? true;
  }

  // set
  static void setIsArabicFlag(bool value) {
    print('Storing Arabic flag: $value');
    prefs.write(isArabicLang, value);
  }
  // get
  static String getFirebaseToken() {
    print('Get firebaseToken: $firebaseToken');
    return prefs.read(firebaseToken) ?? '';
  }

  // set
  static void setFirebaseToken(String value) {
    print('Storing firebaseToken: $value');
    prefs.write(firebaseToken, value);
  }
  // get
  static bool getRememberMeFlag() {
    return prefs.read(rememberMeFlag) ?? false;
  }

  // set
  static void setRememberMeFlag(bool value) {
    print('Storing remember me flag: $value');
    prefs.write(rememberMeFlag, value);
  }

// get
  static bool getIsFristOnbordingFlag() {
    return prefs.read(isFirsTimeOnboard) ?? false;
  }

  // set
  static void setIsFristOnbordingFlag(bool value) {
    print('Storing boarding  flag: $value');
    prefs.write(isFirsTimeOnboard, value);
  }

  // get
  static String getLoginEmail() {
    return prefs.read(loginEmail) ?? '';
  }

  // set
  static void setLoginEmail(String value) {
    print('Storing Login Email: $value');
    prefs.write(loginEmail, value);
  }

  // get
  static String getGuestEmail() {
    return prefs.read(guestUserEmail) ?? '';
  }

  // set
  static void setGuestEmail(String value) {
    print('Storing Guest Email: $value');
    prefs.write(guestUserEmail, value);
  }

  // get
  static String getGuestFName() {
    return prefs.read(guestUserFName) ?? '';
  }

  // set
  static void setGuestFName(String value) {
    print('Storing Guest FName: $value');
    prefs.write(guestUserFName, value);
  }


  // get
  static String getFullName() {
    return prefs.read(fullName) ?? '';
  }

  // set
  static void setFullName(String value) {
    print('Storing Full Name: $value');
    prefs.write(fullName, value);
  }

  // get
  static String getGuestLName() {
    return prefs.read(guestUserLName) ?? '';
  }

  // set
  static void setGuestLName(String value) {
    print('Storing Guest LName: $value');
    prefs.write(guestUserLName, value);
  }

  // get
  static String getGuestAddress() {
    return prefs.read(guestUserAddress) ?? '';
  }

  // set
  static void setGuestAddress(String value) {
    print('Storing Guest address: $value');
    prefs.write(guestUserAddress, value);
  }

  // get
  static String getGuestCity() {
    return prefs.read(guestUserCity) ?? '';
  }

  // set
  static void setGuestCity(String value) {
    print('Storing Guest City: $value');
    prefs.write(guestUserCity, value);
  }

  // get
  static String getGuestPhone() {
    return prefs.read(guestUserPhone) ?? '';
  }

  // set
  static void setGuestPhone(String value) {
    print('Storing Guest Phone: $value');
    prefs.write(guestUserPhone, value);
  }

  // get
  static String getCToken() {
    return prefs.read(customerToken) ?? '';
  }

  // set
  static void setCToken(String value) {
    print('Storing Customer Token: $value');
    prefs.write(customerToken, value);
  }

  // get
  static String getCartNote() {
    return prefs.read(cartNote) ?? '';
  }

  // set
  static void setCartNote(String value) {
    print('Storing Cart Note: $value');
    prefs.write(cartNote, value);
  }

  // get cart id
  static String getCartId() {
    return prefs.read(cartId) ?? '';
  }

  // set cart id
  static void setCartId(String value) {
    print('Storing Cart Id : $value');
    prefs.write(cartId, value);
  }

  // get cart id
  static String getCartCheckOutId() {
    return prefs.read(cartCheckOutId) ?? '';
  }

  // set cart id
  static void setCartCheckOutId(String value) {
    print('Storing checkout Id : $value');
    prefs.write(cartCheckOutId, value);
  }

  // get cart id
  static int getMemberId() {
    return prefs.read(memberId) ?? 0;
  }

  // set cart id
  static void setMemberId(int value) {
    print('Storing Member Id : $value');
    prefs.write(memberId, value);
  }


  // get cart id
  static int getCountryId() {
    return prefs.read(countryId) ?? 201;
  }

  // set cart id
  static void setCountryId(int value) {
    print('Storing country Id : $value');
    prefs.write(countryId, value);
  }


  // get cart id
  static String getGuestCheckOutId() {
    return prefs.read(guestCheckOutId) ?? '';
  }

  // set cart id
  static void setGuestCheckOutId(String value) {
    print('Storing checkout Id : $value');
    prefs.write(guestCheckOutId, value);
  }

  // get cart id
  static double getExchangeRate() {
    return prefs.read(exChangeRate) ?? 1450.0;
  }

  // set cart id
  static void setExchangeRate(double value) {
    print('Storing Exchange Rate : $value');
    prefs.write(exChangeRate, value);
  }

  // get
  static String getLoginPass() {
    return prefs.read(loginPass) ?? '';
  }

  // set
  static void setLoginPass(String value) {
    print('Storing Login Password: $value');
    prefs.write(loginPass, value);
  }

  // get
  static List<String> getPromoCode() {
    return prefs.read(promoCodes) ?? [];
  }

  // set
  static void setPromoCodes(List<String> value) {
    print('Storing Code lIst : $value');
    prefs.write(promoCodes, value);
  }

  // get
  static List<String> getPromoImages() {
    return prefs.read(promoImages) ?? [];
  }

  // set
  static void setPromoImages(List<String> value) {
    print('Storing Promo Images lIst : $value');
    prefs.write(promoImages, value);
  }


  // get cart id
  static double getTotalPrice() {
    return prefs.read(totalPrice) ?? 0.0;
  }

  // set cart id
  static void setTotalPrice(double value) {
    print('Storing totalAmount  : $value');
    prefs.write(totalPrice, value);
  }




  /*// get
  static UserModel getUserDetails() {
    var result = prefs.read(userDetails);
    return UserModel.fromJson(json.decode(result));
  }

  // set
  static void setUserDetails(UserModel value) {
    print('Storing Customer Details: ${json.encode(value.toJson())}');
    prefs.write(userDetails, json.encode(value.toJson()));
  }*/

/*
  // get dp
  static String getUserDP() => prefs.read(userDP) ?? '';

  // set dp
  static void setUserDP(String value) => prefs.write(userDP, value);
*/

  static void logoutFn() {
    print("Removing user details");
    prefs.remove(loggedInFlag);
    prefs.remove(userDetails);
  }

  static void logOut() {
    prefs.remove(countryId);
    prefs.remove(loggedInFlag);
    prefs.remove(userDetails);
    prefs.remove(memberId);

  }

  static void clearAll() {
    prefs.erase();
    print('All Data has Cleared!');
  }



  // get0
  static String getStripeKey() {
    print('Get stripe Key: $stripeKey');
    return prefs.read(stripeKey) ?? '';
  }

  // set
  static void setStripeKey(String value) {
    print('Storing stripe Key: $value');
    prefs.write(stripeKey, value);
  }  // get
  static String getClientSecret() {
    print('Get clientSecret: ${prefs.read(clientSecret)}');
    return prefs.read(clientSecret) ?? '';
  }

  // set
  static void setClientSecret(String value) {
    print('Storing clientSecret: $value');
    prefs.write(clientSecret, value);
  }  // get
  static String getPaymentId() {
    print('Get paymentId: $paymentId');
    return prefs.read(paymentId) ?? '';
  }

  // set
  static void setPaymentId(String value) {
    print('Storing paymentId: $value');
    prefs.write(paymentId, value);
  }  // get
  static String getEphemeralKey() {
    print('Get ephemeralKey: $ephemeralKey');
    return prefs.read(ephemeralKey) ?? '';
  }

  // set
  static void setEphemeralKey(String value) {
    print('Storing ephemeralKey: $value');
    prefs.write(ephemeralKey, value);
  }  // get
  static String getCustomerKey() {
    print('Get customerKey: $customerKey');
    return prefs.read(customerKey) ?? '';
  }

  // set
  static void setCustomerKey(String value) {
    print('Storing customerKey: $value');
    prefs.write(customerKey, value);
  }  // get



  static String getTotalAmount() {
    print('Get totalAmount: $totalAmount');
    return prefs.read(totalAmount) ?? '';
  }

  // set
  static void setTotalAmount(String value) {
    print('Storing totalAmount: $value');
    prefs.write(totalAmount, value);
  }
  static String getCurrency() {
    print('Get currency: $currency');
    return prefs.read(currency) ?? '';
  }

  // set
  static void setcurrency(String value) {
    print('Storing currency: $value');
    prefs.write(currency, value);
  }


}
