import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks_io/app/modules/home/home_controller.dart';
import 'package:stocks_io/themes/app_colors.dart';

class StockPickPagePage extends StatefulWidget {
  final String title;
  const StockPickPagePage({Key key, this.title = "StockPickPage"}) : super(key: key);

  @override
  _StockPickPagePageState createState() => _StockPickPagePageState();
}

class _StockPickPagePageState extends ModularState<StockPickPagePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_list),
            color: AppColors.tiber,
            onPressed: null,
          )
        ],
        backgroundColor: AppColors.grey250,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: AppColors.tiber,
          onPressed: () => Modular.to.pop(),
        ),
        title: Image.asset(
          'assets/images/logo_small.png',
          height: 25.h,
        ),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
