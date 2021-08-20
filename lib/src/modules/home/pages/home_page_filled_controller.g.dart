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

  final _$listaTodosAtom =
      Atom(name: '_HomePageFilledControllerBase.listaTodos');

  @override
  ObservableList<TransactionModule> get listaTodos {
    _$listaTodosAtom.reportRead();
    return super.listaTodos;
  }

  @override
  set listaTodos(ObservableList<TransactionModule> value) {
    _$listaTodosAtom.reportWrite(value, super.listaTodos, () {
      super.listaTodos = value;
    });
  }

  final _$getTransactionsAsyncAction =
      AsyncAction('_HomePageFilledControllerBase.getTransactions');

  @override
  Future<dynamic> getTransactions() {
    return _$getTransactionsAsyncAction.run(() => super.getTransactions());
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
  void getTransactions2() {
    final _$actionInfo = _$_HomePageFilledControllerBaseActionController
        .startAction(name: '_HomePageFilledControllerBase.getTransactions2');
    try {
      return super.getTransactions2();
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
listaTodos: ${listaTodos}
    ''';
  }
}
