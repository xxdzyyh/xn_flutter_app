import 'package:flutter/material.dart';
import 'dart:math';

Size size_35 = Size(320.0, 480.0);
Size size_40 = Size(320.0, 568.0);
Size size_47 = Size(375.0, 667.0);
Size size_55 = Size(414.0, 736.0);
Size size_58 = Size(375.0, 812.0);
Size size_61 = Size(414.0, 896.0);
Size size_65 = Size(414.0, 896.0);

//宽高、间距、字体缩放
class XNScale {

	static ScaleConfig _config;

	static config(BuildContext context, double designWidth, double designHeight) {
		_config = ScaleConfig()..init(context);
	}

  static width(double width) {
    return _config.setWidth(width).ceil().toDouble();
  }

  static height(double height) {
    return _config.setHeight(height).ceil().toDouble();
  }

  static fontSize(double fontSize) {
    return _config.minScale * fontSize.ceil().toDouble();
  }
}





//不要直接使用这个
class ScaleConfig {
	//设计稿的大小 默认320 568 即iphone5的尺寸
  final double designWidth;
  final double designHeight;

	double _screenWidth;
	double _screenHeight;

  ScaleConfig({this.designWidth = 320, this.designHeight = 568});

  void init(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
  }

	get scaleWidth => _screenWidth / designWidth;

  double getScaleHeight(){
		double height = _screenHeight;
		Size sizeCurrent = Size(_screenWidth, _screenHeight);
		if(sizeCurrent == size_35) {
			height = size_40.height;
		}
		if(sizeCurrent == size_58) {
			height = size_47.height;
		}
		if((sizeCurrent == size_61) || (sizeCurrent == size_65)) {
			height = size_55.height;
		}
		return _screenHeight / height;
	}

	double get minScale => scaleWidth > getScaleHeight() ? getScaleHeight() : scaleWidth;

	double setWidth(double width) => width * scaleWidth;

  double setHeight(double height) => height * getScaleHeight();

}

