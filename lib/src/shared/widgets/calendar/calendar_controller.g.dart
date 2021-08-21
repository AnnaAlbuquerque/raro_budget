// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalendarController on _CalendarControllerBase, Store {
  final _$selectedDateAtom = Atom(name: '_CalendarControllerBase.selectedDate');

  @override
  DateTime get selectedDate {
    _$selectedDateAtom.reportRead();
    return super.selectedDate;
  }

  @override
  set selectedDate(DateTime value) {
    _$selectedDateAtom.reportWrite(value, super.selectedDate, () {
      super.selectedDate = value;
    });
  }

  final _$_CalendarControllerBaseActionController =
      ActionController(name: '_CalendarControllerBase');

  @override
  void changeDate(DateTime date) {
    final _$actionInfo = _$_CalendarControllerBaseActionController.startAction(
        name: '_CalendarControllerBase.changeDate');
    try {
      return super.changeDate(date);
    } finally {
      _$_CalendarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedDate: ${selectedDate}
    ''';
  }
}
