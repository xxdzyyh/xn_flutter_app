class XNAccountSingleCellModel {  String title;  String value;  String iconImageName;  XNAccountCellModelType type;  XNAccountSingleCellModel(this.title,this.value,this.iconImageName,this.type);}class XNAccountGroupCellModel {    List<XNAccountSingleCellModel> items;}enum XNAccountCellModelType {  netCredit,  fund,  empty,  coupon,  activity,  financier,  back}class XNAccoutVM {  XNAccoutVM() {    _setupVM();  }  List groupItems = List<XNAccountSingleCellModel>();  List groupCellModels = List();  List singleItems = List<XNAccountSingleCellModel>();  _setupVM() {    XNAccountSingleCellModel netCreditModel = XNAccountSingleCellModel("网贷","--","icon_account_netcredit",XNAccountCellModelType.netCredit);    XNAccountSingleCellModel fundModel = XNAccountSingleCellModel("基金","--","icon_account_fund",XNAccountCellModelType.fund);    this.groupItems.add(netCreditModel);    this.groupItems.add(fundModel);    var rowCount = (this.groupItems.length + 1) ~/ 2;    for (int i=0;i<rowCount;i++) {      var temp = List();      temp.add(this.groupItems[i]);      if (i+1 < this.groupItems.length) {        temp.add(this.groupItems[i+1]);      }      this.groupCellModels.add(temp);    }    XNAccountSingleCellModel myCouponModel = XNAccountSingleCellModel("我的优惠","","icon_account_mycoupon",XNAccountCellModelType.coupon);    XNAccountSingleCellModel myActivityModel = XNAccountSingleCellModel("我的活动","","icon_account_netcredit",XNAccountCellModelType.activity);    XNAccountSingleCellModel myFinancierModel = XNAccountSingleCellModel("邀请好友","赚收益","icon_account_myfinancier",XNAccountCellModelType.financier);    XNAccountSingleCellModel myBackModel = XNAccountSingleCellModel("回款日程","","icon_account_myfinancier",XNAccountCellModelType.back);    this.singleItems.add(myCouponModel);    this.singleItems.add(myActivityModel);    this.singleItems.add(myFinancierModel);    this.singleItems.add(myBackModel);  }}