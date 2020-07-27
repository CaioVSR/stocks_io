import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:stocks_io/app/app_controller.dart';
import 'package:stocks_io/app/core/repositories/stock_repository/stock_repository_interface.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IStockRepository _stockRepository;
  final AppController _appController = Modular.get();

  _HomeControllerBase(this._stockRepository) {
    fetchData(printEvent);
  }

  @observable
  int retries = 0;

  @action
  printEvent(event) {
    _appController.stockServerStatus = StockServerStatus.up;
    print(event);
  }

  @action
  fetchData(Function callback) {
    try {
      retries = 0;
      _stockRepository.fetchStockStream().stream.listen(callback).onDone(() {
        if (retries < 10) {
          _appController.stockServerStatus = StockServerStatus.down;
          Future.delayed(Duration(seconds: 2), () => fetchData(callback));
          retries++;
        }
      });
    } catch (e) {
      if (retries < 10) {
        _appController.stockServerStatus = StockServerStatus.down;
        Future.delayed(Duration(seconds: 2), () => fetchData(callback));
        retries++;
      }
    }
  }

  // @action

}
