import 'package:flutter/material.dart';
import 'package:xn_flutter_app/views/home_page/banner_entity.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';
import 'package:xn_flutter_app/uibuild/xnscale.dart';
import 'package:xn_flutter_app/router/application.dart';

class HomeEntriesPage extends StatefulWidget {
  final HomePageEntity homeEntity;
  HomeEntriesPage({Key key, this.homeEntity}) : super(key: key);

  @override
  _HomeEntriesPageState createState() => _HomeEntriesPageState();
}

class _HomeEntriesPageState extends State<HomeEntriesPage> {
  List<EntriesEntity> _list;

  @override
  void initState() {
    _list = widget.homeEntity.entries;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: XNScale.height(90),
      color: Colors.white,
      child: Row(
        children: _getItems(),
      ),
    );
  }

  List<HomeEntryItem> _getItems() {
    List<HomeEntryItem> result = List();
    for (int i = 0; i < _list.length; i++) {
      result.add(HomeEntryItem(entity: _list[i]));
    }
    return result;
  }
}

class HomeEntryItem extends StatefulWidget {
  final EntriesEntity entity;
  HomeEntryItem({Key key, this.entity}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<HomeEntryItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
          onTap: () {
            print("点击了入口 ${widget.entity.title}");
            Application.push(context, widget.entity.url);
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, XNScale.height(13), 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  widget.entity.img,
                  width: XNScale.width(44),
                  height: XNScale.height(44),
                ),
                Text(
                  widget.entity.title,
                  style: TextStyle(
                    fontSize: XNScale.fontSize(12),
                    color: xn_black_normal,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class HomeBannerPage extends StatefulWidget {
  final HomePageEntity homeEntity;
  HomeBannerPage({Key key, this.homeEntity}) : super(key: key);

  @override
  _HomeBannerPageState createState() => _HomeBannerPageState();
}

class _HomeBannerPageState extends State<HomeBannerPage> {
  List<BannerEntity> _list;
  BannerEntity _banner;

  @override
  void initState() {
    _list = widget.homeEntity.banners;
    if (_list.length > 0) {
      _banner = _list[0];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: XNScale.height(90),
      child: Padding(
        padding: EdgeInsets.fromLTRB(XNScale.width(15), XNScale.height(2),
            XNScale.width(15), XNScale.height(20)),
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[300],
                    offset: Offset(1.0, 1.0),
                    blurRadius: 5.0)
              ]),
          child: Container(
            color: Colors.white,
            child: GestureDetector(
              onTap: () {
                Application.push(context, _banner.url);
              },
              child: Image.network(
                _banner.imgUrl,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*





*/
