import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';
import 'package:xn_flutter_app/uibuild/xnscale.dart';
import 'package:xn_flutter_app/views/finance_page/model/finance_entity.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:xn_flutter_app/views/finance_page/widget/finance_border_widget.dart';
import 'package:xn_flutter_app/router/application.dart';

class FinanceRecommondWidget extends StatelessWidget {
  final FinanceItemEntity itemEntity;
  FinanceRecommondWidget({Key key, this.itemEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: XNScale.height(184),
      color: Colors.white,
      child: _buildSwip(context),
    );
  }

  Widget _buildSwip(BuildContext context) {
    return Swiper(
      onTap: (int index) {
        FinanceProductEntity product = itemEntity.products[index];
        Application.router.navigateTo(context, handle(product.detailUrl));
      },
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.fromLTRB(0, XNScale.height(15), 0, XNScale.height(5)),
          child: Container(
            color: Colors.white,
            child: FinanceBorderWidget(
              child: FinanceRecommondItemWidget(productEntity:itemEntity.products[index]),
            ),
          ),
        );
      },
      loop: false,
      outer: true,
      itemCount: itemEntity.products.length,
      viewportFraction: 0.81,
      scale: 0.85,
      index: itemEntity.products.length >= 3 ? 1 : 0,
      pagination: SwiperPagination(
        margin: EdgeInsets.fromLTRB(0, XNScale.height(7), 0, XNScale.height(12)),
          builder: DotSwiperPaginationBuilder(
            activeColor: Color(0x25828282),
            color: Color(0x10828282),
            size: XNScale.width(5),
            activeSize: XNScale.width(5)
          ),
        ),
    );
  }

}

class FinanceRecommondItemWidget extends StatelessWidget {

  final FinanceProductEntity productEntity;
  FinanceRecommondItemWidget({Key key, this.productEntity}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _buildColumn(),
    );
  }

List<Widget> _buildColumn() {
  List<Widget> list = List();
  list.add(
    Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Image.asset(
          "assets/images/finance_netcredit_recommenditemtopview.png",
          height: XNScale.height(24),
          fit: BoxFit.fitWidth,
        ),
        Text(
          "- ${productEntity.banner} -",
          style: TextStyle(
            fontSize: XNScale.fontSize(10),
            color: Colors.white,
          )
        )
      ],
    )
  );

  list.add(
    Padding(
      padding: EdgeInsets.fromLTRB(XNScale.width(19), XNScale.height(15), 0, 0),
      child: Text(
        "${productEntity.typeText}",
        style: TextStyle(
          fontSize: XNScale.fontSize(14),
          color: xn_black_normal,
        ),
      ),
    )
  );

  list.add(
    Padding(
      padding: EdgeInsets.fromLTRB(XNScale.width(19), XNScale.height(13), 0, 0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: XNScale.width(143),
            child: _getRateWidget(productEntity),
          ),
          Text(
            "${productEntity.termRange}",
            style: TextStyle(
              fontSize: XNScale.fontSize(14),
              color: xn_black_normal,
            ),
          )
        ],
      ),
    )
  );

  list.add(
    Padding(
      padding: EdgeInsets.fromLTRB(XNScale.width(19), XNScale.height(5), 0, 0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: XNScale.width(143),
            child: Text(
            "${productEntity.annualRateText}",
            style: TextStyle(
              fontSize: XNScale.fontSize(10),
              color: xn_black_light,
            ),
          ),
          ),
          Text(
            "${productEntity.termAndTransferDesc}",
            style: TextStyle(
              fontSize: XNScale.fontSize(10),
              color: xn_black_light,
            ),
          )
        ],
      ),
    )
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
