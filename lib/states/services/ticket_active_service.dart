import 'package:aladin/constants/string.dart';
import 'package:aladin/states/services/base_client.dart';

class TicketService{
  /// get Ticket Active List
  static Future<dynamic> getTicketActiveList({required int memberId}) async {
    var rTicketList = BaseClient.getData(
        parameter: {
          'memberId':memberId,
        },
        api: ConstantStrings.kTicketActive);
    return rTicketList;
  }
}