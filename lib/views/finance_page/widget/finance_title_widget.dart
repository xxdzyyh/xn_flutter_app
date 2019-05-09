import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';
import 'package:xn_flutter_app/uibuild/xnscale.dart';
import 'package:xn_flutter_app/views/finance_page/model/finance_entity.dart';

class FinanceTitleWidget extends StatelessWidget {
  final FinanceItemEntity itemEntity;
  FinanceTitleWidget({Key key, this.itemEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: XNScale.height(50),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: _getList(),
            ),
          ),
          Container(
            color: xn_line_color,
            height: 1.0,
          )
        ],
      ),
    );
  }

  List<Widget> _getList() {
    List<Widget> list = List();
    double titleLeftPadding = 10;
    if (itemEntity.newProduct == true) {
      list.add(Padding(
        padding: EdgeInsets.fromLTRB(XNScale.width(15), 0, 0, 0),
        child: Image.asset("assets/images/home_new_product_icon.png",
            width: XNScale.width(42), height: XNScale.width(15)),
      ));
      titleLeftPadding = 15;
    }

    list.add(Padding(
      padding: EdgeInsets.fromLTRB(XNScale.width(titleLeftPadding), 0, 0, 0),
      child: Text(
        "${itemEntity.title}",
        style: TextStyle(
          fontSize: XNScale.fontSize(14),
          color: xn_black_normal,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));

    list.add(Padding(
      padding: EdgeInsets.fromLTRB(XNScale.width(8), 0, 0, 0),
      child: Text(
        "${itemEntity.desc}",
        style: TextStyle(
          fontSize: XNScale.fontSize(12),
          color: xn_black_light,
        ),
      ),
    ));

    if(itemEntity.desc2 != null) {
      list.add(Expanded(
        child: Container(
            child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, XNScale.width(8), 0),
          child: Container(
              padding: EdgeInsets.fromLTRB(XNScale.width(4), XNScale.width(1),
                  XNScale.width(4), XNScale.width(1)),
              color: Color.fromARGB(70, 255, 68, 0),
              child: Text(
                "${itemEntity.desc2}",
                style: TextStyle(
                  fontSize: XNScale.fontSize(9),
                  color: xn_orange,
                ),
              )),
        ),
      ],
    ))));
    }
    
    return list;
  }
}
