// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_registration_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeRegistrationController on _HomeRegistrationControllerBase, Store {
  final _$currentUserDataAtom =
      Atom(name: '_HomeRegistrationControllerBase.currentUserData');

  @override
  UserModel get currentUserData {
    _$currentUserDataAtom.reportRead();
    return super.currentUserData;
  }

  @override
  set currentUserData(UserModel value) {
    _$currentUserDataAtom.reportWrite(value, super.currentUserData, () {
      super.currentUserData = value;
    });
  }

  final _$hasChangesAtom =
      Atom(name: '_HomeRegistrationControllerBase.hasChanges');

  @override
  bool get hasChanges {
    _$hasChangesAtom.reportRead();
    return super.hasChanges;
  }

  @override
  set hasChanges(bool value) {
    _$hasChangesAtom.reportWrite(value, super.hasChanges, () {
      super.hasChanges = value;
    });
  }

  final _$loadUserDataAsyncAction =
      AsyncAction('_HomeRegistrationControllerBase.loadUserData');

  @override
  Future<void> loadUserData() {
    return _$loadUserDataAsyncAction.run(() => super.loadUserData());
  }

  final _$_HomeRegistrationControllerBaseActionController =
      ActionController(name: '_HomeRegistrationControllerBase');

  @override
  void checkNameChange(String value) {
    final _$actionInfo = _$_HomeRegistrationControllerBaseActionController
        .startAction(name: '_HomeRegistrationControllerBase.checkNameChange');
    try {
      return super.checkNameChange(value);
    } finally {
      _$_HomeRegistrationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkEmailChange(String value) {
    final _$actionInfo = _$_HomeRegistrationControllerBaseActionController
        .startAction(name: '_HomeRegistrationControllerBase.checkEmailChange');
    try {
      return super.checkEmailChange(value);
    } finally {
      _$_HomeRegistrationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkPhoneChange(String value) {
    final _$actionInfo = _$_HomeRegistrationControllerBaseActionController
        .startAction(name: '_HomeRegistrationControllerBase.checkPhoneChange');
    try {
      return super.checkPhoneChange(value);
    } finally {
      _$_HomeRegistrationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkCpfChange(String value) {
    final _$actionInfo = _$_HomeRegistrationControllerBaseActionController
        .startAction(name: '_HomeRegistrationControllerBase.checkCpfChange');
    try {
      return super.checkCpfChange(value);
    } finally {
      _$_HomeRegistrationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentUserData: ${currentUserData},
hasChanges: ${hasChanges}
    ''';
  }
}
