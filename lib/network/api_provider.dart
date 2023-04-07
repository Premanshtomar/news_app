import 'dart:convert' show json;
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:news_app/network/constant_urls.dart';
import 'package:news_app/network/network_exceptions.dart';
import 'package:news_app/utils/constants.dart';

class RestApiProvider {
  static Client client = InterceptedClient.build(
    interceptors: [
      RestLoggingInterceptor(),
    ],
  );

  static Map<String, String> headers = {
    "Content-type": "application/json",
    "accept-language": "en",
    'X-Api-Key': '41d0a17262644617a77747eb6565182b'
  };

  Future<dynamic> getApi(
    String apiUrl, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await client.get(
        Uri.https(
          kUrlBase,
          apiUrl,
          queryParams,
        ),
        headers: headers,
      );
      return handleResponse(response);
    } on SocketException {
      throw FetchDataException(kInternetNotFound);
    }
  }

  Future<dynamic> postApi(
    String apiUrl, {
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await client.post(
        Uri.https(kUrlBase, apiUrl),
        body: body,
      );
      return handleResponse(response);
    } on SocketException {
      throw FetchDataException(kInternetNotFound);
    }
  }

  dynamic handleResponse(Response response) {
    try {
      switch (response.statusCode) {
        case 201:
        case 204:
        case 200:
          var responseJson = json.decode(response.body);
          return responseJson;
        case 400:
          throw BadRequestException(response.body.toString());
        case 401:
        case 403:
          throw UnauthorisedException(response.body.toString());
        case 500:

        default:
          throw FetchDataException(
              'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
      }
    } catch (e) {
      throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class RestLoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    log("From Rest Interceptor ---> ${data.toString()}");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    log("From Rest Interceptor ---> ${data.toString()}");
    return data;
  }
}
