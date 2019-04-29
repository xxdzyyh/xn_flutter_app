import 'package:flutter/material.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';
import 'package:xn_flutter_app/uibuild/xnscale.dart';
import 'package:xn_flutter_app/views/home_page/banner_entity.dart';

class HomeNewsWidget extends StatefulWidget {
  final HomePageEntity homeEntity;
  HomeNewsWidget({Key key, this.homeEntity}) : super(key: key);

  @override
  _HomeNewsWidgetState createState() => _HomeNewsWidgetState();
}

class _HomeNewsWidgetState extends State<HomeNewsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      height: XNScale.height(125),
    );
  }
}