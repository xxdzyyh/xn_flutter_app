import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';
import 'package:xn_flutter_app/uibuild/xnscale.dart';
import 'package:xn_flutter_app/views/my_page/account_vm.dart';


/*图片放在根目录下的images文件夹里*/
imageNamed(String imageName,{double height, double width}) {
  return Image.asset("assets/images/$imageName.png",height: height,width: width,);
}

divider() {

  return Container(
    height: 0.0,
    margin: EdgeInsetsDirectional.only(start: 0),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(color: xn_split_color),
      ),
    ),
  );
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  double topPadding;
  double bottomPadding;

  var accountVM = XNAccoutVM();

  @override
  Widget build(BuildContext context) {
    topPadding = MediaQuery.of(context).padding.top;
    bottomPadding = MediaQuery.of(context).padding.bottom;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("我的"),
      ),
      child: Center(
        child: _setupListView(),
      ),
      backgroundColor: Colors.white,
    );
  }


  Widget _setupListView() {

    return ListView.builder(
      itemCount: 1+this.accountVM.groupCellModels.length+this.accountVM.singleItems.length,
      itemBuilder: (context,i) {
        if (i == 0) {
          return _setupHeader();
        } else if (i<this.accountVM.groupCellModels.length+1) {

          List list = this.accountVM.groupCellModels[i-1];

          return _setupGroupCell(list);
        } else {
          XNAccountSingleCellModel vm = this.accountVM.singleItems[i-1-this.accountVM.groupCellModels.length];

          return _setupSingleCell(vm);
        }

      });
  }


  // head

  _setupNotLoginView() {

    Widget welcomeLabel = Text("注册送518元红包",style: TextStyle(fontSize: 14),);

    welcomeLabel = Text.rich(
        TextSpan(text: "注册送",
          style: TextStyle(fontSize: 14,color:Colors.white),
          children: <TextSpan>[
            TextSpan(text: '518',style: TextStyle(fontSize: 32,color: xn_orange),),
            TextSpan(text: "元",style: TextStyle(fontSize: 14,color:xn_orange)),
            TextSpan(text: "红包",style: TextStyle(fontSize: 14,color:Colors.white))
      ]),

    );

    Widget tipsLabel = Text("越投入越美好",style: TextStyle(fontSize: 12,color: Colors.white));

    Widget loginButton = SizedBox(
      height: XNScale.height(32),
      width: XNScale.width(110),
      child: OutlineButton(
        child: Text("登录/注册", style: TextStyle(fontSize: 14)),
        onPressed: (){
          print("登录/注册");
        },
        textColor: Colors.white,
        splashColor: xn_clear_color,
        borderSide: BorderSide(color: Colors.white),
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(XNScale.height(32)/2.0)),
      )
    );

    return Container(
      width: MediaQuery.of(this.context).size.width,
      height: XNScale.height(122+44+topPadding),
      child: Column(
        children: <Widget>[ welcomeLabel,
        Padding(padding: EdgeInsets.only(top: XNScale.height(5)),child: tipsLabel,) ,
        Padding(padding: EdgeInsets.only(bottom: XNScale.height(20.0+7.0),top: XNScale.height(20.0)),child: loginButton,)],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      color: Colors.green,
    );
  }

  _setupBalanceView() {

    Column left;
    Column right;

    var leftTitle = Padding(padding: EdgeInsets.only(left: 15),child:Text("网贷余额(元)",style: TextStyle(fontSize: 14,color: Color(0xFF222222),fontWeight: FontWeight.bold)));
    var leftTips = Padding(padding: EdgeInsets.only(left: 15),child:Text("--",style: TextStyle(fontSize: 14,color: Color(0xFF5F5F5F))));

    right = Column(children: <Widget>[leftTitle,leftTips],crossAxisAlignment: CrossAxisAlignment.center,);


    var rightTitle = Padding(padding: EdgeInsets.only(left: 15),child:Text("智盈余额(元)",style: TextStyle(fontSize: 14,color: Color(0xFF222222),fontWeight: FontWeight.bold)));
    var rightTips = Padding(padding: EdgeInsets.only(left: 15),child:Text("--",style: TextStyle(fontSize: 14,color: Color(0xFF5F5F5F))));

    left = Column(children: <Widget>[rightTitle,rightTips],crossAxisAlignment: CrossAxisAlignment.center,);

    var splitLine = Container(
      width: 1.0,
      height: XNScale.height(64),
      color: xn_split_color,
    );

    Row row;

    if (null != right) {
      row = Row(children: <Widget>[Expanded(child: left),splitLine,Expanded(child: right)],);
    } else {
      row = Row(children: <Widget>[left],);
    }

    return Column(children: <Widget>[row,divider()],);
  }

  _setupOperationView() {
    
    var withDrawButton = CupertinoButton(
      child: Text("提现",style: TextStyle(color: xn_orange,fontSize: 14),), 
      onPressed: null,
      minSize: 30,
      padding: EdgeInsets.all(0),
    );
    
    var rechargeButton = CupertinoButton(
      child: Text("充值",style: TextStyle(color: xn_orange,fontSize: 14),),
      onPressed: null,
      minSize: 30,
      padding: EdgeInsets.all(0),
    );

    var splitLine = Container(
      width: 1.0,
      height: XNScale.height(44),
      color: xn_split_color,
    );

    return Container(height: XNScale.height(44),child: Row(children: <Widget>[Expanded(child: withDrawButton) ,splitLine,Expanded(child: rechargeButton)],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      )
    );
  }

  _setupHeader() {

    var backgroundView = Container(
      height: XNScale.height((122.0 + 64.0 + 44.0 + 44 + this.topPadding)),
      width: MediaQuery.of(this.context).size.width,
      color: Colors.blue,);


    Stack stack = Stack(children: <Widget>[backgroundView,Column(children: <Widget>[_setupNotLoginView(),_setupBalanceView(),_setupOperationView()],)],
    alignment: AlignmentDirectional.topCenter);

    return stack;
  }

  Widget _setupGroupCell(List list) {

    Column left;
    Column right;

    if (list.length > 1) {

      XNAccountSingleCellModel model = list[1];

      var title = Padding(padding: EdgeInsets.only(left: 15),child:Text(model.title,style: TextStyle(fontSize: 14,color: Color(0xFF222222),fontWeight: FontWeight.bold)));
      var tips = Padding(padding: EdgeInsets.only(left: 15),child:Text(model.value,style: TextStyle(fontSize: 14,color: Color(0xFF5F5F5F))));

      right = Column(children: <Widget>[title,tips],crossAxisAlignment: CrossAxisAlignment.start,);

    }

    XNAccountSingleCellModel model = list[0];

    var title = Padding(padding: EdgeInsets.only(left: 15),child:Text(model.title,style: TextStyle(fontSize: 14,color: Color(0xFF222222),fontWeight: FontWeight.bold)));
    var tips = Padding(padding: EdgeInsets.only(left: 15),child:Text(model.value,style: TextStyle(fontSize: 14,color: Color(0xFF5F5F5F))));

    left = Column(children: <Widget>[title,tips],crossAxisAlignment: CrossAxisAlignment.start,);

    var splitLine = Container(
      width: 1.0,
      height: XNScale.height(50),
      color: xn_split_color,
    );

    Row row;

    if (null != right) {
       row = Row(children: <Widget>[Expanded(child: left),splitLine,Expanded(child: right)],);
    } else {
       row = Row(children: <Widget>[left],);
    }

    return Column(children: <Widget>[row,divider()],);
  }

  // Single Cell
  Widget _setupSingleCell(XNAccountSingleCellModel model) {

    var title = Padding(padding: EdgeInsets.only(left: 15),child: Text(model.title,style: TextStyle(fontSize: 14,color: Color(0xFF222222)),),);
    var tips = Expanded(child: Text(model.value,style: TextStyle(fontSize: 14,color: Color(0xFF9B9B9B)),textAlign: TextAlign.end,));
    var arrow = Padding(padding: EdgeInsets.only(right: 15,left: 5),child: imageNamed("right_more",width: 10,height: 14),);

    Column column = Column(children: <Widget>[SizedBox(height: 50,child: Row(children: <Widget>[title,Spacer(),tips,arrow],),),
    divider()],);

    return column;
  }


}