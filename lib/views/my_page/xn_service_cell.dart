import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:xn_flutter_app/uibuild/xnscale.dart';import 'package:xn_flutter_app/uibuild/xnutils.dart';class XNServiceCell extends StatelessWidget {  @override  Widget build(BuildContext context) {    Row row = Row(      children: <Widget>[        imageNamed("icon_account_customerService",height: 14,width: 14),        Padding(padding: EdgeInsets.only(left: 7),child: Text("客服中心",style: TextStyle(fontSize: XNScale.fontSize(10)),),)],      mainAxisAlignment: MainAxisAlignment.center,      mainAxisSize: MainAxisSize.min,    );    var btn = OutlineButton(      onPressed: () {      },      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(XNScale.height(24.0)),side: BorderSide(color: Color(0xFF878787),width: 0.5)),      child: row,      splashColor: Color.fromARGB(0, 0, 0, 0),      textColor: Color(0xFF222222),      color: Color(0xFF878787),    );    return Container(      height: XNScale.height(60.0),      width: MediaQuery.of(context).size.width,      child: btn,      alignment: AlignmentDirectional.center,      color: Color(0xFFF4F4F4),    );  }}