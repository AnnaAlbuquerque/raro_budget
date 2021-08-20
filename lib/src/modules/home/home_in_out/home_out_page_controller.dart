import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:raro_budget/src/shared/models/firebase_model.dart';
part 'home_out_page_controller.g.dart';

class HomeOutPageController = _HomeOutPageControllerBase
    with _$HomeOutPageController;

abstract class _HomeOutPageControllerBase with Store {
  FirebaseModel firebaseModel;
  _HomeOutPageControllerBase(
    this.firebaseModel,
  );

  TextEditingController valueController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
}
