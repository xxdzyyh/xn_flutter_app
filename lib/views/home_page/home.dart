import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:xn_flutter_app/network/xn_http_client.dart';
import 'dart:async';
import 'package:xn_flutter_app/views/home_page/banner_entity.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xn_flutter_app/views/home_page/home_banner.dart';
import 'package:xn_flutter_app/views/home_page/home_entries.dart';


GlobalKey<RefreshHeaderState> _headerKey = new GlobalKey<RefreshHeaderState>();
GlobalKey<EasyRefreshState> _easyRefreshKey = new GlobalKey<EasyRefreshState>();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
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
  HomePageEntity _homePageEntity;

  @override
  void initState() {
    super.initState();
    _requestHome();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _getContent();
  }

  Widget _getContent() {
    if (_homePageEntity == null) {
      return _showLoading();
    } else {
      return _getRefresh(context);
    }
  }

  Future<HomePageEntity> _requestHome() async {
    try {
      var response = await XNHttpClient.post("home.json", null);
      HomePageEntity homePageEntity = HomePageEntity.fromJson(response["data"]);

      setState(() {
        _homePageEntity = homePageEntity;
      });

      return homePageEntity;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Widget _getRefresh(BuildContext context) {
    return EasyRefresh(
      key: _easyRefreshKey,
      behavior: ScrollOverBehavior(),
      child: _getListView(),
      refreshHeader: _getRefreshHeader(),
      onRefresh: () async {
        _requestHome();
      },
    );
  }

  Widget _getListView() {
    List<Widget> list = List();
    if(_homePageEntity.extData.adImages != null) {
      list.add(HomeBanner(homeEntity: _homePageEntity,));
    }
    if(_homePageEntity.entries !=null) {
      list.add(HomeEntriesPage(homeEntity: _homePageEntity,));
    }
    if(_homePageEntity.banners != null) {
      list.add(HomeBannerPage(homeEntity: _homePageEntity,));
    }


    return ListView(
      children: list,
    );
  }


}

Widget _showLoading() {
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
