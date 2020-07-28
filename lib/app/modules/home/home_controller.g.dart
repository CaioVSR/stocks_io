// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$stocksListAtom = Atom(name: '_HomeControllerBase.stocksList');

  @override
  ObservableList<Stock> get stocksList {
    _$stocksListAtom.reportRead();
    return super.stocksList;
  }

  @override
  set stocksList(ObservableList<Stock> value) {
    _$stocksListAtom.reportWrite(value, super.stocksList, () {
      super.stocksList = value;
    });
  }

  final _$favoredListAtom = Atom(name: '_HomeControllerBase.favoredList');

  @override
  ObservableList<Stock> get favoredList {
    _$favoredListAtom.reportRead();
    return super.favoredList;
  }

  @override
  set favoredList(ObservableList<Stock> value) {
    _$favoredListAtom.reportWrite(value, super.favoredList, () {
      super.favoredList = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic removeFavorite(String tickerSymbol) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.removeFavorite');
    try {
      return super.removeFavorite(tickerSymbol);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addFavorite(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.addFavorite');
    try {
      return super.addFavorite(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
stocksList: ${stocksList},
favoredList: ${favoredList}
    ''';
  }
}
