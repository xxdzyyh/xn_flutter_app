// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinanceListEntity _$FinanceListEntityFromJson(Map<String, dynamic> json) {
  return FinanceListEntity(
      categories: (json['categories'] as List)
          ?.map((e) => e == null
              ? null
              : FinanceItemEntity.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$FinanceListEntityToJson(FinanceListEntity instance) =>
    <String, dynamic>{'categories': instance.categories};

FinanceItemEntity _$FinanceItemEntityFromJson(Map<String, dynamic> json) {
  return FinanceItemEntity(
      title: json['title'] as String,
      desc: json['desc'] as String,
      desc2: json['desc2'] as String,
      newProduct: json['newProduct'] as bool,
      dataType: json['dataType'] as int,
      products: (json['products'] as List)
          ?.map((e) => e == null
              ? null
              : FinanceProductEntity.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$FinanceItemEntityToJson(FinanceItemEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'desc': instance.desc,
      'desc2': instance.desc2,
      'newProduct': instance.newProduct,
      'dataType': instance.dataType,
      'products': instance.products
    };

FinanceProductEntity _$FinanceProductEntityFromJson(Map<String, dynamic> json) {
  return FinanceProductEntity(
      id: json['id'] as int,
      type: json['type'] as String,
      typeText: json['typeText'] as String,
      minAnnualRate: (json['minAnnualRate'] as num)?.toDouble(),
      maxAnnualRate: (json['maxAnnualRate'] as num)?.toDouble(),
      extraAnnualRate: (json['extraAnnualRate'] as num)?.toDouble(),
      status: json['status'] as int,
      startInvestingTime: json['startInvestingTime'] as String,
      detailUrl: json['detailUrl'] as String,
      matchSpecialRequirement: json['matchSpecialRequirement'] as bool,
      annualRateTooltip: json['annualRateTooltip'] as String,
      banner: json['banner'] as String,
      annualRateText: json['annualRateText'] as String,
      termAndTransferDesc: json['termAndTransferDesc'] as String,
      termRange: json['termRange'] as String,
      productBidType: json['productBidType'] as int,
      deadline: json['deadline'] as int,
      sellOutFlag: json['sellOutFlag'] as int);
}

Map<String, dynamic> _$FinanceProductEntityToJson(
        FinanceProductEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'typeText': instance.typeText,
      'minAnnualRate': instance.minAnnualRate,
      'maxAnnualRate': instance.maxAnnualRate,
      'extraAnnualRate': instance.extraAnnualRate,
      'status': instance.status,
      'startInvestingTime': instance.startInvestingTime,
      'detailUrl': instance.detailUrl,
      'matchSpecialRequirement': instance.matchSpecialRequirement,
      'annualRateTooltip': instance.annualRateTooltip,
      'banner': instance.banner,
      'annualRateText': instance.annualRateText,
      'termAndTransferDesc': instance.termAndTransferDesc,
      'termRange': instance.termRange,
      'productBidType': instance.productBidType,
      'deadline': instance.deadline,
      'sellOutFlag': instance.sellOutFlag
    };
