import 'dart:convert';

import 'package:aladin/modules/checkout/model/checkout_model.dart';
import 'package:aladin/modules/checkout/model/checkout_stripe_response_model.dart';
import 'package:aladin/modules/checkout/service/mycart_service.dart';
import 'package:aladin/states/data/prefs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/state_manager.dart';

class CheckOutController extends GetxController {
  RxBool checkOutLoading = false.obs;
  RxBool checkOutStripeLoading = false.obs;
  RxBool updateStatusLoading = false.obs;

  CheckoutModel? checkoutModel;
  CheckoutStripeResponseModel? checkoutStripeResponseModel;
  Dio dio = Dio();
  bool isProcessing = false;

  void checkout({
    required int memberId,
    required int addressId,
    required int useDifrentShipping,
    required String cardNo,
    required String currency,
    required String fullName,
    required String mobileNumber,
    required String area,
    required String appartment,
    required String extraDirection,
    required String currentLocation,
    required String latitude,
    required String longitude,
    required int paymentMethodId,
    required String paymentId,
  }) async {
    checkOutLoading.value = true;
    try {
      var checkoutRes = await CheckOutService.checkout(
        memberId: memberId,
        addressId: addressId,
        useDifrentShipping: useDifrentShipping,
        cardNo: cardNo,
        currency: currency,
        fullName: fullName,
        mobileNumber: mobileNumber,
        area: area,
        appartment: appartment,
        extraDirection: extraDirection,
        currentLocation: currentLocation,
        latitude: latitude,
        longitude: longitude,
        paymentMethodId: paymentMethodId,
        paymentId: paymentId
      );
      checkoutModel = checkoutModelFromJson(jsonEncode(checkoutRes));
      // initThePaymentSheet();
      print(checkoutModel!.code.toString());
    } finally {
      checkOutLoading.value = false;
    }
  }

  void checkoutStripe({
    required int memberId,
    required int addressId,
    required int useDifrentShipping,
    required String cardNo,
    required String currency,
    required String fullName,
    required String mobileNumber,
    required String area,
    required String appartment,
    required String extraDirection,
    required String currentLocation,
    required String latitude,
    required String longitude,
    required int paymentMethodId,
    int? totalCost,
  }) async {
    checkOutStripeLoading.value = true;
    try {
      var checkoutRes = await CheckOutService.checkoutStripe(
          memberId: memberId,
          addressId: addressId,
          useDifrentShipping: useDifrentShipping,
          cardNo: cardNo,
          currency: currency,
          fullName: fullName,
          mobileNumber: mobileNumber,
          area: area,
          appartment: appartment,
          extraDirection: extraDirection,
          currentLocation: currentLocation,
          latitude: latitude,
          longitude: longitude,
          paymentMethodId: paymentMethodId,
          totalCost: totalCost ?? 0);
      checkoutStripeResponseModel =
          checkoutStripeResponseModelFromJson(jsonEncode(checkoutRes));

      Preference.setPaymentId(
          checkoutStripeResponseModel!.data.orderRequest.paymentId);
      Preference.setStripeKey(
          checkoutStripeResponseModel!.data.orderRequest.key);
      Preference.setClientSecret(
          checkoutStripeResponseModel!.data.orderRequest.clientSecret);
      Preference.setEphemeralKey(
          checkoutStripeResponseModel!.data.orderRequest.ephemeralKey);
      Preference.setCustomerKey(
          checkoutStripeResponseModel!.data.orderRequest.customerKey);

      print(checkoutStripeResponseModel!.code.toString());
    } finally {
      checkOutStripeLoading.value = false;
    }
  }

  void updatePaymentStatus(int invoicemasterId, String paymentId) async {
    updateStatusLoading = true.obs;
    try {
      var updateStatusResponse =
          await CheckOutService.updatePaymentStatus(invoicemasterId, paymentId);
      //  updateStatusResponse = campaignRuningModelFromJson(jsonEncode(runningResponse));
      print("Status updated");
    } finally {
      updateStatusLoading.value = false;
    }
  }

//for online payment
  void createPaymentIntent() async {
    //setState(() {
    isProcessing = true;
    //  });
    try {
      // print('_cData.last  ${_cData.last}');
      // print('_cData.last*100  ${_cData.last * 100}');
      var response = await dio.post('https://api.stripe.com/v1/payment_intents',
          /* data: {
            'amount': '${100}',
            'currency': 'AED',
            'payment_method_types[]': 'card'
          },*/
          options: Options(headers: {
            //use Stripe account secret key is here after Bearer
            'Authorization': 'Bearer ${Preference.getStripeKey()}',

            // 'Bearer sk_test_51M4JctDyI9CyAnKqfCpcPM0QWa90xcy0GYvL7LtvZAb10s4HHcJUrW4NoZEzZY2SK91XkeBwCNnLivM6KJvVAwAy00HeHuGl8B',
            'Content-Type': 'application/x-www-form-urlencoded'
          }));

      print('stripe response =>');
      print(response.data.toString());
    } catch (err) {
      //  setState(() {
      isProcessing = false;
      //  });
      debugPrint(
          'error in createPaymentIntent in Dio post API charging user: ${err.toString()}');
    }
  }
}
