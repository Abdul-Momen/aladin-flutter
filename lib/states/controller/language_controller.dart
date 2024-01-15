import 'dart:convert';
import 'package:aladin/states/model/language_model.dart';
import 'package:aladin/states/services/language_service.dart';
import 'package:get/state_manager.dart';

class LanguageController extends GetxController {
  RxBool pLanguageLoading = false.obs;
  LanguageModel? languageModel;

  /// Language
  void getLanguage() async {
    pLanguageLoading = true.obs;
    try {
      var rLanguage =
      await LanguageService.getLanguage();
      languageModel =
          languageModelFromJson(jsonEncode(rLanguage));
      print("Test Get Language Res");
      print("Test Get = $rLanguage");
    } finally {
      pLanguageLoading.value = false;
    }
  }
}
