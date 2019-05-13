import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';
import 'package:xn_flutter_app/uibuild/xnscale.dart';
import 'package:xn_flutter_app/views/finance_page/model/finance_entity.dart';
import 'package:xn_flutter_app/views/finance_page/widget/finance_border_widget.dart';
import 'package:xn_flutter_app/router/application.dart';

class FinanceBProductWidget extends StatelessWidget {
  final FinanceProductEntity productEntity;
  FinanceBProductWidget({Key key, this.productEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Application.push(context, productEntity.detailUrl);
      },
      child: Container(
      color: Colors.white,
      height: XNScale.height(87),
      child: Column(
        children: _buildColumn(),
      ),
    ),
    );
  }

List<Widget> _buildColumn() {
    List<Widget> list = List();
    list.add(
      Padding(
        padding: EdgeInsets.fromLTRB(XNScale.width(15), XNScale.height(20), 0, 0),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: XNScale.width(205),
              child: _getRateWidget(productEntity),
            ),
            Text(
              "${productEntity.termRange}",
              style: TextStyle(
                fontSize: XNScale.fontSize(14),
                color: xn_black_normal,
                fontWeight: FontWeight.bold,
              )
            )
          ],
        ),
      ),
    );

    list.add(
      Padding(
        padding: EdgeInsets.fromLTRB(XNScale.width(15), XNScale.height(7), 0, 0),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: XNScale.width(205),
              child: Text(
              "${productEntity.annualRateText}",
              style: TextStyle(
                fontSize: XNScale.fontSize(10),
                color: xn_black_light,
              )
            ),
            ),
            Text(
              "${productEntity.termText}",
              style: TextStyle(
                fontSize: XNScale.fontSize(12),
                color: xn_black_light,
              )
            )
          ],
        ),
      ),
    );

    return list;
  }


Widget _getRateWidget(FinanceProductEntity entity) {
    Text text;
    List<TextSpan> list = List();
    TextSpan minSpan = TextSpan(
              text: "${entity.minAnnualRate.toDouble().toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: XNScale.fontSize(20),
                color: xn_orange_2,
                fontWeight: FontWeight.bold,
              ),
            );

    TextSpan maxSpan = TextSpan(
              text: "${entity.maxAnnualRate.toDouble().toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: XNScale.fontSize(20),
                color: xn_orange_2,
                fontWeight: FontWeight.bold,
              ),
            );
    TextSpan symbolSpan = TextSpan(
              text: "%",
              style: TextStyle(
                fontSize: XNScale.fontSize(12),
                color: xn_orange_2,
              ),
            );

    TextSpan addSpan = TextSpan(
              text: "+",
              style: TextStyle(
                fontSize: XNScale.fontSize(12),
                color: xn_orange_2,
              ),
            );

    TextSpan toSpan = TextSpan(
              text: "${entity.betweenAnnualRateText}",
              style: TextStyle(
                fontSize: XNScale.fontSize(12),
                color: xn_orange_2,
              ),
            );

    list.add(minSpan);
    list.add(symbolSpan);

    if (entity.maxAnnualRate != entity.minAnnualRate) {
      list.add(toSpan);
      list.add(maxSpan);
      list.add(symbolSpan);
    }
    if(entity.extraAnnualRate != null && entity.extraAnnualRate > 0) {
      list.add(addSpan);
      TextSpan extraSpan = TextSpan(
              text: "${entity.extraAnnualRate.toDouble().toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: XNScale.fontSize(20),
                color: xn_orange_2,
                fontWeight: FontWeight.bold,
              ),
            );
        list.add(extraSpan);
        list.add(symbolSpan);
    }

    text = Text.rich(
        TextSpan(
          children: list,
        ),
      );
    return text;
  }
  
}