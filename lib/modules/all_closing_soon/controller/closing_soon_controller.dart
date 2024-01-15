import 'dart:convert';

import 'package:aladin/modules/all_closing_soon/model/all_closing_soon_model.dart';
import 'package:aladin/modules/all_closing_soon/service/all_closing_soon_service.dart';
import 'package:get/state_manager.dart';

class ClosingSoonController extends GetxController {
  RxBool pAllClosingSoonLoading= false.obs;
  AllClosingModel? allClosingModel;


  /// get All Campaign
  void getAllClosingSoon({required int memberId}) async {
    pAllClosingSoonLoading = true.obs;
    try {
      var rAllClosingSoon =
      await AllClosingSoonService.getAllClosingSoon();
      allClosingModel =
          allClosingModelFromJson(jsonEncode(rAllClosingSoon));
      print("TEst Get All Closing Soon Res");
      print("TEst Get = $rAllClosingSoon");
    } finally {
      pAllClosingSoonLoading.value = false;
    }
  }
}