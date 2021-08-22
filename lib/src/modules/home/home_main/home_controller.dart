import 'package:mobx/mobx.dart';

import 'package:raro_budget/src/modules/home/home_main/home_repository.dart';
import 'package:raro_budget/src/shared/auth/auth_controller.dart';

part 'home_controller.g.dart';

class HomeController = ControllerBase with _$HomeController;

abstract class ControllerBase with Store {
  ControllerBase(
    this.homeRepository,
  );

  HomeRepository homeRepository;

  @observable
  double totalIn = 0;

  @observable
  double totalOut = 0;

  @observable
  int month = DateTime.now().month;

  @action
  Future<void> getTotals(int month) async {
    homeRepository.getTotal(month).then(
          (totalResponse) => {
            totalIn = totalResponse.totalIn,
            totalOut = totalResponse.totalOut
          },
        );
  }
}
