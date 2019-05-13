import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:xn_flutter_app/uibuild/xncolor.dart';
import 'package:xn_flutter_app/views/finance_page/bloc/finance_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:xn_flutter_app/component/error_view.dart';
import 'package:xn_flutter_app/component/loading_view.dart';
import 'package:xn_flutter_app/views/finance_page/model/finance_entity.dart';
import 'package:xn_flutter_app/views/finance_page/widget/finance_space_widget.dart';
import 'package:xn_flutter_app/views/finance_page/widget/finance_title_widget.dart';
import 'package:xn_flutter_app/views/finance_page/widget/finance_recommond_widget.dart';
import 'package:xn_flutter_app/views/finance_page/widget/finance_scroll_widget.dart';
import 'package:xn_flutter_app/views/home_page/xn_bottomalert_widget.dart';
import 'package:xn_flutter_app/views/finance_page/widget/finance_aproduct_widget.dart';
import 'package:xn_flutter_app/views/finance_page/widget/finance_bproduct_widget.dart';

class FinancePage extends StatefulWidget {
  @override
  _FinancePageState createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {

  final FinanceBloc bloc = FinanceBloc();

  GlobalKey<RefreshHeaderState> _headerKey = new GlobalKey<RefreshHeaderState>();
  GlobalKey<EasyRefreshState> _easyRefreshKey = new GlobalKey<EasyRefreshState>();

  @override
  Widget build(BuildContext context) {

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("项目"),
        transitionBetweenRoutes: false,
        ),
      child: SafeArea(
        child: StreamBuilder(
          stream: bloc.outList,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasError) {
              return XNErrorView(
                callBack: () {
                  bloc.sendinitData();
                  bloc.sendRequest();
                },
              );
            } else if(snapshot.data == 0) {
               return _showLoading();
            }
             else {
              return _getRefresh(context, snapshot);
            }

          },
        ),
      ),
    );
  }

Widget _buildList(AsyncSnapshot snapshot) {
  FinanceListEntity listEntity = snapshot.data;
  List<Widget> list = List();
  for(int i=0; i<listEntity.categories.length; i++) {
    FinanceItemEntity itemEntity = listEntity.categories != null ? listEntity.categories[i] : null;
    int dataType = itemEntity.dataType;
    if(dataType == 0) {
      list.add(
        FinanceTitleWidget(itemEntity: itemEntity,),
      );
      list.add(
        FinanceRecommondWidget(itemEntity: itemEntity,),
      );
    }
    if(dataType == 1) {
      list.add(
        FinanceSpaceWidget(),
      );
      list.add(
        FinanceTitleWidget(itemEntity: itemEntity,),
      );
      list.add(
        FinanceScrollWidget(itemEntity: itemEntity,),
      );
      
    }
    if(dataType == 2) {
      list.add(
        FinanceSpaceWidget(),
      );
      list.add(
        FinanceTitleWidget(itemEntity: itemEntity,),
      );
      for(int j=0; j<itemEntity.products.length; j++) {
        list.add(FinanceAProductWidget(productEntity: itemEntity.products[j],));
        if(j != itemEntity.products.length - 1) {
          list.add(
            Container(
              height: 1.0,
              color: xn_line_color,
            )
          );
        }
      }
    }
    if(dataType == 3) {
      list.add(
        FinanceSpaceWidget(),
      );
      list.add(
        FinanceTitleWidget(itemEntity: itemEntity,),
      );

      for(int j=0; j<itemEntity.products.length; j++) {
        list.add(FinanceBProductWidget(productEntity: itemEntity.products[j],));

      }
    }
  }

  list.add(
      XNBottomAlertWidget(),
    );

  ListView listView;
  listView = ListView(
    children: list,
  );

  return listView;
}


Widget _showLoading() {
  return XNLoadingView();
}

Widget _getRefresh(BuildContext context, AsyncSnapshot snapshot) {
    return EasyRefresh(
      key: _easyRefreshKey,
      behavior: ScrollOverBehavior(),
      child: _buildList(snapshot),
      refreshHeader: _getRefreshHeader(),
      onRefresh: () async {
        await bloc.sendRequest();
      },
    );
  }

Widget _getRefreshHeader() {
  return ClassicsHeader(
    refreshHeight: 50,
    key: _headerKey,
    refreshText: "下拉刷新",
    refreshReadyText: "松开刷新",
    refreshingText: "加载中...",
    refreshedText: "刷新完成",
    bgColor: xn_bg_color,
    textColor: Colors.black,
    isFloat: false,
  );
}







}
