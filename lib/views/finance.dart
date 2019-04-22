import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinancePage extends StatefulWidget {
  @override
  _FinancePageState createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("项目",
          style: TextStyle(
            color: xn_black_normal,
            fontSize: ScreenUtil.getInstance().setSp(14),
          ),
        )
      ),
      child: Center(
        child: Text('哈哈'),
      ),
    );
  }
}
