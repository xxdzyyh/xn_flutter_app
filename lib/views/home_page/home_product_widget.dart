import 'package:flutter/material.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';
import 'package:xn_flutter_app/uibuild/xnscale.dart';
import 'package:xn_flutter_app/views/home_page/banner_entity.dart';

class HomeProductWidget extends StatefulWidget {
  final HomePageEntity homeEntity;
  HomeProductWidget({Key key, this.homeEntity}) : super(key: key);

  @override
  _HomeProductWidgetState createState() => _HomeProductWidgetState();
}

class _HomeProductWidgetState extends State<HomeProductWidget> {
  List<CategoryEntity> _list;

  @override
  void initState() {
    _list = widget.homeEntity.categories;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      height: _getContainerHeight(),
      child: Column(
        children: _getColumn(),
      ),
    );
  }

  List<Widget> _getColumn() {
    List<Widget> widgeList = List();
    if (_list.length >= 1) {
      widgeList.add(HomeProductItemWidget(
        categoryEntity: _list[0],
      ));
    }

    if(_list.length >= 3) {
      Expanded row = Expanded(
        child: Padding(
        padding: EdgeInsets.fromLTRB(XNScale.width(10), 0, XNScale.width(10), 0),
        child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          HomeProductItemMoreWidget(categoryEntity: _list[1],),
          HomeProductItemMoreWidget(categoryEntity: _list[2],),
        ],
      ),
      ),
      );
      widgeList.add(row);
    }


    return widgeList;
  }

  double _getContainerHeight() {
    if (_list.length <= 1) {
      return XNScale.height(114.0 + 10);
    }
    if (_list.length > 1) {
      return XNScale.height(264.0);
    }
    return 0.0;
  }
}

class HomeProductItemWidget extends StatefulWidget {
  final CategoryEntity categoryEntity;
  HomeProductItemWidget({Key key, this.categoryEntity}) : super(key: key);

  @override
  _HomeProductItemWidgetState createState() => _HomeProductItemWidgetState();
}

class _HomeProductItemWidgetState extends State<HomeProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: XNScale.height(124),
        color: Colors.orange,
        child: Padding(
          padding: EdgeInsets.fromLTRB(XNScale.width(15), XNScale.height(2),
              XNScale.width(15), XNScale.height(8)),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 1.0),
                      blurRadius: 5.0)
                ]),
            child: Container(
              color: Colors.red,
            ),
          ),
        ));
  }
}

class HomeProductItemMoreWidget extends StatefulWidget {
  final CategoryEntity categoryEntity;
  HomeProductItemMoreWidget({Key key, this.categoryEntity}) : super(key: key);
  @override
  _HomeProductItemMoreWidgetState createState() =>
      _HomeProductItemMoreWidgetState();
}

class _HomeProductItemMoreWidgetState extends State<HomeProductItemMoreWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.red,
        height: XNScale.height(115),
        child: Padding(
          padding: EdgeInsets.fromLTRB(XNScale.width(5), XNScale.height(2),
              XNScale.width(5), XNScale.height(10)),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 1.0),
                      blurRadius: 5.0)
                ]),
            child: Container(
              color: Colors.red,
            ),
          ),
        )
        ),
    );
  }
}
