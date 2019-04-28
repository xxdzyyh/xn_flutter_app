import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xn_flutter_app/views/home_page/banner_entity.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';
import 'package:xn_flutter_app/uibuild/xnscale.dart';

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
      height: ScreenUtil.getInstance().setHeight(91),
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
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(7), 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  widget.entity.img,
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
      height: ScreenUtil().setHeight(90),
      child: Padding(
        padding: EdgeInsets.fromLTRB(XNScale.width(15), 0,
            ScreenUtil().setWidth(15), ScreenUtil().setHeight(20)),
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1.0, 1.0),
                    blurRadius: 5.0)
              ]),
          child: Container(
            color: Colors.white,
            child: GestureDetector(
              onTap: () {
                print("点击了banner");
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
