import 'package:flutter/material.dart';
import 'package:xn_flutter_app/views/home_page/banner_entity.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBanner extends StatefulWidget {
  final HomePageEntity homeEntity;
  HomeBanner({Key key, this.homeEntity}): super(key: key);

  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {

  List<HomeAdEntity> _list;
  @override
  void initState() {
    _list =  widget.homeEntity.extData.adImages;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(130),
      color: Colors.white,
      child: Swiper(
        index: 0,
        onIndexChanged: (value) {
          print("这是啥");
        },

        onTap: (int index) {
              print("点击了第$index个banner");
        },
        itemBuilder: (BuildContext context,int index){
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
            size: ScreenUtil.getInstance().setWidth(5),
            activeSize: ScreenUtil.getInstance().setWidth(5),
          ),
        ),
      ),
    );
  }
}