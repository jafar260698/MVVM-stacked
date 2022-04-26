import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:stacked_services/stacked_services.dart';
import '../providers/locator.dart';
import 'exceptions.dart';

class ApiProvider {
  Client client = Client();
  NavigationService? navigationService = locator<NavigationService>();

  final baseUrl = 'https://ijro.gov.uz/';

  final baseHeader = {
    HttpHeaders.authorizationHeader: getBaseAuth(),
    HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
  };

  // custom url director
  String getQuery(Map<String, dynamic> params) {
    var result = "?";
    params.forEach((key, value) {
      result += '&$key=$value';
    });
    return result;
  }

  Uri getUrl(String baseUrl, String path, Map<String, dynamic> params) {
    return Uri.parse('$baseUrl$path${getQuery(params)}');
  }

  static String getBaseAuth() {
    String username = 'ijro.uz';
    String password = '123456789';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    return basicAuth;
  }


  // API
  Future<dynamic> mockApi(Map<String, String?> params) async {
    var responseJson;
    try {
      final response = await client.get(
          getUrl(baseUrl, 'services', params),
          headers: baseHeader);

      var res = _response(response);
      responseJson = res;
    } on FetchDataException {
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }



  // catch exception
  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        print(responseJson);
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body);
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 415:
        break;
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

}
