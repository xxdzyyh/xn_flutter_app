import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';
import 'package:xn_flutter_app/uibuild/xnscale.dart';
import 'package:xn_flutter_app/views/finance_page/model/finance_entity.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:xn_flutter_app/views/finance_page/widget/finance_border_widget.dart';

class FinanceRecommondWidget extends StatelessWidget {
  final FinanceItemEntity itemEntity;
  FinanceRecommondWidget({Key key, this.itemEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: XNScale.height(184),
      color: Colors.white,
      child: _buildSwip(),
    );
  }

  Widget _buildSwip() {
    return Swiper(
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
    return Container(
      
    );
  }



}
