import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:stocks_io/app/app_controller.dart';
import 'package:stocks_io/app/core/models/stock_model.dart';
import 'package:stocks_io/app/core/repositories/stock_repository/stock_repository_interface.dart';
import 'package:stocks_io/app/core/widgets/app_modal_bottom_sheet.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IStockRepository _stockRepository;
  final AppController _appController = Modular.get();

  _HomeControllerBase(this._stockRepository) {
    fetchData();
  }

  @observable
  ObservableList<Stock> stocks = <Stock>[].asObservable();

  @action
  addData(data) {
    Map json = jsonDecode(data);
    String stockName = json.keys.toList()[0];
    double stockValue = json.values.toList()[0];
    var index = stocks.indexWhere((element) => element.name == stockName);

    if (index == -1) {
      var stock =
          Stock(name: stockName, currentValue: stockValue, minValue: stockValue, maxValue: stockValue, favored: false);
      stocks.add(stock);
    } else {
      stocks[index].currentValue = stockValue;
      if (stockValue < stocks[index].minValue) {
        stocks[index].minValue = stockValue;
      }
      if (stockValue > stocks[index].maxValue) {
        stocks[index].maxValue = stockValue;
      }
      if (stocks[index].name == 'MGLU3') {
        stocks[index].favored = true;
      }
    }
  }

  @action
  fetchData() {
    try {
      _appController.stockServerStatus = StockServerStatus.up;
      _stockRepository
          .fetchStockStream()
          .stream
          .listen(addData)
          .onDone(() => _appController.stockServerStatus = StockServerStatus.down);
    } catch (e) {
      _appController.stockServerStatus = StockServerStatus.down;
    }
  }

  ReactionDisposer connectionChecker(BuildContext context) {
    return autorun(
      (fn) {
        if (_appController.stockServerStatus == StockServerStatus.down) {
          AppBottomSheet.noConnection(context, () {
            Modular.to.pop();
            fetchData();
          }, () => exit(0));
        }
      },
    );
  }
}
