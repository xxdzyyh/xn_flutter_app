import 'package:flutter/material.dart';
import 'package:xn_flutter_app/views/home_page/banner_entity.dart';
import 'package:xn_flutter_app/uibuild/xnscale.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';

class HomeTitle extends StatefulWidget {

  final title;
  HomeTitle({Key key, this.title}) : super(key: key);

  @override
  _HomeTitleState createState() => _HomeTitleState();
}

class _HomeTitleState extends State<HomeTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: XNScale.height(58.0),
      child: Column(
        children: <Widget>[
          _getLine(),
          Expanded(
            child: _getTitle(),
          ),

        ],
      ),
    );
  }

  Widget _getLine() {
    return Container(
      height: 1.0,
      color: xn_line_color,
    );
  }

  Widget _getTitle() {
    return Row(
      children: <Widget>[
        Container(
          color: xn_orange_2,
          width: XNScale.width(3),
          height: XNScale.height(18),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(XNScale.width(12), 0, 0, 0),
          child: Text(
          widget.title,
          style: TextStyle(
            fontSize: XNScale.fontSize(16),
            color: xn_black_deep,
            fontWeight: FontWeight.bold,
          ),
        ),
        )
      ],
    );
  }


}