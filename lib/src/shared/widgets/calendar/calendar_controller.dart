import 'package:mobx/mobx.dart';
part 'calendar_controller.g.dart';

class CalendarController = _CalendarControllerBase with _$CalendarController;

abstract class _CalendarControllerBase with Store {
  @observable
  DateTime selectedDate = DateTime.now();

  @action
  void changeDate(DateTime date) {
    selectedDate = date;
  }
}
