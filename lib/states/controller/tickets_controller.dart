import 'dart:convert';
import 'package:aladin/states/model/ticket_activelist_model.dart';
import 'package:aladin/states/services/ticket_active_service.dart';
import 'package:get/state_manager.dart';

class TicketsController extends GetxController {
  RxBool pTicketActiveLoading = false.obs;
  TicketActiveListModel? ticketActiveModel;


  ///Ticket Active List
  void getTicketActiveList({required int memberId}) async {
    pTicketActiveLoading = true.obs;
    try {
      var rTicketList =
      await TicketService.getTicketActiveList(memberId: memberId);
      ticketActiveModel = ticketActiveListModelFromJson(jsonEncode(rTicketList));
      print("Test Get Ticket Active List Res");
      print("Test Get = $rTicketList");
    } finally {
      pTicketActiveLoading.value = false;
    }
  }
}
