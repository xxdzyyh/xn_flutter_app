import 'dart:async';
import 'package:xn_flutter_app/bloc/bloc_provider.dart';
import 'package:xn_flutter_app/network/xn_http_client.dart';
import 'package:xn_flutter_app/views/finance_page/model/finance_entity.dart';

class FinanceBloc implements BlocBase {

  StreamController _syncController = StreamController.broadcast();
  Stream get outList => _syncController.stream;

  Future sendRequest() async {
    //main/product.json
    var response = await XNHttpClient.post("main/product.json", null);
    if(response["code"] == "M00000") {
      _syncController.sink.add(FinanceListEntity.fromJson(response["data"]));
    }
    else {
      _syncController.sink.addError("error");
    }

  }

  FinanceBloc() {
    sendRequest();
  }


  void dispose() {
    _syncController.close();
  }

}
