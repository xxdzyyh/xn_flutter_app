// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageEntity _$HomePageEntityFromJson(Map<String, dynamic> json) {
  return HomePageEntity(
      banners: (json['banners'] as List)
          ?.map((e) => e == null
              ? null
              : BannerEntity.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      entries: (json['entries'] as List)
          ?.map((e) => e == null
              ? null
              : EntriesEntity.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$HomePageEntityToJson(HomePageEntity instance) =>
    <String, dynamic>{'banners': instance.banners, 'entries': instance.entries};

BannerEntity _$BannerEntityFromJson(Map<String, dynamic> json) {
  return BannerEntity(
      title: json['title'] as String,
      imgUrl: json['imgUrl'] as String,
      url: json['url'] as String,
      desc: json['description'] as String);
}

Map<String, dynamic> _$BannerEntityToJson(BannerEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'imgUrl': instance.imgUrl,
      'url': instance.url,
      'description': instance.desc
    };

EntriesEntity _$EntriesEntityFromJson(Map<String, dynamic> json) {
  return EntriesEntity(
      name: json['name'] as String,
      title: json['title'] as String,
      img: json['img'] as String,
      url: json['url'] as String,
      htmlPage: json['htmlPage'] as String);
}

Map<String, dynamic> _$EntriesEntityToJson(EntriesEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'img': instance.img,
      'url': instance.url,
      'htmlPage': instance.htmlPage
    };
