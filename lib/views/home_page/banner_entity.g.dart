// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageEntity _$HomePageEntityFromJson(Map<String, dynamic> json) {
  return HomePageEntity(
      extData: json['extData'] == null
          ? null
          : ExtDataEntity.fromJson(json['extData'] as Map<String, dynamic>),
      banners: (json['banners'] as List)
          ?.map((e) => e == null
              ? null
              : BannerEntity.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      entries: (json['entries'] as List)
          ?.map((e) => e == null
              ? null
              : EntriesEntity.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      categories: (json['categories'] as List)
          ?.map((e) => e == null
              ? null
              : CategoryEntity.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      newsBanners: (json['newsBanners'] as List)
          ?.map((e) => e == null
              ? null
              : NewsBannerEntity.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      aboutUs: (json['aboutUs'] as List)
          ?.map((e) => e == null
              ? null
              : AboutUsEntity.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      statistics: json['statistics'] == null
          ? null
          : StatisticsEntity.fromJson(
              json['statistics'] as Map<String, dynamic>));
}

Map<String, dynamic> _$HomePageEntityToJson(HomePageEntity instance) =>
    <String, dynamic>{
      'extData': instance.extData,
      'banners': instance.banners,
      'entries': instance.entries,
      'categories': instance.categories,
      'newsBanners': instance.newsBanners,
      'aboutUs': instance.aboutUs,
      'statistics': instance.statistics
    };

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
      htmlPage: json['htmlPage'] as bool);
}

Map<String, dynamic> _$EntriesEntityToJson(EntriesEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'img': instance.img,
      'url': instance.url,
      'htmlPage': instance.htmlPage
    };

CategoryEntity _$CategoryEntityFromJson(Map<String, dynamic> json) {
  return CategoryEntity(
      id: json['ID'] as String,
      dataType: json['dataType'] as int,
      newProduct: json['newProduct'] as bool,
      betweenAnnualRateText: json['betweenAnnualRateText'] as String,
      termAndTransferDesc: json['termAndTransferDesc'] as String,
      status: json['status'] as int,
      statusText: json['statusText'] as String,
      type: json['type'] as String,
      typeText: json['typeText'] as String,
      desc: json['description'] as String,
      transDescription: json['transDescription'] as String,
      annualRateText: json['annualRateText'] as String,
      minAnnualRate: (json['minAnnualRate'] as num)?.toDouble(),
      maxAnnualRate: (json['maxAnnualRate'] as num)?.toDouble(),
      annualRatePrefix: json['annualRatePrefix'] as String,
      annualRateSuffix: json['annualRateSuffix'] as String,
      addRate: (json['addRate'] as num)?.toDouble(),
      termText: json['termText'] as String,
      addRateDesc: json['addRateDesc'] as String,
      termUnit: json['termUnit'] as String,
      termUnitText: json['termUnitText'] as String,
      url: json['url'] as String);
}

Map<String, dynamic> _$CategoryEntityToJson(CategoryEntity instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'dataType': instance.dataType,
      'newProduct': instance.newProduct,
      'betweenAnnualRateText': instance.betweenAnnualRateText,
      'termAndTransferDesc': instance.termAndTransferDesc,
      'status': instance.status,
      'statusText': instance.statusText,
      'type': instance.type,
      'typeText': instance.typeText,
      'description': instance.desc,
      'transDescription': instance.transDescription,
      'annualRateText': instance.annualRateText,
      'minAnnualRate': instance.minAnnualRate,
      'maxAnnualRate': instance.maxAnnualRate,
      'annualRatePrefix': instance.annualRatePrefix,
      'annualRateSuffix': instance.annualRateSuffix,
      'addRate': instance.addRate,
      'termText': instance.termText,
      'addRateDesc': instance.addRateDesc,
      'termUnit': instance.termUnit,
      'termUnitText': instance.termUnitText,
      'url': instance.url
    };

NewsBannerEntity _$NewsBannerEntityFromJson(Map<String, dynamic> json) {
  return NewsBannerEntity(
      title: json['title'] as String,
      imgUrl: json['imgUrl'] as String,
      url: json['url'] as String,
      desc: json['description'] as String);
}

Map<String, dynamic> _$NewsBannerEntityToJson(NewsBannerEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'imgUrl': instance.imgUrl,
      'url': instance.url,
      'description': instance.desc
    };

AboutUsEntity _$AboutUsEntityFromJson(Map<String, dynamic> json) {
  return AboutUsEntity(
      title: json['title'] as String,
      imgUrl: json['imgUrl'] as String,
      url: json['url'] as String,
      desc: json['description'] as String);
}

Map<String, dynamic> _$AboutUsEntityToJson(AboutUsEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'imgUrl': instance.imgUrl,
      'url': instance.url,
      'description': instance.desc
    };

StatisticsEntity _$StatisticsEntityFromJson(Map<String, dynamic> json) {
  return StatisticsEntity(
      totalInvestAmount: json['totalInvestAmount'] as String,
      totalRegisterCount: json['totalRegisterCount'] as String,
      investAmountIcon: json['investAmountIcon'] as String,
      registerCountIcon: json['registerCountIcon'] as String);
}

Map<String, dynamic> _$StatisticsEntityToJson(StatisticsEntity instance) =>
    <String, dynamic>{
      'totalInvestAmount': instance.totalInvestAmount,
      'totalRegisterCount': instance.totalRegisterCount,
      'investAmountIcon': instance.investAmountIcon,
      'registerCountIcon': instance.registerCountIcon
    };

ExtDataEntity _$ExtDataEntityFromJson(Map<String, dynamic> json) {
  return ExtDataEntity(
      adImages: (json['adImages'] as List)
          ?.map((e) => e == null
              ? null
              : HomeAdEntity.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      toolskid: json['toolskid'] == null
          ? null
          : ToolskidDataEntity.fromJson(
              json['toolskid'] as Map<String, dynamic>),
      popupdialog: json['popupdialog'] == null
          ? null
          : PopupDialogDataEntity.fromJson(
              json['popupdialog'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ExtDataEntityToJson(ExtDataEntity instance) =>
    <String, dynamic>{
      'adImages': instance.adImages,
      'toolskid': instance.toolskid,
      'popupdialog': instance.popupdialog
    };

HomeAdEntity _$HomeAdEntityFromJson(Map<String, dynamic> json) {
  return HomeAdEntity(
      id: json['id'] as int,
      href: json['href'] as String,
      url: json['url'] as String,
      content: json['content'] as String);
}

Map<String, dynamic> _$HomeAdEntityToJson(HomeAdEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'href': instance.href,
      'url': instance.url,
      'content': instance.content
    };

ToolskidDataEntity _$ToolskidDataEntityFromJson(Map<String, dynamic> json) {
  return ToolskidDataEntity(
      type: json['type'] as String,
      icon: json['icon'] as String,
      url: json['url'] as String,
      title: json['title'] as String);
}

Map<String, dynamic> _$ToolskidDataEntityToJson(ToolskidDataEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'icon': instance.icon,
      'url': instance.url,
      'title': instance.title
    };

PopupDialogDataEntity _$PopupDialogDataEntityFromJson(
    Map<String, dynamic> json) {
  return PopupDialogDataEntity(
      id: json['id'] as int,
      dialogtype: json['dialogtype'] as String,
      content: json['content'] as String,
      imgurl: json['imgurl'] as String,
      title: json['title'] as String);
}

Map<String, dynamic> _$PopupDialogDataEntityToJson(
        PopupDialogDataEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dialogtype': instance.dialogtype,
      'content': instance.content,
      'imgurl': instance.imgurl,
      'title': instance.title
    };
