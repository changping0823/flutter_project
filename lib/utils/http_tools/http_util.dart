import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'http_response.dart';
import 'package:html/parser.dart' show parse;

const String baseUrl = 'https://www.wanandroid.com';
class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  late Dio _dio;
  late BaseOptions _baseOptions;

  // 3. 公共的、静态的访问点（全局访问点）
  static HttpUtil get instance => _instance;

  HttpUtil._internal() {
    _baseOptions = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'text/html; charset=utf-8'
      },
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
    );
    _dio = Dio(_baseOptions);
    /// 添加拦截器
    _dio.interceptors.add(CustomInterceptor());

    /// 添加缓存拦截器
    // dio.interceptors.add(CacheInterceptor());
  }


  Future<HttpResponse<T>> getPage<T>(String url, {Map<String, dynamic>? params, required T Function(Object?) fromJson}) async {
    var response = await _dio.get(url);
    if (response.statusCode == HttpStatus.ok) {
      // 如果返回的是字符串，先解码 HTML 实体
      var data = response.data;
      if (data is String) {
        data = parse(data).documentElement?.text ?? data;
      }
      if(response.data["errorCode"] == 0) {
        final jsonMap = response.data["data"];
        return HttpResponse.fromJson(jsonMap, fromJson);
      }
    }
    return response.data;
  }

  Future<T?> get<T>(String url, {Map<String, dynamic>? params, required T Function(Object?) fromJson}) async {
    var response = await _dio.get(url);
    if (response.statusCode == HttpStatus.ok) {
      // 如果返回的是字符串，先解码 HTML 实体
      var data = response.data;
      if (data is String) {
        data = parse(data).documentElement?.text ?? data;
      }
      if(response.data["errorCode"] == 0) {
        // 使用转换函数解析data
        return fromJson(response.data['data']);
      }
    }
    return response.data;
  }

  Future<HttpResponse<T>> post<T>(String url, {Map<String, dynamic>? params, required T Function(Object?) fromJson}) async {
    var response = await _dio.post(url, data: params);
    return _handleResponse(response, fromJson: fromJson);
  }

  _handleResponse<T>(Response response, {required T Function(Object?) fromJson}) {
    if (response.statusCode == HttpStatus.ok) {
      // 如果返回的是字符串，先解码 HTML 实体
      var data = response.data;
      if (data is String) {
        data = parse(data).documentElement?.text ?? data;
      }
      if(response.data["errorCode"] == 0) {
        final jsonMap = json.decode(response.data["data"]) as Map<String, dynamic>;
        return HttpResponse.fromJson(jsonMap, fromJson);
      }
    }
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

// HttpManager httpManager = HttpUtil();

HttpUtil get HttpManager => HttpUtil.instance;