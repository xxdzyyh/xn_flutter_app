import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';

BaseOptions options = new BaseOptions(
  baseUrl: "https://m.xiaoniu88.com:443/mobile/",
  connectTimeout: 4000,
  receiveTimeout: 4000,
  headers: {
    //需要获取当前版本
    HttpHeaders.userAgentHeader: "XiaoNiu-App-IOS-5.1.2",
    HttpHeaders.acceptCharsetHeader: "UTF-8",
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.acceptEncodingHeader: "gzip",
    "Xne": "lite"
  },
);

var dio = new Dio(options);

class XNHttpClient {
  static Future get(String url, {Map<String, dynamic> params}) async {
    Response response =
        await dio.get(url, queryParameters: handleParamters(params));
    print(response.data);
    return response.data;
  }

  static Future post(String url, Map<String, dynamic> params) async {
    //开启打印日志
    dio.interceptors.add(LogInterceptor(responseBody: true));

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.findProxy = (uri) {
        //修改这个才能抓包 本机地址：端口
        return "PROXY 172.20.17.11:443";
      };
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      // Do something before request is sent
      return options;
    }, onResponse: (Response response) {
      // Do something with response data
      return response;
    }, onError: (DioError e) {
      // Do something with response error
      return e;
    }));

    Response response;
    try {
      response = await dio.post(url, data: handleParamters(params));
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
    }

    return {};
  }
}

Map handleParamters(params) {
  Map<String, dynamic> map = Map();
  map["body"] = params;

  Map<String, dynamic> headerMap = Map();
  headerMap["appCode"] = "512";
  headerMap["autoToken"] = "";
  headerMap["appType"] = "XNONLINE";
  headerMap["channelId"] = "AppStore";
  headerMap["deviceId"] = "39625cdcd719095decbfbb2bb2d26d03";
  headerMap["idfa"] = "2581957E-6618-401C-A6E8-4CACBD6FBB65";
  headerMap["network"] = "WIFI";
  headerMap["osType"] = "IOS";
  headerMap["phoneResolution"] = "828*1792";
  headerMap["phoneType"] = "x86_64";
  headerMap["systemVersion"] = "12.2";
  headerMap["version"] = "5.1.2";
  headerMap["versionCode"] = "5.1.2";

  map["header"] = headerMap;

  return map;
}
