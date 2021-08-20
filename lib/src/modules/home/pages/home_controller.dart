import 'package:mobx/mobx.dart';

import 'package:raro_budget/src/shared/models/firebase_model.dart';

part 'home_controller.g.dart';

class HomeController = ControllerBase with _$HomeController;

abstract class ControllerBase with Store {
  FirebaseModel fire;
  ControllerBase(
    this.fire,
  );

  @observable
  bool button1 = true;
  @observable
  bool button2 = false;
  @observable
  bool button3 = false;

  @action
  changeScreen1(String option) {
    if ('button1' == option) {
      button1 = true;
      button2 = false;
      button3 = false;
    } else if ('button2' == option) {
      button1 = false;
      button2 = true;
      button3 = false;
    } else if ('button3' == option) {
      button1 = false;
      button2 = false;
      button3 = true;
    }
  }
}
