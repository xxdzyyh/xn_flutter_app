import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'package:xn_flutter_app/bloc/bloc_provider.dart';

class XNWebView extends StatefulWidget {
  final String title;
  final String url;
  XNWebView({Key key, @required this.url, this.title}) : super(key: key);

  @override
  _XNWebViewState createState() => _XNWebViewState();
}

class _XNWebViewState extends State<XNWebView> {

  WebViewController _controller;
  final XNWebViewBLoc _bloc = XNWebViewBLoc();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: _buildNavi(),
        child: SafeArea(
          child: WebView(
            initialUrl: widget.url,
            //JS执行模式 是否允许JS执行
            javascriptMode: JavascriptMode.unrestricted,
            //webview 创建完成后调用
            onWebViewCreated: (WebViewController controller) {
              _controller = controller;
            },
            onPageFinished: (String url) {
              print('webview 成功加载: $url');

              _updateTitle();
            },
            navigationDelegate: (NavigationRequest request) {
              if(request.url.startsWith("xnoapp://xno.cn/")) {
                
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            } ,
            javascriptChannels: <JavascriptChannel>[].toSet(),
          ),
        ),
    );
  }

  void _updateTitle() {
    _controller.evaluateJavascript("document.title").then((result){
        _bloc.updateTitle(result);
      }
    );
  }

  Widget _buildTitle() {
    if(widget.title != null) {
      return  Text(widget.title);
    }
    return StreamBuilder(
            initialData: _bloc.choseTitle(null),
            stream: _bloc.outTitle,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot.data);
              return Text(_bloc.choseTitle(snapshot.data));
            },
          );
  }

  Widget _buildNavi() {
    return CupertinoNavigationBar(
          middle: _buildTitle(),
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
        );
  }

}

class XNWebViewBLoc implements BlocBase {

  StreamController _ctl = StreamController.broadcast();
  Stream get outTitle => _ctl.stream;

  String _loadingTitle = "正在加载…";
  String _lastTitle;
  bool _hasShowLoading = false;

  XNWebViewBLoc() {
    _lastTitle = _loadingTitle;
  }

  String choseTitle(String title) {
    if(title == null) {
      return _loadingTitle;
    }
    else {
      if(_hasShowLoading && title == _loadingTitle) {
        return _lastTitle;
      }
      return title;
    }
  }

  void updateTitle(String title) {
    _lastTitle = title;
    _hasShowLoading = true;
    _ctl.sink.add(title);
  }

  void dispose() {
    _ctl.close();
  }
}
