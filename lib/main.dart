import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:xn_flutter_app/views/finance.dart';
import 'package:xn_flutter_app/views/my.dart';
import 'package:xn_flutter_app/views/home.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

Map<int, Color> color = {};

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: MyHomePage(title: '小牛在线'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  static List tabData = [
    {"text": "首页", "icon": "assets/images/tabbar_item_home_normal.png", "activeIcon": "assets/images/tabbar_item_home_selected.png"},
    {"text": "项目", "icon": "assets/images/tabbar_item_ financial_normal.png", "activeIcon": "assets/images/tabbar_item_ financial_selected.png"},
    {"text": "我的", "icon": "assets/images/tabbar_item_account_normal.png", "activeIcon": "assets/images/tabbar_item_account_selected.png"}
  ];
  List<Widget> xnTabs = [];
  List<BottomNavigationBarItem> xnTabItems = [];


  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    for (int i = 0; i < tabData.length; i++) {
      var text = tabData[i]['text'];
      var icon = tabData[i]['icon'];
      var activeIcon = tabData[i]['activeIcon'];
      if (Platform.isIOS) {
        xnTabItems.add(BottomNavigationBarItem(
            title: Text(text),
            backgroundColor: Colors.red,
            activeIcon: Image.asset(
              activeIcon,
              width: 30,
              height: 30,
            ),
            icon: Image.asset(
              icon,
              width: 30,
              height: 30,
          )));
      } 
      if (Platform.isAndroid) {
        xnTabs.add(Tab(
          text: text,
          icon: Image.asset(
            icon,
            width: 30,
            height: 30,
          )));
      }
    }
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    //页面、字体适配
    ScreenUtil.instance = ScreenUtil(width: 320, height: 568)..init(context);
    ScreenUtil.instance = ScreenUtil(width: 320, height: 568, allowFontScaling: false)..init(context);
  
    var cupertino = CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: xnTabItems,
        activeColor: xn_orange,
        inactiveColor: xn_black_dark,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return HomePage();
                break;
              case 1:
                return FinancePage();
                break;
              case 2:
                return MyPage();
                break;
            }
          },
        );
      }

    );
    return cupertino;

    // var scaffold = Scaffold(
    //   appBar: AppBar(
    //     // Here we take the value from the MyHomePage object that was created by
    //     // the App.build method, and use it to set our appbar title.
    //     title: Text(widget.title),
    //   ),
    //   body: TabBarView(
    //     controller: controller,
    //     children: <Widget>[HomePage(), FinancePage(), MyPage()],
    //   ),
    //   bottomNavigationBar: Material(
    //     color: Colors.white,
    //     child: TabBar(
    //         controller: controller,
    //         indicatorColor: Theme.of(context).primaryColor,
    //         indicatorWeight: 3.0,
    //         labelColor: Theme.of(context).primaryColor,
    //         unselectedLabelColor: const Color(0xFF8E8E8E),
    //         tabs: xnTabs),
    //   ),
    // );
    // return scaffold;
  }
}
