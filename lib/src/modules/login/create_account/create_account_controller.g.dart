// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateAccountController on CreateAccountBase, Store {
  final _$pageViewControllerAtom =
      Atom(name: 'CreateAccountBase.pageViewController');

  @override
  PageController get pageViewController {
    _$pageViewControllerAtom.reportRead();
    return super.pageViewController;
  }

  @override
  set pageViewController(PageController value) {
    _$pageViewControllerAtom.reportWrite(value, super.pageViewController, () {
      super.pageViewController = value;
    });
  }

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

  final _$newUserAtom = Atom(name: 'CreateAccountBase.newUser');

  @override
  UserModel get newUser {
    _$newUserAtom.reportRead();
    return super.newUser;
  }

  @override
  set newUser(UserModel value) {
    _$newUserAtom.reportWrite(value, super.newUser, () {
      super.newUser = value;
    });
  }

  final _$CreateAccountBaseActionController =
      ActionController(name: 'CreateAccountBase');

  @override
  void showCurrentPageNumber() {
    final _$actionInfo = _$CreateAccountBaseActionController.startAction(
        name: 'CreateAccountBase.showCurrentPageNumber');
    try {
      return super.showCurrentPageNumber();
    } finally {
      _$CreateAccountBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveNewUserData() {
    final _$actionInfo = _$CreateAccountBaseActionController.startAction(
        name: 'CreateAccountBase.saveNewUserData');
    try {
      return super.saveNewUserData();
    } finally {
      _$CreateAccountBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool checkUserLogin() {
    final _$actionInfo = _$CreateAccountBaseActionController.startAction(
        name: 'CreateAccountBase.checkUserLogin');
    try {
      return super.checkUserLogin();
    } finally {
      _$CreateAccountBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageViewController: ${pageViewController},
pageNumber: ${pageNumber},
newUser: ${newUser}
    ''';
  }
}
