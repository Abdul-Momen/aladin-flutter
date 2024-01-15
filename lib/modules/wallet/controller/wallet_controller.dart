
import 'dart:convert';

import 'package:aladin/modules/wallet/model/add_wallet_money_response_model.dart';
import 'package:get/state_manager.dart';

import '../model/wallet_data_response_model.dart';
import '../service/wallet_service.dart';

class WalletController extends GetxController {
  RxBool walletDataLoadingFlag= false.obs;
  RxBool addMoneyLoadingFlag= false.obs;

  WalletDataResponseModel? walletResponseModel;
  AddWalletMoneyResponseModel? addWalletMoneyResponseModel;

  /// Wallet data
void getWalletData() async {
  walletDataLoadingFlag = true.obs;
    try {
      var walletData =
      await WalletService.getWalletData();
      walletResponseModel =
          walletDataResponseModelFromJson(jsonEncode(walletData));
      print("Wallett Get = $walletData");
    } finally {
      walletDataLoadingFlag.value = false;
    }
  }


  void addMoneyToWallet(int amount) async {
    addMoneyLoadingFlag = true.obs;
    try {
      var walletData =
      await WalletService.addMoneyToWallet(amount: amount);
      addWalletMoneyResponseModel =
          addWalletMoneyResponseModelFromJson(jsonEncode(walletData));
      print("Wallett Get = $walletData");
    } finally {
      addMoneyLoadingFlag.value = false;
    }
  }
}
