/*图片放在根目录下的images文件夹里*/import 'package:flutter/cupertino.dart';import 'xncolor.dart';imageNamed(String imageName,{double height, double width}) {  return Image.asset("assets/images/$imageName.png",height: height,width: width);}divider() {  return Container(    height: 0.0,    margin: EdgeInsetsDirectional.only(start: 0),    decoration: BoxDecoration(      border: Border(        bottom: BorderSide(color: xn_split_color,width: 0.5),      ),    ),  );}