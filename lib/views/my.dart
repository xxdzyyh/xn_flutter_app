import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';
import 'package:xn_flutter_app/views/my_page/account_vm.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  var accountVM = XNAccoutVM()

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("我的"),
      ),
      child: Center(
        child: _setupListView(),
      ),
    );
  }


  Widget _setupListView() {

    return ListView.builder(
      itemCount: 1+this.accountVM.singleItems.length,
      itemBuilder: (context,i) {
        if (i == 0) {
          return _setupHeader();
        } else {
          XNAccountSingleCellModel vm = this.accountVM.singleItems[i-1];

          return Text(vm.title);
        }

      });
  }


  // head

  _setupNotLoginView() {

    Widget welcomeLabel = Text("注册送518元红包",style: TextStyle(fontSize: 14),);
    Widget tipsLabel = Text("越投入越美好",style: TextStyle(fontSize: 14));
    Widget loginButton = CupertinoButton(child: Text("登录/注册",style: TextStyle(fontSize: 14)), onPressed: (){
      print("登录/注册");
    });

    return Column(
      children: <Widget>[ welcomeLabel,
                          tipsLabel ,
                          loginButton],
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }

  _setupHeader() {

    return Column(children: <Widget>[_setupNotLoginView()],mainAxisAlignment: MainAxisAlignment.center,);
  }

}