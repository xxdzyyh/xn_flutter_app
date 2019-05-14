import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';
import 'package:xn_flutter_app/uibuild/xnscale.dart';
import 'package:xn_flutter_app/views/my_page/account_vm.dart';
import 'package:xn_flutter_app/views/my_page/xn_service_cell.dart';
import 'package:xn_flutter_app/uibuild/xnutils.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  double topPadding;
  double bottomPadding;
  double screenWidth = 0;

  double _backImageX = 0;
  double _backImageY = 0;
  double _backImageHeight = 0;
  double _backImageWidth = 0;

  var accountVM = XNAccoutVM();
  var _scrollController = TrackingScrollController();

  @override
  Widget build(BuildContext context) {

    if (screenWidth == 0) {
      topPadding = MediaQuery.of(context).padding.top;
      bottomPadding = MediaQuery.of(context).padding.bottom;
      screenWidth = MediaQuery.of(context).size.width;
      _backImageHeight = XNScale.height(115.0+topPadding+44.0);
      _backImageWidth = screenWidth;
    }

    return CupertinoPageScaffold(
//      navigationBar: CupertinoNavigationBar(
//        backgroundColor: Color(0x00000000),
//        actionsForegroundColor: Color(0x00000000),
//      ),
      child: Center(
        child: _setupBody(),
      ),
      backgroundColor: Colors.white,
    );
  }

  _setupBody() {

    Image image = Image.asset(
      "assets/images/account_head_back.png",
      fit: BoxFit.fill,
    );

    print("width = $_backImageWidth");
    print("height = $_backImageHeight");
    print("y = $_backImageY");
    print("x = $_backImageX");

    var notify = NotificationListener(onNotification: dataNotification,child:_setupListView(),);

    Stack stack = Stack(
      children: <Widget>[
        Positioned(child: image,top: _backImageY,left: _backImageX,width: _backImageWidth,height: _backImageHeight,),
        notify
    ],
    overflow: Overflow.visible,
    alignment: AlignmentDirectional.center,);

    return stack;
  }

  bool dataNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {

      var y = _scrollController.offset;
      var alpha = 0.0;

      if (y > 100) {
        alpha = 1;
      } else if (y > 0) {
        alpha = y / 100.0;
      }

      var height = XNScale.height(115.0+44+topPadding);

      if (y < 0) {
        _backImageY = 0;
        _backImageHeight = height - y;
        _backImageWidth = _backImageHeight/height*screenWidth;
        setState(() {

          _backImageX = -(_backImageWidth-screenWidth)/2.0;
          print(_backImageHeight);
        });

      } else {

        setState(() {
          _backImageX = 0;
          _backImageY = -y;
          _backImageHeight = height;
          _backImageWidth = screenWidth;
        });

      }

    }
    return true;
  }

  Widget _setupListView() {

    return ListView.builder
      (
      itemCount: 1+1+this.accountVM.groupCellModels.length+1+this.accountVM.singleItems.length + 1,
      itemBuilder: (context,i) {
        if (i == 0) {
          return _setupHeader();
        } else if (i == 1) {

          return Container(height: 10,color: Color(0xFFF4F4F4),);

        } else if (i<this.accountVM.groupCellModels.length+2) {

          List list = this.accountVM.groupCellModels[i-2];

          return _setupGroupCell(list);
        } else if (i==1+1+this.accountVM.groupCellModels.length) {

          return Container(height: 10,color: Color(0xFFF4F4F4),);

        } else if (i==3+this.accountVM.groupCellModels.length+this.accountVM.singleItems.length) {
          // 客服中心
          return XNServiceCell();
        } else {
          XNAccountSingleCellModel vm = this.accountVM.singleItems[i - 3 -
            this.accountVM.groupCellModels.length];

          return _setupSingleCell(vm);
        }
      },
      controller: _scrollController,
      physics: ScrollPhysics(),
      );
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

          Navigator.of(context).pushNamed("/xn_activity");

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
      color: Color.fromARGB(0, 0, 0, 0),
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
      width: 0.5,
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
      width: 0.5,
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
      color: Color.fromARGB(0, 0, 0, 0),);


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
      width: 0.5,
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