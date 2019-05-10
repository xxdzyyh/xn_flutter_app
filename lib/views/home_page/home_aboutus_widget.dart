import 'package:flutter/material.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';
import 'package:xn_flutter_app/uibuild/xnscale.dart';
import 'package:xn_flutter_app/views/home_page/banner_entity.dart';
import 'package:xn_flutter_app/router/application.dart';

class HomeAboutUsWidget extends StatefulWidget {
  final HomePageEntity homeEntity;
  HomeAboutUsWidget({Key key, this.homeEntity}) : super(key: key);
  @override
  _HomeAboutUsWidgetState createState() => _HomeAboutUsWidgetState();
}

class _HomeAboutUsWidgetState extends State<HomeAboutUsWidget> {
  List<AboutUsEntity> _list;

  @override
  void initState() {
    _list = widget.homeEntity.aboutUs;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: _list.length * XNScale.height(117) + 1,
        child: Column(
          children: <Widget>[
            _getLine(),
            Expanded(
              child: Column(
                children: _getAboutsItems(),
              ),
            )
          ],
        ));
  }

  Widget _getLine() {
    return Container(
      height: 1.0,
      color: xn_line_color,
    );
  }

  List<Widget> _getAboutsItems() {
    List<Widget> itemList = List();
    for (int i = 0; i < _list.length; i++) {
      HomeAboutUsItemWidget item = HomeAboutUsItemWidget(
        aboutUsEntity: _list[i],
      );
      itemList.add(item);
      if (i < _list.length - 1) {
        itemList.add(_getMidLine());
      }
    }
    return itemList;
  }

  Widget _getMidLine() {
    return Padding(
      padding: EdgeInsets.fromLTRB(XNScale.width(100), 0, 0, 0),
      child: Container(
        height: 1.0,
        color: xn_line_color,
      ),
    );
  }
}

class HomeAboutUsItemWidget extends StatefulWidget {
  final AboutUsEntity aboutUsEntity;
  HomeAboutUsItemWidget({Key key, this.aboutUsEntity}) : super(key: key);

  @override
  _HomeAboutUsItemWidgetState createState() => _HomeAboutUsItemWidgetState();
}

class _HomeAboutUsItemWidgetState extends State<HomeAboutUsItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Application.router.navigateTo(context, handle(widget.aboutUsEntity.url));
      },
      child: Container(
      height: XNScale.height(116),
      color: Colors.white,
      child: Row(
        children: _getRowWidget(),
      ),
    ),
    );
  }

  List<Widget> _getRowWidget() {
    List<Widget> widgetList = List();
    Padding left = Padding(
      padding: EdgeInsets.fromLTRB(XNScale.width(20), XNScale.height(32),
          XNScale.width(30), XNScale.height(32)),
      child: Image.network(
        widget.aboutUsEntity.imgUrl,
      ),
    );

    Expanded mid = Expanded(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, XNScale.height(17), 0, XNScale.height(10)),
            child: Row(
            children: <Widget>[
              Text(
                widget.aboutUsEntity.title,
                style: TextStyle(
                  fontSize: XNScale.fontSize(14),
                  color: xn_black_normal,
                ),
                
              )
            ],
          ),
          ),

          Row(
            children: <Widget>[
              Text(
            widget.aboutUsEntity.desc,
            maxLines: 3,
            style: TextStyle(
              fontSize: XNScale.fontSize(12),
              color: xn_black_light,
            ),
          )
            ],
          )
        ],
      ),
    );

    Padding right = Padding(
      padding: EdgeInsets.fromLTRB(0, 0, XNScale.width(15), 0),
      child: Image.asset(
        "assets/images/right_more.png",
        width: XNScale.width(10),
        height: XNScale.width(14),
        fit: BoxFit.fill,
      ),
    );

    widgetList.add(left);
    widgetList.add(mid);
    widgetList.add(right);

    return widgetList;
  }
}
