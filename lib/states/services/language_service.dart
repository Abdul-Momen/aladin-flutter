import 'package:aladin/constants/string.dart';
import 'package:aladin/states/services/base_client.dart';

class LanguageService{
  /// get Language
  static Future<dynamic> getLanguage() async {
    var rLanguage =
    BaseClient.getData(api: ConstantStrings.kLanguage);
    return rLanguage;
  }
}