import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:raro_budget/src/modules/home/home_repository.dart';
import 'package:raro_budget/src/shared/widgets/calendar/calendar_controller.dart';

part 'home_in_page_controller.g.dart';

class HomeInPageController = _HomeInPageControllerBase
    with _$HomeInPageController;

abstract class _HomeInPageControllerBase with Store {
  HomeRepository firebaseModel;
  CalendarController calendarController;
  _HomeInPageControllerBase(
    this.firebaseModel,
    this.calendarController,
  );

  TextEditingController nameController = TextEditingController();
  TextEditingController valueController = TextEditingController();
}
