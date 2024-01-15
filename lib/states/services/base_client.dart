 import 'dart:convert';
import 'dart:developer';
import 'package:aladin/constants/string.dart';
import 'package:aladin/states/utils/methods.dart';
import 'package:dio/dio.dart';

class BaseClient {
  //for get
  static Future<dynamic> getData({
    String? token,
    String? bToken,
    required String api,
    dynamic parameter,
    String? apiVersion,
    String? dBaseUrl,
    String? kAuthKey,
  }) async {
    String apiV = apiVersion ?? ConstantStrings.kAPIVersion;
    String apiBase = dBaseUrl ?? ConstantStrings.kBaseUrl;
    String url = apiBase + apiV + api;
    //String url = '${ConstantStrings.kBaseUrl}$}$api;

    String basicAuth = 'Basic ${base64.encode(utf8.encode('$bToken'))}';

    ///print(basicAuth);
    print('Sending request to: $url');
    if (token != null) {
      ///print('User Token: $token');
    }
    if (bToken != null) {
      ///print('User Token: $bToken');
    }
    if (parameter != null) {
      ///print("Parameter: $parameter");
    }

    var headers = <String, String>{}; //here i defined Map type
    headers['Content-Type'] = 'Application/Json';
    // edit headers
    headers[kAuthKey ?? 'X-Shopify-Access-Token'] = '$token';

    try {
      var response = await Dio().get(
        url,
        options: token != null
            ? Options(
                headers: headers,
              )
            : bToken != null
                ? Options(
                    headers: {
                      'Content-Type': 'application/json',
                      "Authorization": basicAuth,
                    },
                  )
                : null,
        queryParameters: parameter,
      );
      print('GET Method: ${response.statusCode}');
      print(url);
      log("GET Response: ${jsonEncode(response.data)}");

      //   log("GET Response:  ${response.data}");
      return response.data;
    } catch (e) {
      Methods.showSnackbar(
        msg: ConstantStrings.kWentWrong,
      );
    }
  }

  //for post
  static Future<dynamic> postData({
    required String api,
    String? token,
    dynamic body,
    String? apiVersion,
    String? bToken,
    String? dBaseUrl,
    String? kAuthKey,
    dynamic parameter,

  }) async {
    String apiV = apiVersion ?? ConstantStrings.kAPIVersion;
    String apiBase = dBaseUrl ?? ConstantStrings.kBaseUrl;
    String url = apiBase + apiV + api;
    //String url = '${ConstantStrings.kBaseUrl}$}$api;

    String basicAuth = 'Basic ${base64.encode(utf8.encode('$bToken'))}';

    ///  print(basicAuth);
    print('Sending request to: $url');
    if (token != null) {
      ///  print('User Token: $token');
    }
    if (bToken != null) {
      ///  print('User Token: $bToken');
    }

    var headers = <String, String>{}; //here i defined Map type
    headers['Content-Type'] = 'Application/Json';
    // headers['X-Shopify-Access-Token'] = '$token';
    headers[kAuthKey ?? 'X-Shopify-Access-Token'] = '$token';
    log("Post Body: ${jsonEncode(body)}");
    print("Post Body: ${jsonEncode(body)}");
    log("Post Body: $body");
    try {
      var response = await Dio().post(

        url,
        options: token != null
            ? Options(
                headers: headers,
              )
            : bToken != null
                ? Options(
                    headers: {
                      'Content-Type': 'application/json',
                      "Authorization": basicAuth,
                    },
                  )
                : null,
        data: body,
        queryParameters: parameter,
      );
      print('POST Method: ${response.statusCode}');
      log("POST Response:  ${jsonEncode(response.data)}");
      // print(url);
      // log("POST Response:  ${response.data}");
      return response.data;
    } on DioError catch (e) {
      print(e.toString());
      processErrorRes(e.response!.statusCode!);
      return e.response!.data;
    }
  }

  //for putRequest
  static Future<dynamic> putData({
    required String api,
    String? token,
    dynamic body,
    String? apiVersion,
    String? bToken,
    String? dBaseUrl,
  }) async {
    String apiV = apiVersion ?? ConstantStrings.kAPIVersion;
    String apiBase = dBaseUrl ?? ConstantStrings.kBaseUrl;
    String url = apiBase + apiV + api;
    //String url = '${ConstantStrings.kBaseUrl}retailer/$api';

    // print('Sending request to: $url');
    if (token != null) {
      //  print('User Token: $token');
    }
    log("Post Body: $body");
    try {
      var response = await Dio().put(
        url,
        options: token != null
            ? Options(
                headers: {
                  //'Authorization': 'Bearer $token',
                  'Content-Type': 'Application/Json',
                  'X-Shopify-Access-Token': token,
                },
                // contentType: 'Application/Json',
              )
            : null,
        data: body,
      );
      print('POST Method: ${response.statusCode}');
      //  print(url);
      // log("POST Response:  ${response.data}");
      return response.data;
    } on DioError catch (e) {
      print(e.toString());
      processErrorRes(e.response!.statusCode!);
      return e.response!.data;
    }
  }

  static void processErrorRes(int sCode) {
    switch (sCode) {
      case 401:
        Methods.showSnackbar(
          title: 'Status Code: $sCode',
          msg: 'Unauthorized response.',
        );
        break;
      case 201:
        Methods.showSnackbar(
          title: 'Status Code: $sCode',
          msg: 'Successfully Create.',
        );
        break;
      case 422:
        Methods.showSnackbar(
          title: 'Status Code: $sCode',
          msg: 'Unprocessable Entity.',
        );
        break;
      case 500:
        Methods.showSnackbar(
          title: 'Status Code: $sCode',
          msg: 'Internal Server Error.',
        );
        break;
      default:
        Methods.showSnackbar(
          title: 'Status Code: $sCode',
          msg: ConstantStrings.kWentWrong,
        );
    }
  }

// static Future<dynamic> getData({required String api}) async {
//   print(ConstantStrings.kBaseUrl + api);
//   try {
//     var response = await Dio().get(ConstantStrings.kBaseUrl + api);
//     print('Base Client: ${response.statusCode}');
//     print(response.data);
//     return response.data;
//   } catch (e) {
//     print(e);
//   }
// }

// static Future<dynamic> postData(
//     {required String api, required dynamic body}) async {
//   try {
//     var response = await Dio().post(
//       ConstantStrings.kBaseUrl + api,
//       data: body,
//     );
//     return response.data;
//   } catch (e) {
//     print(e);
//   }
// }
}
