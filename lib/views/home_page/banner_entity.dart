import 'package:json_annotation/json_annotation.dart';

part 'banner_entity.g.dart';

//创建一个实体类，并标注 @JsonSerializable() 
//通过@JsonKey 可以映射json中和实体类中的变量
//在flutter项目的根目录下运行 flutter packages pub run build_runner build
//factory ?

@JsonSerializable()
class HomePageEntity {
  final List<BannerEntity> banners;
  final List<EntriesEntity> entries;

  HomePageEntity({this.banners, this.entries});
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
  final String htmlPage;
  
  EntriesEntity({this.name, this.title, this.img, this.url, this.htmlPage});

  factory EntriesEntity.fromJson(Map<String, dynamic> json) {
    return _$EntriesEntityFromJson(json);
  }
  Map<String, dynamic> toJson() => _$EntriesEntityToJson(this);
}

class CategoryEntity {
  @JsonKey(name: "ID")
  final String id;
  final int dataType;
  final bool isNewProduct;
  final String betweenAnnualRateText;
  final String termAndTransferDesc;
  final String status;
  final String statusText;
  final String type;
  final String typeText;

  CategoryEntity({this.id, this.dataType, this.isNewProduct, this.betweenAnnualRateText,
  this.termAndTransferDesc,this.status, this.statusText, this.type, this.typeText
  });
}