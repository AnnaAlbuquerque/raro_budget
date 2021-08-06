// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateAccountController on CreateAccountBase, Store {
  final _$pageNumberAtom = Atom(name: 'CreateAccountBase.pageNumber');

  @override
  int get pageNumber {
    _$pageNumberAtom.reportRead();
    return super.pageNumber;
  }

  @override
  set pageNumber(int value) {
    _$pageNumberAtom.reportWrite(value, super.pageNumber, () {
      super.pageNumber = value;
    });
  }

  final _$CreateAccountBaseActionController =
      ActionController(name: 'CreateAccountBase');

  @override
  void incrementPageNumber() {
    final _$actionInfo = _$CreateAccountBaseActionController.startAction(
        name: 'CreateAccountBase.incrementPageNumber');
    try {
      return super.incrementPageNumber();
    } finally {
      _$CreateAccountBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementPageNumber() {
    final _$actionInfo = _$CreateAccountBaseActionController.startAction(
        name: 'CreateAccountBase.decrementPageNumber');
    try {
      return super.decrementPageNumber();
    } finally {
      _$CreateAccountBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageNumber: ${pageNumber}
    ''';
  }
}
