import 'package:flutter_screenutil/flutter_screenutil.dart';

//宽高、间距、字体缩放
class XNScale {
  static width(double width) {
    return ScreenUtil().setWidth(width);
  }

  static height(double height) {
    return ScreenUtil().setHeight(height);
  }

  static fontSize(double fontSize) {
    return ScreenUtil().setSp(fontSize);
  }
}
