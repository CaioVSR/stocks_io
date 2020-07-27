import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';
import 'package:stocks_io/app/app_controller.dart';
import 'package:stocks_io/app/core/models/stock_model.dart';
import 'package:stocks_io/app/core/widgets/app_floating_action_button.dart';
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
        List<Stock> favoredList = controller.stocks.where((element) => element.favored).toList();
        return Center(
          child: favoredList.length == 0
              ? Column(
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
                )
              : Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Seus ativos monitorados',
                        style: AppTextStyle.p(fontWeight: FontWeight.bold),
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        alignment: WrapAlignment.start,
                        spacing: 12,
                        runSpacing: 12,
                        children: <Widget>[
                          for (var i = 0; i < favoredList.length; i++)
                            InkWell(
                              onTap: () => print(controller.stocks.length),
                              child: Card(
                                elevation: 3,
                                child: SizedBox(
                                  height: 150.h,
                                  width: 150.w,
                                  child: Observer(builder: (_) {
                                    return Text(favoredList[i].name);
                                  }),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
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
