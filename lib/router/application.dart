import 'package:fluro/fluro.dart';
import './routers.dart';

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




}
