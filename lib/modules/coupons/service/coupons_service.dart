import 'package:aladin/constants/string.dart';
import 'package:aladin/states/services/base_client.dart';

class CouponService {
  /// get ticket list by member
  static Future<dynamic> getTicket({required int memberId}) async {
    var rTicket = BaseClient.getData(
        parameter: {
          'memberId':memberId,
        },
        api: ConstantStrings.kTicketActive);
    return rTicket;
  }
}