import 'package:json_annotation/json_annotation.dart';
part 'banner_entity.g.dart';

abstract class BaseEntity {
}

//创建一个实体类，并标注 @JsonSerializable() 
//添加属性，并添加构造方法
//通过@JsonKey 可以映射json中和实体类中的变量
//在类中调用
//   factory ClassName.fromJson(Map<String, dynamic> json) {
//   return _$ClassNameFromJson(json);
// }
// Map<String, dynamic> toJson() => _$ClassNameToJson(this);

//在flutter项目的根目录下运行 flutter packages pub run build_runner build
//会自动生成 ClassName.g.dart 文件 
//factory ?



@JsonSerializable()
class HomePageEntity {

  final ExtDataEntity extData;

  //广告banner
  final List<BannerEntity> banners;
  //入口
  final List<EntriesEntity> entries;
  //产品
  final List<CategoryEntity> categories;
  //新闻banner
  final List<NewsBannerEntity> newsBanners;
  //关于我们
  final List<AboutUsEntity> aboutUs;
  //总体数据
  final StatisticsEntity statistics;

  HomePageEntity({this.extData,this.banners, this.entries, this.categories, this.newsBanners, this.aboutUs, this.statistics});
  factory HomePageEntity.fromJson(Map<String, dynamic> json) {
    return _$HomePageEntityFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$HomePageEntityToJson(this);
  }
}

@JsonSerializable()
class BannerEntity {
  final String title;
  final String imgUrl;
  final String url;
  @JsonKey(name: "description")
  final String desc;
  BannerEntity({this.title, this.imgUrl, this.url, this.desc});
  factory BannerEntity.fromJson(Map<String, dynamic> json) {
    return _$BannerEntityFromJson(json);
  }
  Map<String, dynamic> toJson() => _$BannerEntityToJson(this);
}

@JsonSerializable()
class EntriesEntity {
  final String name;
  final String title;
  final String img;
  final String url;
  final bool htmlPage;
  
  EntriesEntity({this.name, this.title, this.img, this.url, this.htmlPage});

  factory EntriesEntity.fromJson(Map<String, dynamic> json) {
    return _$EntriesEntityFromJson(json);
  }
  Map<String, dynamic> toJson() => _$EntriesEntityToJson(this);
}

@JsonSerializable()
class CategoryEntity {
  @JsonKey(name: "ID")
  final String id;
  final int dataType;
  final bool newProduct;
  final String betweenAnnualRateText;
  final String termAndTransferDesc;
  final int status;
  final String statusText;
  final String type;
  final String typeText;
  @JsonKey(name: "description")
  final String desc;
  final String transDescription;
  final String annualRateText;
  final double minAnnualRate;
  final double maxAnnualRate;
  final String annualRatePrefix;
  final String annualRateSuffix;
  final double addRate;
  final String termText;
  final String addRateDesc;
  final String termUnit;
  final String termUnitText;
  final String url;

  CategoryEntity({this.id, this.dataType,this.newProduct, this.betweenAnnualRateText,
  this.termAndTransferDesc,this.status, this.statusText, this.type, this.typeText,
  this.desc, this.transDescription, this.annualRateText, this.minAnnualRate, 
  this.maxAnnualRate, this.annualRatePrefix, this.annualRateSuffix, this.addRate, this.termText,
  this.addRateDesc, this.termUnit, this.termUnitText, this.url
  });

  factory CategoryEntity.fromJson(Map<String, dynamic> json) {
    return _$CategoryEntityFromJson(json);
  }
  Map<String, dynamic> toJson() => _$CategoryEntityToJson(this);

}

@JsonSerializable()
class NewsBannerEntity {
  final String title;
  final String imgUrl;
  final String url;
  @JsonKey(name: "description")
  final String desc;

  NewsBannerEntity({this.title, this.imgUrl, this.url, this.desc});

    factory NewsBannerEntity.fromJson(Map<String, dynamic> json) {
    return _$NewsBannerEntityFromJson(json);
  }
  Map<String, dynamic> toJson() => _$NewsBannerEntityToJson(this);
}

@JsonSerializable()
class AboutUsEntity {
  final String title;
  final String imgUrl;
  final String url;
  @JsonKey(name: "description")
  final String desc;

    AboutUsEntity({this.title, this.imgUrl, this.url, this.desc});

    factory AboutUsEntity.fromJson(Map<String, dynamic> json) {
    return _$AboutUsEntityFromJson(json);
  }
  Map<String, dynamic> toJson() => _$AboutUsEntityToJson(this);
}

@JsonSerializable()
class StatisticsEntity {
  final String totalInvestAmount;
  final String totalRegisterCount;
  final String investAmountIcon;
  final String registerCountIcon;
    StatisticsEntity({this.totalInvestAmount, this.totalRegisterCount, this.investAmountIcon, this.registerCountIcon});

    factory StatisticsEntity.fromJson(Map<String, dynamic> json) {
    return _$StatisticsEntityFromJson(json);
  }
  Map<String, dynamic> toJson() => _$StatisticsEntityToJson(this);

}

@JsonSerializable()
class ExtDataEntity {
  final List<HomeAdEntity> adImages;
  final ToolskidDataEntity toolskid;
  final PopupDialogDataEntity popupdialog;

      ExtDataEntity({this.adImages, this.toolskid, this.popupdialog});

    factory ExtDataEntity.fromJson(Map<String, dynamic> json) {
    return _$ExtDataEntityFromJson(json);
  }
  Map<String, dynamic> toJson() => _$ExtDataEntityToJson(this);
}

@JsonSerializable()
class HomeAdEntity {
  final int id;
  final String href;
    final String url;
  final String content;

      HomeAdEntity({this.id, this.href, this.url, this.content});

    factory HomeAdEntity.fromJson(Map<String, dynamic> json) {
    return _$HomeAdEntityFromJson(json);
  }
  Map<String, dynamic> toJson() => _$HomeAdEntityToJson(this);

}

@JsonSerializable()
class ToolskidDataEntity {
  final String type;
  final String icon;
  final String url;
  final String title;

  ToolskidDataEntity({this.type, this.icon, this.url, this.title});

    factory ToolskidDataEntity.fromJson(Map<String, dynamic> json) {
    return _$ToolskidDataEntityFromJson(json);
  }
  Map<String, dynamic> toJson() => _$ToolskidDataEntityToJson(this);
}

@JsonSerializable()
class PopupDialogDataEntity {
  final int id;
  final String dialogtype;
  final String content;
  final String imgurl;
  final String title;

  PopupDialogDataEntity({this.id, this.dialogtype, this.content, this.imgurl, this.title});

    factory PopupDialogDataEntity.fromJson(Map<String, dynamic> json) {
    return _$PopupDialogDataEntityFromJson(json);
  }
  Map<String, dynamic> toJson() => _$PopupDialogDataEntityToJson(this);

}
