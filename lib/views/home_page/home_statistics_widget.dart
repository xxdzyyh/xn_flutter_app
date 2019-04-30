import 'package:flutter/material.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';
import 'package:xn_flutter_app/uibuild/xnscale.dart';
import 'package:xn_flutter_app/views/home_page/banner_entity.dart';

class HomeStatisticsWidget extends StatefulWidget {
  final HomePageEntity homeEntity;
  HomeStatisticsWidget({Key key, this.homeEntity}) : super(key: key);

  @override
  _HomeStatisticsWidgetState createState() => _HomeStatisticsWidgetState();
}

class _HomeStatisticsWidgetState extends State<HomeStatisticsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: XNScale.height(95),
      child: Column(
        children: <Widget>[
          _getLine(),
          Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: HomeStatisticsItemWidget(
              title: "累计成交(元)",
              imgUrl: widget.homeEntity.statistics.investAmountIcon,
              desc: widget.homeEntity.statistics.totalInvestAmount,
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                child: HomeStatisticsItemWidget(
                  title: "累计注册人数(人)",
                  imgUrl: widget.homeEntity.statistics.registerCountIcon,
                  desc: widget.homeEntity.statistics.totalRegisterCount,
                ),
              ))
        ],
      )
        ],
      )
    );
  }


    Widget _getLine() {
    return Container(
      height: 1.0,
      color: xn_line_color,
    );
  }

}

class HomeStatisticsItemWidget extends StatefulWidget {
  final String title;
  final String desc;
  final String imgUrl;
  HomeStatisticsItemWidget({Key key, this.title, this.desc, this.imgUrl})
      : super(key: key);

  @override
  _HomeStatisticsItemWidgetState createState() =>
      _HomeStatisticsItemWidgetState();
}

class _HomeStatisticsItemWidgetState extends State<HomeStatisticsItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.fromLTRB(XNScale.width(10), XNScale.height(32), 0, 0),
          child: Row(
            children: <Widget>[
              Image.network(
                widget.imgUrl,
                width: XNScale.width(18),
                height: XNScale.height(18),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(XNScale.width(10), 0, 0, 0),
                child: Text(
                  widget.desc,
                  style: TextStyle(
                    fontSize: XNScale.fontSize(16),
                    color: xn_orange,
                  ),
                ),
              )
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(XNScale.width(38), 0, 0, 0),
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: XNScale.fontSize(12),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
