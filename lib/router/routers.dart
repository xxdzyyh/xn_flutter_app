
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './router_handler.dart';

class Routes {
  static String webViewPage = '/webview';

  static void configureRoutes(Router router) {
    router.notFoundHandler = widgetNotFoundHandler;
    router.define(webViewPage, handler: webViewPageHand);
  }
}
