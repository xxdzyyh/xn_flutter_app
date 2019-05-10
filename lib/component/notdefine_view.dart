import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class XNNotDefinePage extends StatelessWidget {
  final String path;
  XNNotDefinePage({Key key, this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("功能暂未做"),
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
        child: Text('当前导航路径正确，但功能暂时未做。 \n\n 导航路径：$path'),
      ),
    );
  }

}