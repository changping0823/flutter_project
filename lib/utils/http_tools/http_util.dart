import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'http_response.dart';

const String baseUrl = 'https://www.wanandroid.com';
class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  late Dio _dio;
  late BaseOptions _baseOptions;

  factory HttpUtil() => _instance;

  HttpUtil._internal() {
    _baseOptions = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
    );
    _dio = Dio(_baseOptions);
    /// 添加拦截器
    _dio.interceptors.add(CustomInterceptor());

    /// 添加缓存拦截器
    // dio.interceptors.add(CacheInterceptor());
  }


  Future<HttpResponse<T>> get<T>(String url, {Map<String, dynamic>? params}) async {
    var response = await _dio.get(url);
    if (response.statusCode == HttpStatus.ok) {
      if(response.data["errorCode"] == 0) {
        return HttpResponse.fromJson(response.data["data"]);
      }
    }
    return response.data;
  }

  Future<dynamic> post(String url, {Map<String, dynamic>? params}) async {
    var response = await _dio.post(url, data: params);
    return response.data;
  }
 }



class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print('请求之前');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print('响应之前');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print('错误之前${err.message}', );
    }
    super.onError(err, handler);
  }
}