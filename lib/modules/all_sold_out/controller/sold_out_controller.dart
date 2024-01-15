import 'dart:convert';

import 'package:aladin/modules/all_sold_out/model/all_sold_out_model.dart';
import 'package:aladin/modules/all_sold_out/service/sold_out_service.dart';
import 'package:get/state_manager.dart';

class SoldOutController extends GetxController {
  RxBool pAllSoldOutLoading= false.obs;
  AllSoldOutModel? allSoldOutModel;


  /// get All Sold Out
  void getAllSoldOut() async {
    pAllSoldOutLoading = true.obs;
    try {
      var rAllSoldOut =
      await SoldOutService.getAllSoldOut();
      allSoldOutModel =
          allSoldOutModelFromJson(jsonEncode(rAllSoldOut));
      print("TEst Get All Sold Out Res");
      print("TEst Get = $rAllSoldOut");
    } finally {
      pAllSoldOutLoading.value = false;
    }
  }
}