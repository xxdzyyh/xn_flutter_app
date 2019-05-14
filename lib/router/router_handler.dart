import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../component/empty_view.dart';
import '../component/xn_webview.dart';
import '../component/notdefine_view.dart';
import '../views/my_page/xn_activity_page.dart';

var widgetNotFoundHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return EmptyPage();
});

var notDefinePageHand = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String path = params["path"]?.first;
      return XNNotDefinePage(path: path,);
    }
);

var webViewPageHand = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params['title']?.first;
  String url = params['url']?.first;
  return XNWebView(title: title, url: url);
});

var widgetActivityHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return XNActivityPage();
    });
