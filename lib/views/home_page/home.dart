import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:xn_flutter_app/network/xn_http_client.dart';
import 'dart:async';
import 'package:xn_flutter_app/views/home_page/banner_entity.dart';

GlobalKey<RefreshHeaderState> _headerKey = new GlobalKey<RefreshHeaderState>();
GlobalKey<EasyRefreshState> _easyRefreshKey = new GlobalKey<EasyRefreshState>();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _requestHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: _getNavigationBar(),
      child: Material(
        child: SafeArea(
          child: HomeBody(),
        ),
      ),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getRefresh(context);
  }
}

Widget _getRefresh(BuildContext context) {
  return EasyRefresh(
    key: _easyRefreshKey,
    behavior: ScrollOverBehavior(),
    child: _getListView(),
    refreshHeader: _getRefreshHeader(),
    onRefresh: () async {
      await new Future.delayed(const Duration(seconds: 3), () {});
    },
  );
}

Widget _getListView() {
  return ListView.builder(
    itemCount: 20,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text("哈哈"),
        onTap: () {
          print("点击一条 $index");
        },
      );
    },
  );
}

Widget _getNavigationBar() {
  return CupertinoNavigationBar(
    middle: Image.asset(
      "assets/images/home_nav_logo.png",
      width: 65,
      height: 14,
    ),
    trailing: CupertinoButton(
      padding: EdgeInsets.all(0),
      pressedOpacity: 0.9,
      child: SizedBox(
        child: Image.asset(
          "assets/images/home_message_icon.png",
          width: 20,
          height: 15,
        ),
      ),
      onPressed: () {
        print("点了");
      },
    ),
  );
}

Widget _getRefreshHeader() {
  return ClassicsHeader(
    refreshHeight: 50,
    key: _headerKey,
    refreshText: "下拉刷新",
    refreshReadyText: "松开刷新",
    refreshingText: "加载中...",
    refreshedText: "刷新完成",
    bgColor: xn_bg_color,
    textColor: Colors.black,
    isFloat: false,
  );
}

void _requestHome() async {
  var entries = [];
  var banners = [];
  var categories = [];
  var newsBanners = [];

  try {
    var response = await XNHttpClient.post("home.json", null);
    entries = response["data"]["entries"];
    banners = response["data"]["banners"];
    categories = response["data"]["categories"];
    newsBanners = response["data"]["newsBanners"];
    print(response);
    HomePageEntity homePageEntity = HomePageEntity.fromJson(response["data"]);
    print(homePageEntity);
  } catch (e) {
    print(e);
  }


  for (int i=0; i<banners.length; i++) {
    BannerEntity banner = BannerEntity.fromJson(banners[i]);
    print(banner);
  }


}