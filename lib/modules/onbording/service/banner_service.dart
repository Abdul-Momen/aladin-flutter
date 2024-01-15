
import 'package:aladin/constants/string.dart';
import 'package:aladin/states/services/base_client.dart';


class BannerService {

  //get image
  static Future<dynamic> getOnboardImage() async {
    var response = BaseClient.getData(
      api: '${ConstantStrings.kAppBanner}?Identifier=App_Banner',
      /*  parameter: {
         'Identifier':'App_Banner'
        }*/
    );
    return response;
  }
  //https://hazadeals.r-y-x.net/api/v1/webHtmls/list-by-identifier?Identifier=App_Banner
  static Future<dynamic> testPost({
    required int bankAc,
    required int addBalance,
    required int userId,
}) async {
    Map<String, dynamic> pBody = {
      "bank_acc_no": bankAc,
      "bank_balance": addBalance,
      "user_id": userId,
    };
    var response = BaseClient.postData(
      api: 'post-data',
      body: pBody,
    );
    return response;
  }


}

/*
class TestBaseClient {
  static Future<dynamic> getData({
    required String api,
    dynamic parameter,
    String? apiVersion,
    String? kBaseUrl,
  }) async {
    // String username = 'admin';
    // String password = '1234';
    // String basicAuth =
    //     'Basic ${base64.encode(utf8.encode('$username:$password'))}';
    String apiV = apiVersion ?? ConstantStrings.kAPIVersion;
    String kBase = kBaseUrl??ConstantStrings.kTablighBaseUrl;

    String url =kBase + apiV + api;
    print('Sending request to: $url');
    if (parameter != null) {
      print("Parameter: $parameter");
    }
    try {
      var response = await Dio().get(
        url,
        options: Options(
          // headers: {
          //   'Authorization': basicAuth,
          // },
        ),
        queryParameters: parameter,
      );
      print('Test GET Method: ${response.statusCode}');
      print(url);
      log("Test GET Response:  ${jsonEncode(response.data)}");
      return response.data;
    } on DioError catch (e) {
      print(e.toString());
      Methods.showSnackbar(
        msg: AppStrings.kWentWrong,
      );
    }
  }



  static Future<dynamic> postData({
    required String api,
    dynamic body,
    dynamic headers,
    String? apiVersion,
  }) async {

    String url = 'https://tabligh.hi-techtest.com/api/v1/post-data';
    print('Sending request to: $url');
    if (body != null) {
      log("Test Post Body: $body");
    }
    try {
      var response = await Dio().post(
        url,
        options: Options(
         *//* headers: {
           // 'Authorization': basicAuth,
          },*//*
        ),
        data: body,
      );
      print('Test POST Method: ${response.statusCode}');
      print(url);
      log("Test POST Response:  ");
      log(jsonEncode(response.data));

      return response.data;
    } on DioError catch (e) {
      print(e.toString());
      Utilities.showSnackbar(
        msg: AppStrings.kWentWrong,
      );
    }
  }
}*/
