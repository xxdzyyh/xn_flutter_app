
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes {
  static String webViewStr = '/webview';
  static String notDefineStr = '/xn_app';

  static void configureRoutes(Router router) {
    router.notFoundHandler = widgetNotFoundHandler;
    router.define(webViewStr, handler: webViewPageHand);
    router.define(notDefineStr, handler: notDefinePageHand);
  }
  
}
