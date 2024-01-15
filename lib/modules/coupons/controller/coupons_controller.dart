import 'dart:convert';
import 'package:aladin/states/model/ticket_activelist_model.dart';
import 'package:aladin/states/services/ticket_active_service.dart';
import 'package:get/state_manager.dart';

class CouponsController extends GetxController {
  RxBool pTicketLoading= false.obs;
  TicketActiveListModel? ticketModel;

  ///Get Ticket
  void getTicket({required int memberId}) async {
    pTicketLoading = true.obs;
    try {
      var rTicket =
      await TicketService.getTicketActiveList(memberId: memberId);
      ticketModel =
          ticketActiveListModelFromJson(jsonEncode(rTicket));
      print("Test Get Ticket Res");
      print("Test Get = $rTicket");
    } finally {
      pTicketLoading.value = false;
    }
  }
}