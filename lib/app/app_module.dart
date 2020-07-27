import 'package:stocks_io/app/core/auth/auth_controller.dart';
import 'package:stocks_io/app/core/auth/repositories/auth_repository.dart';
import 'package:stocks_io/app/core/auth/repositories/auth_repository_interface.dart';
import 'package:stocks_io/app/modules/login/login_module.dart';
import 'package:stocks_io/app/modules/splash/splash_module.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:stocks_io/app/app_widget.dart';
import 'package:stocks_io/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController(i.get())),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: SplashModule()),
        Router('/login', module: LoginModule(), transition: TransitionType.fadeIn),
        Router('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
