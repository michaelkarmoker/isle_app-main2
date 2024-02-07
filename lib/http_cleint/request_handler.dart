import 'dart:developer' show log;
import 'package:get/get.dart' show GetxController;
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_config.dart';


class RequestHandler extends GetxController {
  RequestHandler({
    required Dio dio,
    required SharedPreferences prefs,
  })  : _dio = dio,
        _sharedPrefs = prefs;

  static const mainUrl = AppConfig.baseUrl;
  
  final Dio _dio;
  Dio get dio => _dio;
  final SharedPreferences _sharedPrefs;
  SharedPreferences get shredPrefs => _sharedPrefs;

  updateHeader({required String token}) async {
    // await _sharedPrefs.setString('user_token', token);

    String currentToken = _sharedPrefs.getString("user_token") ?? token;
    print("#UpdatedHeader: \$TOKEN => $currentToken");
    dio.options.headers['Authorization'] = 'Bearer $currentToken';
    dio.options.headers['Connection'] = 'keep-alive';
  }

  Future post(
    String url,
    dynamic params, {
    String? errorMsg,
    String? baseUrl,
    Options? options,
    Map<String, dynamic>? queryParams,
  }) async {
      log("url ${mainUrl + url}");
      print(dio.options.headers.toString());
      //log(dio.options.headers.toString());
      log(" =========== @ END @ ====== ");
    
    try {
      final response = await dio.post(
        baseUrl ?? mainUrl + url,
        data: params,
        queryParameters: queryParams,
        options: options 
      );

      return response.data;
    } on DioError catch (error, stracktrace) {
      return RequestException(
        method: "/POST",
        url: baseUrl ?? mainUrl + url,
        data: params,
        error: error,
        msg: errorMsg,
        trace: stracktrace,
        res: error.response,
        statusCode: error.response?.statusCode,
      );
    } catch (error, stracktrace) {
      return RequestException(
        method: "/POST",
        url: baseUrl ?? mainUrl + url,
        msg: errorMsg,
        data: params,
        error: error,
        trace: stracktrace,
      );
    }
  }

  Future get(
    String url, {
    String? errorMsg,
    String? baseUrl,
    Options? options,
    Map<String, dynamic>? queryParams,
  }) async {
      log("url ${mainUrl + url}");
      log(dio.options.headers.toString());
      print(dio.options.headers.toString());
      log(" =========== @ END @ ====== ");
    try {
      final response = await dio.get(
        baseUrl ?? mainUrl + url,
        options: options,
        queryParameters: queryParams,
      );
      return response.data;
    } on DioError catch (error, stracktrace) {
      return RequestException(
        method: "/GET",
        url: baseUrl ?? mainUrl + url,
        error: error,
        msg: errorMsg,
        trace: stracktrace,
        res: error.response,
        statusCode: error.response?.statusCode,
      );
    } catch (error, stracktrace) {
      return RequestException(
        method: "/GET",
        url: baseUrl ?? mainUrl + url,
        msg: errorMsg,
        error: error,
        trace: stracktrace,
      );
    }
  }

  Future put(
    String url,
    Map<String, dynamic> params, {
    String? errorMsg,
    String? baseUrl,
    Options? options,
    Map<String, dynamic>? queryParams,
  }) async {
    log("url ${mainUrl + url}");
    //log(dio.options.headers.toString());
    //log(dio.options.headers.toString());
    log(" =========== @ END @ ====== ");
    Response response;
    try {
      response = await dio.put(
        baseUrl ?? mainUrl + url,
        data: params,
        queryParameters: queryParams,
        options: options,
      );
      return response.data;
    } on DioError catch (error, stracktrace) {
      return RequestException(
        method: "/PUT",
        url: baseUrl ?? mainUrl + url,
        data: params,
        error: error,
        msg: errorMsg,
        trace: stracktrace,
        res: error.response,
        statusCode: error.response?.statusCode,
      );
    } catch (error, stracktrace) {
      return RequestException(
        method: "/PUT",
        url: baseUrl ?? mainUrl + url,
        msg: errorMsg,
        data: params,
        error: error,
        trace: stracktrace,
      );
    }
  }
}

class RequestException implements Exception {
  String url;
  String? msg;
  Object error;
  String method;
  Response? res;
  int? statusCode;
  StackTrace trace;
  dynamic data;

  RequestException({
    this.msg,
    this.res,
    this.data,
    this.statusCode,
    required this.url,
    required this.method,
    required this.error,
    required this.trace,
  }) {
    log(
      """
/*
    method: "$method"
    statusCode: $statusCode
    url: "$url
    errorMsg: "$msg"
    data: ${data.toString()}
    res: $res
*/
""",
      name: "#RequestException",
      time: DateTime.now(),
      error: error,
      stackTrace: trace,
    );
  }

  // ///[Specefic to app!] It tries to show an error msg, using the [showToast()] method!
  // handleError({required String defaultMessage}) {
  //   try {
  //     final pursedData = Map.from(res?.data);
  //
  //     if (pursedData.containsKey('error') &&
  //         pursedData['error'] is Map<String, dynamic>) {
  //       if (pursedData['error'].containsKey('deatils') &&
  //           pursedData['error']['deatils'] is String) {
  //         showToast(pursedData['error']['deatils']);
  //         return;
  //       }
  //     }
  //     if (pursedData.containsKey('message')) {
  //       showToast((pursedData['message'] as String?)?.capitalizeFirst ??
  //           defaultMessage);
  //     } else {
  //       showToast(msg ?? defaultMessage);
  //     }
  //   } catch (e) {
  //     log('# Response is not a [Map<String, dynamic>]! instead ${res?.data.runtimeType}', error: e);
  //     showToast(msg ?? defaultMessage);
  //   }
  // }
}

