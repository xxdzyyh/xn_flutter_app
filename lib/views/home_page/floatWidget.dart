import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:xn_flutter_app/component/xn_webview.dart';

import 'package:flutter/material.dart' as prefix0;

///漂浮按钮尺寸
const double KFloatWidgetSize = 60.0;

///拖动按钮时距离屏幕边缘的间距
const double KFloatWidgetPadding = 0.0;

///漂浮按钮的圆角尺寸
const double KFloatWidgetRadius = 20.0;

//MediaQueryData.fromWindow(window).padding.top
//appBar.preferredSize.height;

class FloatWidget extends StatefulWidget {
  final Offset originOffset;
  final String imgUrl;
  final String clickUrl;
  FloatWidget({Key key, this.originOffset, this.imgUrl, this.clickUrl}) : super(key: key);

  @override
  _FloatWidgetState createState() => _FloatWidgetState();
}

class _FloatWidgetState extends State<FloatWidget> {
  Offset offset;
  double top;
  double bottom;

  @override
  void initState() {
    top = MediaQueryData.fromWindow(window).padding.top + 44;
    bottom = MediaQueryData.fromWindow(window).padding.bottom + 49;

    offset = Offset(widget.originOffset.dx - KFloatWidgetSize,
        widget.originOffset.dy - KFloatWidgetSize - top - bottom);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          double originX = (offset.dx + details.delta.dx) < KFloatWidgetPadding
              ? KFloatWidgetPadding
              : (offset.dx + details.delta.dx);
          originX = originX >
                  (MediaQuery.of(context).size.width -
                      KFloatWidgetSize -
                      KFloatWidgetPadding)
              ? (MediaQuery.of(context).size.width -
                  KFloatWidgetSize -
                  KFloatWidgetPadding)
              : originX;
          double originY = (offset.dy + details.delta.dy) < 0
              ? 0
              : (offset.dy + details.delta.dy);
          originY = originY >
                  (MediaQuery.of(context).size.height -
                      KFloatWidgetSize -
                      top -
                      bottom)
              ? (MediaQuery.of(context).size.height -
                  KFloatWidgetSize -
                  top -
                  bottom)
              : originY;
          setState(() {
            offset = Offset(originX, originY);
          });
        },
        onPanEnd: (details) {
          if (offset.dx <
              (MediaQuery.of(context).size.width / 2.0 - KFloatWidgetPadding)) {
            setState(() {
              offset = Offset(0, offset.dy);
            });
          } else {
            setState(() {
              offset = Offset(
                  MediaQuery.of(context).size.width -
                      KFloatWidgetSize -
                      KFloatWidgetPadding,
                  offset.dy);
            });
          }
        },
        child: GestureDetector(
          child: Image.network(
            widget.imgUrl,
            width: KFloatWidgetSize,
            height: KFloatWidgetSize,
          ),
          onTap: () {
            Navigator.of(context, rootNavigator: true)
              .push(CupertinoPageRoute(builder: (BuildContext context) {
            return XNWebView(url: widget.clickUrl);
          })
		      );
          },
        ),
      ),
    );
  }
}
