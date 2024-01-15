import 'package:aladin/states/services/base_client.dart';

import '../../../constants/string.dart';
import '../../../states/data/prefs.dart';

class CheckOutService {
  static Future<dynamic> checkout({
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
    Map<String, dynamic> pBody = {
      "memberId": memberId,
      "guestId": "$memberId",
      "ticketType": 1,
      "addressBookId": addressId,
      "cardNo": "",
      "currency": "1",
      "useDifrentShipping": 2,
      "fullName": fullName,
      "mobileNumber": mobileNumber,
      "area": area,
      "appartment": appartment,
      "extraDirection": extraDirection,
      "currentLocation": "",
      "latitude": "55.2222222",
      "paymentMethodId": paymentMethodId,
      "paymentId": paymentId,
      "longitude": "22.55555555"
    };

    var response = BaseClient.postData(
      api: '/cart/product/checkout',
      body: pBody,
    );
    return response;
  }

  static Future<dynamic> checkoutStripe({
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
    Map<String, dynamic> pBody = {
      "memberId": memberId,
      "guestId": "$memberId",
      "ticketType": 1,
      "addressBookId": addressId,
      "cardNo": "",
      "currency": "1",
      "useDifrentShipping": 2,
      "fullName": fullName,
      "mobileNumber": mobileNumber,
      "area": area,
      "appartment": appartment,
      "extraDirection": extraDirection,
      "currentLocation": "",
      "paymentMethodId": paymentMethodId,
      "latitude": "55.2222222",
      "longitude": "22.55555555",
      "totalCost": totalCost ?? 0
    };

    var response = BaseClient.postData(
      api: ConstantStrings.kCheckoutStripeApi,
      body: pBody,
    );
    return response;
  }

  static Future<dynamic> updatePaymentStatus(
      int invoicemasterId, String paymentId) async {
    print("logged in");
    var updatePaymentStatusResponse = BaseClient.getData(
        api:
            '${ConstantStrings.kUpdatePaymentStatusApi}?invoicemasterId=${invoicemasterId}&paymentId=${paymentId}');
    return updatePaymentStatusResponse;
  }
}
