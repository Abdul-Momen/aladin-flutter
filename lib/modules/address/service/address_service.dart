
import 'package:aladin/constants/string.dart';
import 'package:aladin/states/services/base_client.dart';

class AddressService {

  /// get member address
  static Future<dynamic> getMemberAddress({required int memberId}) async {
    var rMemberAddress = BaseClient.getData(
        parameter: {
          'memberId':memberId,
        },
        api: ConstantStrings.kMemberAddress);
    return rMemberAddress;
  }

  /// get member address All
  static Future<dynamic> getMemberAddressAll({required int memberId}) async {
    var rMemberAddressAll = BaseClient.getData(
        parameter: {
          'memberId':memberId,
        },
        api: ConstantStrings.kMemberAddressAll);
    return rMemberAddressAll;
  }

  /// get member address Details
  static Future<dynamic> getAddressDetails({required int AddressBookId}) async {
    var rAddressDetails = BaseClient.getData(
        parameter: {
          'AddressBookId': AddressBookId,
        },
        api: ConstantStrings.kAddressDetails);
    return rAddressDetails;
  }

  ///Post Add Address
  static Future<dynamic> postAddAddress({
    required int addressBookId,
    required String fullName,
    required String mobileNumber,
    required String area,
    required String apartmentNo,
    required String extraDirection,
    required String currentLocation,
    required String latitude,
    required String longitude,
    required int memberId,
    required bool isDefault,
  }) async {
    Map<String, dynamic> pBody = {
      "addressBookId": addressBookId,
      "fullName": fullName,
      "mobileNumber": mobileNumber,
      "area": area,
      "apartmentNo": apartmentNo,
      "extraDirection": extraDirection,
      "currentLocation": currentLocation,
      "latitude": latitude,
      "longitude": longitude,
      "memberId": memberId,
      "isDefault": isDefault,
    };
    var rAddAddress = BaseClient.postData(
      api: ConstantStrings.kAddAddress,
      body: pBody,
    );
    return rAddAddress;
  }

  ///Post Edite Address
  static Future<dynamic> postEditeAddress({
    required int addressBookId,
    required String fullName,
    required String mobileNumber,
    required String area,
    required String apartmentNo,
    required String extraDirection,
    required String currentLocation,
    required String latitude,
    required String longitude,
    required int memberId,
    required bool isDefault,
  }) async {
    Map<String, dynamic> pBody = {
      "addressBookId": addressBookId,
      "fullName": fullName,
      "mobileNumber": mobileNumber,
      "area": area,
      "apartmentNo": apartmentNo,
      "extraDirection": extraDirection,
      "currentLocation": currentLocation,
      "latitude": latitude,
      "longitude": longitude,
      "memberId": memberId,
      "isDefault": isDefault,
    };
    var rEditeAddress = BaseClient.postData(
      api: ConstantStrings.kEditeAddress,
      body: pBody,
    );
    return rEditeAddress;
  }

  ///Post Set Default Address
  static Future<dynamic> postDefaultAddress({required int AddressBookId}) async {
    var rDefaultAddress = BaseClient.postData(
      parameter: {
        'AddressBookId':AddressBookId,
      },
      api: ConstantStrings.kDefaultAddress,
    );
    return rDefaultAddress;
  }

  ///Remove Address
  static Future<dynamic> removeAddress({required int AddressBookId}) async {
    var rAddressRemove = BaseClient.postData(
      parameter: {
        'AddressBookId':AddressBookId,
      },
      api: ConstantStrings.kRemoveAddress,
    );
    return rAddressRemove;
  }

}