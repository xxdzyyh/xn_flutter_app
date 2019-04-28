import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xn_flutter_app/views/home_page/banner_entity.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';

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
      height: ScreenUtil.getInstance().setHeight(99),
      color: Colors.orange,
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
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
            widget.entity.img,
            ),
            Text(
              widget.entity.title,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(12),
                color: xn_black_normal,
              ),
            ),
          ],
      ),
        ),
    );
  }
}
