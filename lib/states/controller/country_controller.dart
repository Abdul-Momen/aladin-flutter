import 'dart:convert';
import 'package:aladin/states/model/all_country_model.dart';
import 'package:aladin/states/model/country_model.dart';
import 'package:aladin/states/services/country_service.dart';
import 'package:get/state_manager.dart';

class CountryController extends GetxController {
  RxBool pCountryLoading = false.obs;
  CountryModel? countryModel;
  RxBool pAllCountryLoading = false.obs;

  final allCountryModel = AllCountryModel().obs;
  final dropdownvalue = Rxn<Country>();



  /// Country
  void getCountry({required int countryId}) async {
    pCountryLoading = true.obs;
    try {
      var rCountry =
      await CountryService.getCountry(countryId: countryId);
      countryModel =
          countryModelFromJson(jsonEncode(rCountry));
      print("Country = $rCountry");
    } finally {
      pCountryLoading.value = false;
    }
  }

  /// All Country
  void getAllCountry() async {
    pAllCountryLoading = true.obs;
    try {

      var rAllCountry =
      await CountryService.getAllCountry();
      allCountryModel.value =
          settingModelFromJson(jsonEncode(rAllCountry));
 dropdownvalue.value = allCountryModel.value.data!.countries[0];

      print("id id id dropdownvalue.value= ${dropdownvalue.value!.countryId}");
    } finally {
      pAllCountryLoading.value = false;
    }
  }
}
