import 'package:flutter/material.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';
import 'package:xn_flutter_app/uibuild/xnscale.dart';
import 'package:xn_flutter_app/views/home_page/banner_entity.dart';

class HomeProductWidget extends StatefulWidget {

  final HomePageEntity homeEntity;
  HomeProductWidget({Key key, this.homeEntity}) : super(key: key);

  @override
  _HomeProductWidgetState createState() => _HomeProductWidgetState();
}

class _HomeProductWidgetState extends State<HomeProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.greenAccent,
        height: XNScale.height(262),
    );
  }
}

class HomeProductItemWidget extends StatefulWidget {
  @override
  _HomeProductItemWidgetState createState() => _HomeProductItemWidgetState();
}

class _HomeProductItemWidgetState extends State<HomeProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}