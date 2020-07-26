import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.grey250,
        elevation: 0,
        title: Image.asset(
          'assets/images/stocks_io_small_logo.png',
          height: 25.h,
        ),
      ),
      body: Observer(builder: (_) {
        return Center(
          child: controller.value == 0
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
              : SingleChildScrollView(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 12,
                    runSpacing: 12,
                    children: <Widget>[
                      for (var i = 0; i < 20; i++)
                        Card(
                          elevation: 3,
                          child: SizedBox(
                            height: 150.h,
                            width: 150.w,
                          ),
                        ),
                    ],
                  ),
                ),
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.tiber,
        icon: Icon(
          Icons.add,
          color: AppColors.irisBlue,
          size: 24.sp,
        ),
        label: Text(
          'Adicionar Ativos',
          style: AppTextStyle.p(fontWeight: FontWeight.bold, color: AppColors.white),
        ),
        onPressed: () {
          controller.increment();
          Modular.to.pushNamed('/stockPickPage');
        },
      ),
    );
  }
}
