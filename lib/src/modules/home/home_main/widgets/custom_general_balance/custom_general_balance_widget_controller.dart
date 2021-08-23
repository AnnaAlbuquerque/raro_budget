import 'package:mobx/mobx.dart';
part 'custom_general_balance_widget_controller.g.dart';

class CustomGeneralBalanceWidgetController = _CustomGeneralBalanceWidgetControllerBase
    with _$CustomGeneralBalanceWidgetController;

abstract class _CustomGeneralBalanceWidgetControllerBase with Store {
  @observable
  bool balanceVisible = false;

  @action
  void changeBalanceVisibility() {
    if (balanceVisible) {
      balanceVisible = false;
    } else {
      balanceVisible = true;
    }
  }
}
