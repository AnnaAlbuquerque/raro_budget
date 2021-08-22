// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_general_balance_widget_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CustomGeneralBalanceWidgetController
    on _CustomGeneralBalanceWidgetControllerBase, Store {
  final _$balanceVisibleAtom =
      Atom(name: '_CustomGeneralBalanceWidgetControllerBase.balanceVisible');

  @override
  bool get balanceVisible {
    _$balanceVisibleAtom.reportRead();
    return super.balanceVisible;
  }

  @override
  set balanceVisible(bool value) {
    _$balanceVisibleAtom.reportWrite(value, super.balanceVisible, () {
      super.balanceVisible = value;
    });
  }

  final _$_CustomGeneralBalanceWidgetControllerBaseActionController =
      ActionController(name: '_CustomGeneralBalanceWidgetControllerBase');

  @override
  void changeBalanceVisibility() {
    final _$actionInfo =
        _$_CustomGeneralBalanceWidgetControllerBaseActionController.startAction(
            name:
                '_CustomGeneralBalanceWidgetControllerBase.changeBalanceVisibility');
    try {
      return super.changeBalanceVisibility();
    } finally {
      _$_CustomGeneralBalanceWidgetControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
balanceVisible: ${balanceVisible}
    ''';
  }
}
