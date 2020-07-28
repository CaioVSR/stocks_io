import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks_io/app/modules/home/home_controller.dart';
import 'package:stocks_io/themes/app_colors.dart';
import 'package:stocks_io/themes/app_text_style.dart';

class StockPickPagePage extends StatefulWidget {
  final String title;
  const StockPickPagePage({Key key, this.title = "StockPickPage"}) : super(key: key);

  @override
  _StockPickPagePageState createState() => _StockPickPagePageState();
}

class _StockPickPagePageState extends State<StockPickPagePage> {
  final HomeController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    print(controller.stocksList.length);
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Text(
                'Selecione os ativos que deseja monitorar',
                style: AppTextStyle.p(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Observer(builder: (_) {
              return Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(color: AppColors.tiber, thickness: 1),
                  itemCount: controller.stocksList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: Text(controller.stocksList[index].tickerSymbol),
                      onTap: () => controller.addFavorite(index),
                    );
                  },
                ),
              );
            }),
            // ListView.separated(
            //   itemBuilder: (context, index) {
            //     return ListTile(title: Text(controller.stocks[index].name));
            //   },
            //   separatorBuilder: (context, index) {
            //     return Divider(
            //       thickness: 1,
            //       color: AppColors.tiber,
            //     );
            //   },
            //   itemCount: controller.stocks.length,
            // ),
          ],
        ),
      ),
    );
  }
}
