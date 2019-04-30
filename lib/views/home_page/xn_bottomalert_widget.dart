import 'package:flutter/material.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';
import 'package:xn_flutter_app/uibuild/xnscale.dart';

class XNBottomAlertWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: XNScale.height(57),
      color: xn_bg_color,
        child: Center(
          child: Text(
            "市场有风险，出借需谨慎",
            style: TextStyle(
              fontSize: XNScale.fontSize(12),
              color: xn_black_dark,
            )
          ),
        ),
    );
  }
}