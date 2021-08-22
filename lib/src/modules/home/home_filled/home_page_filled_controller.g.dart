// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_filled_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePageFilledController on _HomePageFilledControllerBase, Store {
  final _$button1Atom = Atom(name: '_HomePageFilledControllerBase.button1');

  @override
  bool get button1 {
    _$button1Atom.reportRead();
    return super.button1;
  }

  @override
  set button1(bool value) {
    _$button1Atom.reportWrite(value, super.button1, () {
      super.button1 = value;
    });
  }

  final _$button2Atom = Atom(name: '_HomePageFilledControllerBase.button2');

  @override
  bool get button2 {
    _$button2Atom.reportRead();
    return super.button2;
  }

  @override
  set button2(bool value) {
    _$button2Atom.reportWrite(value, super.button2, () {
      super.button2 = value;
    });
  }

  final _$button3Atom = Atom(name: '_HomePageFilledControllerBase.button3');

  @override
  bool get button3 {
    _$button3Atom.reportRead();
    return super.button3;
  }

  @override
  set button3(bool value) {
    _$button3Atom.reportWrite(value, super.button3, () {
      super.button3 = value;
    });
  }

  final _$valueAtom = Atom(name: '_HomePageFilledControllerBase.value');

  @override
  num get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(num value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$listAllAtom = Atom(name: '_HomePageFilledControllerBase.listAll');

  @override
  ObservableList<TransactionModel> get listAll {
    _$listAllAtom.reportRead();
    return super.listAll;
  }

  @override
  set listAll(ObservableList<TransactionModel> value) {
    _$listAllAtom.reportWrite(value, super.listAll, () {
      super.listAll = value;
    });
  }

  final _$listAllInAtom = Atom(name: '_HomePageFilledControllerBase.listAllIn');

  @override
  ObservableList<TransactionModel> get listAllIn {
    _$listAllInAtom.reportRead();
    return super.listAllIn;
  }

  @override
  set listAllIn(ObservableList<TransactionModel> value) {
    _$listAllInAtom.reportWrite(value, super.listAllIn, () {
      super.listAllIn = value;
    });
  }

  final _$listAllOutAtom =
      Atom(name: '_HomePageFilledControllerBase.listAllOut');

  @override
  ObservableList<TransactionModel> get listAllOut {
    _$listAllOutAtom.reportRead();
    return super.listAllOut;
  }

  @override
  set listAllOut(ObservableList<TransactionModel> value) {
    _$listAllOutAtom.reportWrite(value, super.listAllOut, () {
      super.listAllOut = value;
    });
  }

  final _$transactionModelAtom =
      Atom(name: '_HomePageFilledControllerBase.transactionModel');

  @override
  TransactionModel get transactionModel {
    _$transactionModelAtom.reportRead();
    return super.transactionModel;
  }

  @override
  set transactionModel(TransactionModel value) {
    _$transactionModelAtom.reportWrite(value, super.transactionModel, () {
      super.transactionModel = value;
    });
  }

  final _$currentMonthStringAtom =
      Atom(name: '_HomePageFilledControllerBase.currentMonthString');

  @override
  String? get currentMonthString {
    _$currentMonthStringAtom.reportRead();
    return super.currentMonthString;
  }

  @override
  set currentMonthString(String? value) {
    _$currentMonthStringAtom.reportWrite(value, super.currentMonthString, () {
      super.currentMonthString = value;
    });
  }

  final _$getTransactionsWithTypeAsyncAction =
      AsyncAction('_HomePageFilledControllerBase.getTransactionsWithType');

  @override
  Future<dynamic> getTransactionsWithType(String transactionsType) {
    return _$getTransactionsWithTypeAsyncAction
        .run(() => super.getTransactionsWithType(transactionsType));
  }

  final _$deleteUserAsyncAction =
      AsyncAction('_HomePageFilledControllerBase.deleteUser');

  @override
  Future<dynamic> deleteUser(TransactionModel transactionModel) {
    return _$deleteUserAsyncAction
        .run(() => super.deleteUser(transactionModel));
  }

  final _$_HomePageFilledControllerBaseActionController =
      ActionController(name: '_HomePageFilledControllerBase');

  @override
  dynamic changeScreen1(String option) {
    final _$actionInfo = _$_HomePageFilledControllerBaseActionController
        .startAction(name: '_HomePageFilledControllerBase.changeScreen1');
    try {
      return super.changeScreen1(option);
    } finally {
      _$_HomePageFilledControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getCurrentMonth(int currentMonth) {
    final _$actionInfo = _$_HomePageFilledControllerBaseActionController
        .startAction(name: '_HomePageFilledControllerBase.getCurrentMonth');
    try {
      return super.getCurrentMonth(currentMonth);
    } finally {
      _$_HomePageFilledControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDropDownMenuItem(dynamic selectedMonth, dynamic currentMonth) {
    final _$actionInfo =
        _$_HomePageFilledControllerBaseActionController.startAction(
            name: '_HomePageFilledControllerBase.changeDropDownMenuItem');
    try {
      return super.changeDropDownMenuItem(selectedMonth, currentMonth);
    } finally {
      _$_HomePageFilledControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
button1: ${button1},
button2: ${button2},
button3: ${button3},
value: ${value},
listAll: ${listAll},
listAllIn: ${listAllIn},
listAllOut: ${listAllOut},
transactionModel: ${transactionModel},
currentMonthString: ${currentMonthString}
    ''';
  }
}
