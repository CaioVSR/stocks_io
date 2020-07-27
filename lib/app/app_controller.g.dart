// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  final _$stockServerStatusAtom =
      Atom(name: '_AppControllerBase.stockServerStatus');

  @override
  StockServerStatus get stockServerStatus {
    _$stockServerStatusAtom.reportRead();
    return super.stockServerStatus;
  }

  @override
  set stockServerStatus(StockServerStatus value) {
    _$stockServerStatusAtom.reportWrite(value, super.stockServerStatus, () {
      super.stockServerStatus = value;
    });
  }

  @override
  String toString() {
    return '''
stockServerStatus: ${stockServerStatus}
    ''';
  }
}
