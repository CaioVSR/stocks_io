import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';
import 'package:stocks_io/app/app_controller.dart';
import 'package:stocks_io/app/core/widgets/app_floating_action_button.dart';
import 'package:stocks_io/app/core/widgets/app_modal_bottom_sheet.dart';
import 'package:stocks_io/app/core/widgets/app_stock_card.dart';
import 'package:stocks_io/themes/app_colors.dart';
import 'package:stocks_io/themes/app_text_style.dart';
import '../home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final AppController appController = Modular.get();
  ReactionDisposer _reactionDisposer;

  @override
  void initState() {
    super.initState();
    _reactionDisposer = controller.connectionChecker(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.grey250,
        elevation: 0,
        title: Hero(
          tag: 'logo',
          child: Image.asset(
            'assets/images/logo_small.png',
            height: 25.h,
          ),
        ),
      ),
      body: Observer(builder: (_) {
        if (controller.favoredList.length == 0) {
          return Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 160.h),
                child: Image.asset(
                  'assets/images/image_01.png',
                  height: 188.h,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 62.w, right: 62.w, top: 16.h),
                child: Text(
                  'Você ainda não possui nennum ativo monitorado.',
                  style: AppTextStyle.p(),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          );
        }
        return Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Text(
                  'Seus ativos monitorados',
                  style: AppTextStyle.p(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.favoredList.length,
                  itemBuilder: (context, index) {
                    return AppStockCard(
                      stock: controller.favoredList[index],
                      // onTap:
                      onTap: () => AppBottomSheet.removeStock(
                          context: context,
                          stockTickersymbol: controller.favoredList[index].tickerSymbol,
                          btnOneOnTap: () {
                            controller.removeFavorite(controller.favoredList[index].tickerSymbol);
                            Modular.to.pop();
                          },
                          btnTwoOnTap: () => Modular.to.pop()),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
      floatingActionButton: AppFloatingActionButton(
        onPressed: () => Modular.to.pushNamed('/home/stockPickPage'),
      ),
    );
  }

  @override
  void dispose() {
    _reactionDisposer.reaction.dispose();
    super.dispose();
  }
}
