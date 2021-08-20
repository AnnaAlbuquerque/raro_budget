// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on ControllerBase, Store {
  final _$button1Atom = Atom(name: 'ControllerBase.button1');

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

  final _$button2Atom = Atom(name: 'ControllerBase.button2');

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

  final _$button3Atom = Atom(name: 'ControllerBase.button3');

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

  final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase');

  @override
  dynamic changeScreen1(String option) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.changeScreen1');
    try {
      return super.changeScreen1(option);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
button1: ${button1},
button2: ${button2},
button3: ${button3}
    ''';
  }
}
