import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:xn_flutter_app/views/home_page/banner_entity.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:xn_flutter_app/component/xn_webview.dart';
import 'package:xn_flutter_app/uibuild/xnscale.dart';

class HomeBanner extends StatefulWidget {
  final HomePageEntity homeEntity;
  HomeBanner({Key key, this.homeEntity}) : super(key: key);

  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  List<HomeAdEntity> _list;
  @override
  void initState() {
    _list = widget.homeEntity.extData.adImages;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: XNScale.height(150),
      color: Colors.white,
      child: Swiper(
        index: 0,
        onIndexChanged: (value) {
        },
        onTap: (int index) {
          print("点击了第$index个banner");
          Navigator.of(context, rootNavigator: true)
              .push(CupertinoPageRoute(builder: (BuildContext context) {
            return XNWebView(url: _list[index].href);
          })
		      );
          
        },
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            _list[index].url,
            fit: BoxFit.fill,
          );
        },
        itemCount: _list.length,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeColor: Colors.white,
            color: Color(0x80FFFFFF),
            size: XNScale.width(5),
            activeSize: XNScale.width(5)
          ),
        ),
      ),
    );
  }
}
