import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:stocks_io/app/app_controller.dart';
import 'package:stocks_io/app/core/models/stock_model.dart';
import 'package:stocks_io/app/core/repositories/stock_repository/stock_repository_interface.dart';
import 'package:stocks_io/app/core/utils/stocks_names.dart';
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
  ObservableList<Stock> stocksList = <Stock>[].asObservable();

  @observable
  ObservableList<Stock> favoredList = <Stock>[].asObservable();

  @action
  removeFavorite(String tickerSymbol) {
    var stockListIndex = stocksList.indexWhere((element) => element.tickerSymbol == tickerSymbol);
    var favoredListIndex = favoredList.indexWhere((element) => element.tickerSymbol == tickerSymbol);

    stocksList[stockListIndex].favored = false;
    favoredList.removeAt(favoredListIndex);
  }

  @action
  addFavorite(int index) {
    stocksList[index].favored = true;
    favoredList.add(stocksList[index]);
  }

  @action
  addData(data) {
    Map json = jsonDecode(data);
    String stockName = json.keys.toList()[0];
    double stockValue = json.values.toList()[0];

    var index = stocksList.indexWhere((element) => element.tickerSymbol == stockName);

    if (index == -1) {
      var stock = Stock(
          openingValue: stockValue,
          tickerSymbol: stockName,
          name: stocksNames[stockName],
          currentValue: stockValue,
          minValue: stockValue,
          maxValue: stockValue,
          favored: false);
      stocksList.add(stock);
    } else {
      stocksList[index].currentValue = stockValue;
      if (stockValue < stocksList[index].minValue) {
        stocksList[index].minValue = stockValue;
      }
      if (stockValue > stocksList[index].maxValue) {
        stocksList[index].maxValue = stockValue;
      }

      if (stocksList[index].favored) {
        var favoredIndex = favoredList.indexWhere((element) => element.tickerSymbol == stocksList[index].tickerSymbol);

        if (favoredIndex == -1) {
          favoredList.add(stocksList[index]);
        } else {
          favoredList[favoredIndex] = stocksList[index];
        }
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
