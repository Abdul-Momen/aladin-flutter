import 'dart:convert';

import 'package:aladin/modules/winer/model/winners_list_model.dart';
import 'package:aladin/modules/winer/service/winner_service.dart';
import 'package:get/state_manager.dart';

class WinnerController extends GetxController {

  RxBool pWinnerAllLoading = false.obs;
 // WinnerAlllistModel? winnerAllListModel;
  WinnersListModel? winnersListModel;

  /// Winner All
  void getWinnerAll() async {
    pWinnerAllLoading = true.obs;
    try {
      var rWinnerAll =
      await WinnerService.getWinnerAll();
    /*  winnerAllListModel =
          winnerAlllistModelFromJson(jsonEncode(rWinnerAll));*/
      winnersListModel = winnersListModelFromJson(jsonEncode(rWinnerAll));
      print("TEst Get Winner All Res");
      print("TEst Get = $rWinnerAll");
    } finally {
      pWinnerAllLoading.value = false;
    }
  }

}