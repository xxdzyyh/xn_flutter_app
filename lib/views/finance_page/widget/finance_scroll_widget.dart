import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';
import 'package:xn_flutter_app/uibuild/xnscale.dart';
import 'package:xn_flutter_app/views/finance_page/model/finance_entity.dart';
import 'package:xn_flutter_app/views/finance_page/widget/finance_border_widget.dart';
import 'package:xn_flutter_app/router/application.dart';

class FinanceScrollWidget extends StatelessWidget {

  final FinanceItemEntity itemEntity;
  FinanceScrollWidget({Key key, this.itemEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: XNScale.height(155),
        padding: EdgeInsets.fromLTRB(0, XNScale.height(10), 0, XNScale.height(15)),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemEntity.products.length,
          padding:
          EdgeInsets.fromLTRB(XNScale.width(10), 0, XNScale.width(10), 0),
          itemExtent: (MediaQuery.of(context).size.width - XNScale.width(35)) / 2.3,
          itemBuilder: (BuildContext context, int index) {
            return FinanceScrollItemWidget(productEntity: itemEntity.products[index],); 
          },
        ),
    );
  }


}

class FinanceScrollItemWidget extends StatelessWidget {

  final FinanceProductEntity productEntity;
  FinanceScrollItemWidget({Key key, this.productEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Application.router.navigateTo(context, handle(productEntity.detailUrl));
      },
      child: Container(
      padding: EdgeInsets.fromLTRB(XNScale.width(5), XNScale.width(5), XNScale.width(5), XNScale.width(5)),
      child: FinanceBorderWidget(
          child: Column(
            children: _buildColumn(),
          )
        ),
    ),
    );
  }

  List<Widget> _buildColumn() {
    List<Widget> list = List();
    list.add(
      Padding(
        padding: EdgeInsets.fromLTRB(0, XNScale.height(25), 0, 0),
        child: _getRateWidget(productEntity),
      ),
    );
    list.add(
      Padding(
        padding: EdgeInsets.fromLTRB(0, XNScale.height(7), 0, 0),
        child: Text(
          "${productEntity.annualRateText}",
          style: TextStyle(
            fontSize: XNScale.fontSize(10),
            color: xn_black_light,
          )
        ),
      ),
    );
    list.add(
      Padding(
        padding: EdgeInsets.fromLTRB(0, XNScale.height(16), 0, 0),
        child: Text(
          "${productEntity.termAndTransferDesc}",
          style: TextStyle(
            fontSize: XNScale.fontSize(10),
            color: Color(0xFF101010),
          )
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
                fontSize: XNScale.fontSize(18),
                color: xn_orange_2,
                fontWeight: FontWeight.bold,
              ),
            );

    TextSpan maxSpan = TextSpan(
              text: "${entity.maxAnnualRate.toDouble().toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: XNScale.fontSize(18),
                color: xn_orange_2,
                fontWeight: FontWeight.bold,
              ),
            );
    TextSpan symbolSpan = TextSpan(
              text: "%",
              style: TextStyle(
                fontSize: XNScale.fontSize(10),
                color: xn_orange_2,
              ),
            );

    TextSpan addSpan = TextSpan(
              text: "+",
              style: TextStyle(
                fontSize: XNScale.fontSize(14),
                color: xn_orange_2,
              ),
            );

    TextSpan toSpan = TextSpan(
              text: "-",
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
                fontSize: XNScale.fontSize(12),
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