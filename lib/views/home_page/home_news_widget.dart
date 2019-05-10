import 'package:flutter/material.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';
import 'package:xn_flutter_app/uibuild/xnscale.dart';
import 'package:xn_flutter_app/views/home_page/banner_entity.dart';
import 'package:xn_flutter_app/router/application.dart';

class HomeNewsWidget extends StatefulWidget {
  final HomePageEntity homeEntity;
  HomeNewsWidget({Key key, this.homeEntity}) : super(key: key);

  @override
  _HomeNewsWidgetState createState() => _HomeNewsWidgetState();
}

class _HomeNewsWidgetState extends State<HomeNewsWidget> {
  List<NewsBannerEntity> _list;
  @override
  void initState() {
    _list = widget.homeEntity.newsBanners;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: XNScale.height(125),
      child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, XNScale.height(10)),
          child: Container(
            color: Colors.white,
            child: _getListView(),
          )),
    );
  }

  Widget _getListView() {
    return ListView.builder(
      itemExtent: XNScale.width(190.0),
      scrollDirection: Axis.horizontal,
      itemCount: _list.length,
      padding:
          EdgeInsets.fromLTRB(XNScale.width(7.5), 0, XNScale.width(7.5), 0),
      itemBuilder: (context, index) {
        return HomeNewsItemWidget(newsBannerEntity: _list[index]);
      },
    );
  }
}

class HomeNewsItemWidget extends StatefulWidget {
  final NewsBannerEntity newsBannerEntity;
  HomeNewsItemWidget({Key key, this.newsBannerEntity}) : super(key: key);

  @override
  _HomeNewsItemWidgetState createState() => _HomeNewsItemWidgetState();
}

class _HomeNewsItemWidgetState extends State<HomeNewsItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(XNScale.width(7.5), XNScale.height(2),
          XNScale.width(7.5), XNScale.height(13)),
      child: GestureDetector(
        onTap: () {
          Application.router.navigateTo(context, handle(widget.newsBannerEntity.url));
        },
        child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey[300], offset: Offset(1.0, 1.0), blurRadius: 5.0)
        ]),
        child: Column(
          children: <Widget>[
            Image.network(
              widget.newsBannerEntity.imgUrl,
              height: XNScale.height(70),
              width: XNScale.width(190),
              fit: BoxFit.fill,
            ),
            Expanded(
              child: Center(
                child: Text(
                  widget.newsBannerEntity.title,
                  style: TextStyle(
                    color: xn_black_normal,
                    fontSize: XNScale.fontSize(12),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      ),
    );
  }
}
