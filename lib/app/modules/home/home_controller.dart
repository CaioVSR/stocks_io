import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:stocks_io/app/app_controller.dart';
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

  @action
  fetchData() {
    _appController.stockServerStatus = StockServerStatus.up;
    try {
      _stockRepository.fetchStockStream().stream.listen((data) {
        print(data);
      }).onDone(() {
        _appController.stockServerStatus = StockServerStatus.down;
      });
    } catch (e) {
      _appController.stockServerStatus = StockServerStatus.down;
    }
  }

  @action
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
