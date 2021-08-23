import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:raro_budget/src/modules/home/home_repository.dart';
import 'package:raro_budget/src/shared/widgets/calendar/calendar_controller.dart';

part 'home_out_page_controller.g.dart';

class HomeOutPageController = _HomeOutPageControllerBase
    with _$HomeOutPageController;

abstract class _HomeOutPageControllerBase with Store {
  HomeRepository homeRepository;
  CalendarController calendarController;
  _HomeOutPageControllerBase(
    this.homeRepository,
    this.calendarController,
  );

  TextEditingController valueController = TextEditingController();
  TextEditingController nameController = TextEditingController();
}
