import 'package:fluro/fluro.dart';

String handle(String router) {
    if(router.startsWith("http") == true) {
      print(Uri.encodeComponent(router));
      return "/webview?url=${Uri.encodeComponent(router)}";
    }
    


    return router;
}


class Application {
  static Router router;




}
