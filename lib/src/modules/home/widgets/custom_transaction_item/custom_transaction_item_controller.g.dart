// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_transaction_item_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CustomTransactionItemController = BindInject(
  (i) => CustomTransactionItemController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CustomTransactionItemController
    on _CustomTransactionItemControllerBase, Store {
  final _$_CustomTransactionItemControllerBaseActionController =
      ActionController(name: '_CustomTransactionItemControllerBase');

  @override
  Color checkColor(String category) {
    final _$actionInfo = _$_CustomTransactionItemControllerBaseActionController
        .startAction(name: '_CustomTransactionItemControllerBase.checkColor');
    try {
      return super.checkColor(category);
    } finally {
      _$_CustomTransactionItemControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String checkIcon(String category, String type) {
    final _$actionInfo = _$_CustomTransactionItemControllerBaseActionController
        .startAction(name: '_CustomTransactionItemControllerBase.checkIcon');
    try {
      return super.checkIcon(category, type);
    } finally {
      _$_CustomTransactionItemControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
