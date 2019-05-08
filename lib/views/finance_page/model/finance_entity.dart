import 'package:json_annotation/json_annotation.dart';
part 'finance_entity.g.dart';

@JsonSerializable()
class FinanceListEntity {
  final List<FinanceItemEntity> categories;

  FinanceListEntity({this.categories});
  factory FinanceListEntity.fromJson(Map<String, dynamic> json) {
    return _$FinanceListEntityFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$FinanceListEntityToJson(this);
  }

}

@JsonSerializable()
class FinanceItemEntity {
  final String title;
  final String desc;
  final String desc2;
  final bool newProduct;
  final int dataType;
  final List<FinanceProductEntity> products;
  FinanceItemEntity({this.title, this.desc, this.desc2, this.newProduct, this.dataType, this.products});
  factory FinanceItemEntity.fromJson(Map<String, dynamic> json) {
    return _$FinanceItemEntityFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$FinanceItemEntityToJson(this);
  }

}

@JsonSerializable()
class FinanceProductEntity {
  final int id;
  final String type;
  final String typeText;
  final double minAnnualRate;
  final double maxAnnualRate;
  final double extraAnnualRate;
  final int status;
  final String startInvestingTime;
  final String detailUrl;
  final bool matchSpecialRequirement;
  final String annualRateTooltip;
  final String banner;
  final String annualRateText;
  final String termAndTransferDesc;
  final String termRange;
  final int productBidType;
  final int deadline;
  final int sellOutFlag;

  FinanceProductEntity({this.id, this.type, this.typeText, this.minAnnualRate,
   this.maxAnnualRate, this.extraAnnualRate, this.status, this.startInvestingTime,
   this.detailUrl, this.matchSpecialRequirement, this.annualRateTooltip,
   this.banner,this.annualRateText, this.termAndTransferDesc, this.termRange, this.productBidType,
   this.deadline, this.sellOutFlag});
  factory FinanceProductEntity.fromJson(Map<String, dynamic> json) {
    return _$FinanceProductEntityFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$FinanceProductEntityToJson(this);
  }


}