// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashController on SplashBase, Store {
  final _$firebaseStatusAtom = Atom(name: 'SplashBase.firebaseStatus');

  @override
  FirebaseStatus get firebaseStatus {
    _$firebaseStatusAtom.reportRead();
    return super.firebaseStatus;
  }

  @override
  set firebaseStatus(FirebaseStatus value) {
    _$firebaseStatusAtom.reportWrite(value, super.firebaseStatus, () {
      super.firebaseStatus = value;
    });
  }

  final _$initializerFirebaseAsyncAction =
      AsyncAction('SplashBase.initializerFirebase');

  @override
  Future<void> initializerFirebase() {
    return _$initializerFirebaseAsyncAction
        .run(() => super.initializerFirebase());
  }

  @override
  String toString() {
    return '''
firebaseStatus: ${firebaseStatus}
    ''';
  }
}
