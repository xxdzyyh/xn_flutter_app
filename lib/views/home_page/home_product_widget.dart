import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
      color: Colors.white,
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

    if (_list.length >= 3) {
      Expanded row = Expanded(
        child: Padding(
          padding:
              EdgeInsets.fromLTRB(XNScale.width(10), 0, XNScale.width(10), 0),
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              HomeProductItemMoreWidget(
                categoryEntity: _list[1],
              ),
              HomeProductItemMoreWidget(
                categoryEntity: _list[2],
              ),
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
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(XNScale.width(15), XNScale.height(2),
              XNScale.width(15), XNScale.height(8)),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[300],
                      offset: Offset(1.0, 1.0),
                      blurRadius: 5.0)
                ]),
            child: Container(
              color: Colors.white,
              child: _getContent(),
            ),
          ),
        ));
  }

  Widget _getContent() {
    return Padding(
      padding: EdgeInsets.fromLTRB(XNScale.width(12), 0, XNScale.width(0), 0),
      child: Stack(
        children: <Widget>[
          Container(color: Colors.white),
          _getTitle(widget.categoryEntity),
          Positioned(
            top: XNScale.height(54),
            child: _getRateWidget(widget.categoryEntity),
          ),
          Positioned(
            left: XNScale.width(151),
            top: XNScale.height(54),
            child: Text(
              "${widget.categoryEntity.desc}",
              style: TextStyle(
                fontSize: XNScale.fontSize(14),
                color: xn_black_normal,
              ),
            ),
          ),
          Positioned(
            top: XNScale.height(82),
            child: Text("${widget.categoryEntity.annualRateText}",
                style: TextStyle(
                  fontSize: XNScale.fontSize(10),
                  color: xn_black_light,
                )),
          ),
          Positioned(
            left: XNScale.width(151),
            top: XNScale.height(82),
            child: Text("锁定期",
                style: TextStyle(
                  fontSize: XNScale.fontSize(10),
                  color: xn_black_light,
                )),
          )
        ],
      ),
    );
  }

  Widget _getRateWidget(CategoryEntity entity) {
    Text text;
    if (entity.maxAnnualRate == entity.minAnnualRate) {
      text = Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "${entity.minAnnualRate}",
              style: TextStyle(
                fontSize: XNScale.fontSize(18),
                color: xn_orange_2,
              ),
            ),
            TextSpan(
              text: "%",
              style: TextStyle(
                fontSize: XNScale.fontSize(12),
                color: xn_orange_2,
              ),
            ),
          ],
        ),
      );
    }

    return text;
  }
}

Widget _getTitle(CategoryEntity entity) {
  List<Widget> list = List();
  list.add(Text(
    "${entity.typeText}",
    style: TextStyle(
      fontSize: XNScale.fontSize(14),
      color: xn_black_deep,
      fontWeight: FontWeight.bold,
    ),
  ));
  if (entity.newProduct == true) {
    list.add(Padding(
      padding: EdgeInsets.fromLTRB(XNScale.width(6), 0, 0, 0),
      child: Image.asset(
        "assets/images/home_new_product_icon.png",
        width: 42,
        height: 15,
      ),
    ));
  }

  return Positioned(
    top: XNScale.height(20),
    child: Row(
      children: list,
    ),
  );
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
          color: Colors.white,
          height: XNScale.height(125),
          child: Padding(
            padding: EdgeInsets.fromLTRB(XNScale.width(5), XNScale.height(2),
                XNScale.width(5), XNScale.height(8)),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[300],
                        offset: Offset(1.0, 1.0),
                        blurRadius: 5.0)
                  ]),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(XNScale.width(12), 0, 0, 0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                      ),
                      _getTitle(widget.categoryEntity),
                      Positioned(
                        top: XNScale.height(39),
                        child: Text(
                          "${widget.categoryEntity.desc}",
                          style: TextStyle(
                            color: xn_black_light,
                            fontSize: XNScale.fontSize(10),
                          ),
                        ),
                      ),
                      Positioned(
                        top: XNScale.height(64),
                        child: _getRateWidget(widget.categoryEntity),
                      ),
                      Positioned(
                        top: XNScale.height(83),
                        child: Text(
                          "${widget.categoryEntity.annualRateText}",
                          style: TextStyle(
                            color: xn_black_light,
                            fontSize: XNScale.fontSize(10),
                          ),

                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  Widget _getRateWidget(CategoryEntity entity) {
    Text text;
    if (entity.maxAnnualRate == entity.minAnnualRate) {
      text = Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "${entity.minAnnualRate}",
              style: TextStyle(
                fontSize: XNScale.fontSize(14),
                color: xn_orange_2,
              ),
            ),
            TextSpan(
              text: "%",
              style: TextStyle(
                fontSize: XNScale.fontSize(10),
                color: xn_orange_2,
              ),
            ),
          ],
        ),
      );
    } else {
      text = Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "${entity.minAnnualRate}",
              style: TextStyle(
                fontSize: XNScale.fontSize(14),
                color: xn_orange_2,
              ),
            ),
            TextSpan(
              text: "%",
              style: TextStyle(
                fontSize: XNScale.fontSize(10),
                color: xn_orange_2,
              ),
            ),
            _getMid(entity),
            TextSpan(
              text: "${entity.maxAnnualRate}",
              style: TextStyle(
                fontSize: XNScale.fontSize(14),
                color: xn_orange_2,
              ),
            ),
            TextSpan(
              text: "%",
              style: TextStyle(
                fontSize: XNScale.fontSize(10),
                color: xn_orange_2,
              ),
            ),
          ],
        ),
      );
    }

    return text;
  }

  TextSpan _getMid(CategoryEntity entity) {
    if (entity.betweenAnnualRateText == "-") {
      return TextSpan(
        text: entity.betweenAnnualRateText,
        style: TextStyle(
          fontSize: XNScale.fontSize(14),
          color: xn_orange_2,
        ),
      );
    } else {
      return TextSpan(
        text: entity.betweenAnnualRateText,
        style: TextStyle(
          fontSize: XNScale.fontSize(10),
          color: xn_black_deep,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }
}
