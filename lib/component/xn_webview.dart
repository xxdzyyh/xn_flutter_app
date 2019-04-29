import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class XNWebView extends StatefulWidget {
  final String title;
  final String url;
  XNWebView({Key key, @required this.url, this.title}) : super(key: key);

  @override
  _XNWebViewState createState() => _XNWebViewState();
}

class _XNWebViewState extends State<XNWebView> {

  String _getTitle() {
    if(widget.title.length > 0) {
      return widget.title;
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
      appBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.all(0),
          child: Image.asset("assets/images/default_back_normal.png",
            scale: 1.0,
            width: 11,
            height: 20,
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
      ),

    );
  }
}
