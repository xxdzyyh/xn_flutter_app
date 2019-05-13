import 'package:fluro/fluro.dart';
import './routers.dart';
import 'package:flutter/material.dart';

String handle(String router) {
    if(router.startsWith("http") == true) {
      print(Uri.encodeComponent(router));
      return "${Routes.webViewStr}?url=${Uri.encodeComponent(router)}";
    }
    
    if(router.startsWith("xnoapp:") == true) {
      return "${Routes.notDefineStr}?path=${Uri.encodeComponent(router)}";
    }


    return router;
}


class Application {
  static Router router;

  static Future push(BuildContext context, String path) {
    return Application.router.navigateTo(context, handle(path), transition: TransitionType.native);
  }


}
