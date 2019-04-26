import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';

BaseOptions options = new BaseOptions(
  baseUrl: "https://m.xiaoniu88.com:443/mobile/",
  connectTimeout: 4000,
  receiveTimeout: 4000,
  headers: {
    HttpHeaders.userAgentHeader: "XiaoNiu-App-IOS-Flutter",
    HttpHeaders.acceptCharsetHeader: "UTF-8",
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.acceptEncodingHeader: "gzip",
    "Xne": "lite"
  },
);

var dio = new Dio(options);

class XNHttpClient {
  static Future get(String url, {Map<String, dynamic> params}) async {
    var response = await dio.get(url, queryParameters: params);
    return response.data;
  }

  static Future post(String url, Map<String, dynamic> params) async {
    var response = await dio.post(url, queryParameters: params);
    return response.data;
  }
}
