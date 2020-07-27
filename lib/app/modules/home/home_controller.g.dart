// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$stocksAtom = Atom(name: '_HomeControllerBase.stocks');

  @override
  ObservableList<Stock> get stocks {
    _$stocksAtom.reportRead();
    return super.stocks;
  }

  @override
  set stocks(ObservableList<Stock> value) {
    _$stocksAtom.reportWrite(value, super.stocks, () {
      super.stocks = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic addData(dynamic data) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.addData');
    try {
      return super.addData(data);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchData() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.fetchData');
    try {
      return super.fetchData();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stocks: ${stocks}
    ''';
  }
}
