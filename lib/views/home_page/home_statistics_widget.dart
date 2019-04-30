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
      color: Colors.blueGrey,
      height: XNScale.height(95),
    );
  }
}