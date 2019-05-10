import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';

class EmptyPage extends StatefulWidget {
  @override
  _EmptyPageState createState() => _EmptyPageState();
}

class _EmptyPageState extends State<EmptyPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("404"),
        leading: CupertinoButton(
          padding: EdgeInsets.all(0),
          child: Image.asset("assets/images/default_back_normal.png",
            scale: 1.0,
            width: 11,
            height: 20,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      child: Center(
        child: Text('暂无内容'),
      ),
    );
  }
}