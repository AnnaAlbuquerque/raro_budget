// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on ControllerBase, Store {
  final _$totalInAtom = Atom(name: 'ControllerBase.totalIn');

  @override
  double get totalIn {
    _$totalInAtom.reportRead();
    return super.totalIn;
  }

  @override
  set totalIn(double value) {
    _$totalInAtom.reportWrite(value, super.totalIn, () {
      super.totalIn = value;
    });
  }

  final _$totalOutAtom = Atom(name: 'ControllerBase.totalOut');

  @override
  double get totalOut {
    _$totalOutAtom.reportRead();
    return super.totalOut;
  }

  @override
  set totalOut(double value) {
    _$totalOutAtom.reportWrite(value, super.totalOut, () {
      super.totalOut = value;
    });
  }

  final _$monthAtom = Atom(name: 'ControllerBase.month');

  @override
  int get month {
    _$monthAtom.reportRead();
    return super.month;
  }

  @override
  set month(int value) {
    _$monthAtom.reportWrite(value, super.month, () {
      super.month = value;
    });
  }

  final _$listTransactionAtom = Atom(name: 'ControllerBase.listTransaction');

  @override
  ObservableList<TransactionModel> get listTransaction {
    _$listTransactionAtom.reportRead();
    return super.listTransaction;
  }

  @override
  set listTransaction(ObservableList<TransactionModel> value) {
    _$listTransactionAtom.reportWrite(value, super.listTransaction, () {
      super.listTransaction = value;
    });
  }

  final _$totalLastTransactionsAtom =
      Atom(name: 'ControllerBase.totalLastTransactions');

  @override
  double get totalLastTransactions {
    _$totalLastTransactionsAtom.reportRead();
    return super.totalLastTransactions;
  }

  @override
  set totalLastTransactions(double value) {
    _$totalLastTransactionsAtom.reportWrite(value, super.totalLastTransactions,
        () {
      super.totalLastTransactions = value;
    });
  }

  final _$getTotalsAsyncAction = AsyncAction('ControllerBase.getTotals');

  @override
  Future<void> getTotals(int month) {
    return _$getTotalsAsyncAction.run(() => super.getTotals(month));
  }

  final _$getLastTransactionsAsyncAction =
      AsyncAction('ControllerBase.getLastTransactions');

  @override
  Future<List<TransactionModel>> getLastTransactions() {
    return _$getLastTransactionsAsyncAction
        .run(() => super.getLastTransactions());
  }

  @override
  String toString() {
    return '''
totalIn: ${totalIn},
totalOut: ${totalOut},
month: ${month},
listTransaction: ${listTransaction},
totalLastTransactions: ${totalLastTransactions}
    ''';
  }
}
