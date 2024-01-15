import 'dart:convert';
import 'package:aladin/modules/address/model/add_address_model.dart';
import 'package:aladin/modules/address/model/defualt_address_model.dart';
import 'package:aladin/modules/address/model/details_address_model.dart';
import 'package:aladin/modules/address/model/edite_address_model.dart';
import 'package:aladin/modules/address/model/list_by_member_address_model.dart';
import 'package:aladin/modules/address/model/list_by_member_all_address_model.dart';
import 'package:aladin/modules/address/model/remove_address_model.dart';
import 'package:aladin/modules/address/service/address_service.dart';
import 'package:get/state_manager.dart';


class AddressController extends GetxController {
  RxBool pMemberAddressLoading= false.obs;
  ListByMemberAddressModel? memberAddressModel;
  RxBool pMemberAddressAllLoading= false.obs;
  ListByMemberAllAddressModel? memberAllAddressModel;
  RxBool pDetailsAddressLoading= false.obs;
  DetailsAddressModel? detailsAddressModel;
  RxBool pAddAddressLoading= false.obs;
  AddAddressModel? addAddressModel;
  RxBool pEditeAddressLoading= false.obs;
  EditeAddressModel? editeAddressModel;
  RxBool pDefaultAddressLoading= false.obs;
  DefaultAddressModel? defaultAddressModel;
  RxBool pRemoveAddressLoading= false.obs;
  RemoveAddressModel? removeAddressModel;


  /// get member address
  void getMemberAddress({required int memberId}) async {
    pMemberAddressLoading = true.obs;
    try {
      var rpMemberAddress =

     // await AddressService.getMemberAddressAll(memberId: memberId);
       await AddressService.getMemberAddress(memberId: memberId);
      memberAddressModel =
          listByMemberAddressModelFromJson(jsonEncode(rpMemberAddress));
      print("TEst Get member address Res");
      print("TEst Get = $rpMemberAddress");
    } finally {
      pMemberAddressLoading.value = false;
    }
  }

  /// get member address all
  void getMemberAddressAll({required int memberId}) async {
    pMemberAddressAllLoading = true.obs;
    try {
      var rMemberAllAddress =
      await AddressService.getMemberAddressAll(memberId: memberId);
      memberAllAddressModel =
          listByMemberAllAddressModelFromJson(jsonEncode(rMemberAllAddress));
      print("TEst Get member all address Res");
      print("TEst Get = $rMemberAllAddress");
    } finally {
      pMemberAddressAllLoading.value = false;
    }
  }

  /// get member address details
  void getAddressDetails({required int AddressBookId}) async {
    pDetailsAddressLoading = true.obs;
    try {
      var rAddressDetails =
      await AddressService.getAddressDetails(AddressBookId: AddressBookId);
      detailsAddressModel =
          detailsAddressModelFromJson(jsonEncode(rAddressDetails));
      print("TEst Get member address details Res");
      print("TEst Get = $rAddressDetails");
    } finally {
      pDetailsAddressLoading.value = false;
    }
  }

  ///Post Add Address
  void postAddAddress({
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
    pAddAddressLoading.value = true;
    try {
      var rAddAddress = await AddressService.postAddAddress(
        addressBookId: addressBookId,
        fullName: fullName,
        mobileNumber: mobileNumber,
        area: area,
        apartmentNo: apartmentNo,
        extraDirection: extraDirection,
        currentLocation: currentLocation,
        latitude: latitude,
        longitude: longitude,
        memberId: memberId,
        isDefault: isDefault
      );
      addAddressModel = addAddressModelFromJson(jsonEncode(rAddAddress));
      print(addAddressModel!.code.toString());
    } finally {
      pAddAddressLoading.value = false;
    }
  }

  ///Post Edite Address
  void postEditeAddress({
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
    pEditeAddressLoading.value = true;
    try {
      var rEditeAddress = await AddressService.postEditeAddress(
          addressBookId: addressBookId,
          fullName: fullName,
          mobileNumber: mobileNumber,
          area: area,
          apartmentNo: apartmentNo,
          extraDirection: extraDirection,
          currentLocation: currentLocation,
          latitude: latitude,
          longitude: longitude,
          memberId: memberId,
          isDefault: isDefault
      );
      editeAddressModel = editeAddressModelFromJson(jsonEncode(rEditeAddress));
      print(editeAddressModel!.code.toString());
    } finally {
      pEditeAddressLoading.value = false;
    }
  }

  ///Post Default Address
  void postDefaultAddress({required int AddressBookId}) async {
    pDefaultAddressLoading = true.obs;
    try {
      var rDefaultAddress =
      await AddressService.postDefaultAddress(AddressBookId: AddressBookId);
      defaultAddressModel =
          defaultAddressModelFromJson(jsonEncode(rDefaultAddress));
      print("TEst Get Default Address Res");
      print("TEst Get = $rDefaultAddress");
    } finally {
      pDefaultAddressLoading.value = false;
    }
  }

  ///Remove Address
  void removeAddress({required int AddressBookId}) async {
    pRemoveAddressLoading = true.obs;
    try {
      var rRemoveAddress =
      await AddressService.removeAddress(AddressBookId: AddressBookId);
      removeAddressModel =
          removeAddressModelFromJson(jsonEncode(rRemoveAddress));
      print("TEst Get Remove Address Res");
      print("TEst Get = $rRemoveAddress");
    } finally {
      pRemoveAddressLoading.value = false;
      // getMemberAddressAll(memberId: Preference.getMemberId());


    }
  }
}
