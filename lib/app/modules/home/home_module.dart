import 'package:stocks_io/app/core/repositories/stock_repository/stock_repository.dart';
import 'package:stocks_io/app/core/repositories/stock_repository/stock_repository_interface.dart';
import 'package:stocks_io/app/modules/home/pages/stock_pick_page_page.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pages/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IStockRepository>((i) => StockRepository(), lazy: false),
        Bind((i) => HomeController(i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/stockPickPage', child: (_, args) => StockPickPagePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
