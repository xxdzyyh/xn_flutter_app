import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';
import 'package:xn_flutter_app/uibuild/xnscale.dart';

typedef XNErrorViewCallBack = void Function();

class XNErrorView extends StatefulWidget {
  final XNErrorViewCallBack callBack;
  XNErrorView({Key key, this.callBack}): super(key: key);

  @override
  _XNErrorViewState createState() => _XNErrorViewState();
}

class _XNErrorViewState extends State<XNErrorView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.callBack,
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/loading_error.png",
                width: 108,
                height: 113,
              ),

              Text(
                "网络异常，点击屏幕重试",
                style: TextStyle(
                  fontSize: XNScale.fontSize(13),
                  color: xn_black_light,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}