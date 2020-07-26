import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Modular.to.pushReplacementNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812);

    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'logo',
          child: Image.asset(
            'assets/images/logo_large.png',
            width: 300.w,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
