import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class XNLoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
    width: 50.0,
    height: 50.0,
    child: SpinKitRing(
      color: Colors.orange,
      size: 30,
      lineWidth: 3,
    ),
  ));
  }
}

