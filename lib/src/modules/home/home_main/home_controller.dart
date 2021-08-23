import 'package:mobx/mobx.dart';

import 'package:raro_budget/src/modules/home/home_main/home_repository.dart';
import 'package:raro_budget/src/shared/auth/auth_controller.dart';
import 'package:raro_budget/src/shared/models/transaction_model.dart';

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

  @observable
  ObservableList<TransactionModel> listTransaction =
      ObservableList<TransactionModel>();

  @observable
  double totalLastTransactions = 0;

  @action
  Future<void> getTotals(int month) async {
    homeRepository.getTotal(month).then(
          (totalResponse) => {
            totalIn = totalResponse.totalIn,
            totalOut = totalResponse.totalOut
          },
        );
  }

  @action
  Future<List<TransactionModel>> getLastTransactions() async {
    listTransaction.clear();
    List<TransactionModel> responseList =
        await homeRepository.getLastTransactions();
    if (responseList.isNotEmpty) {
      totalLastTransactions = 0;
      responseList.forEach(
        (element) {
          listTransaction.add(element);
          if (element.type == "entrada") {
            totalLastTransactions += element.value;
          } else {
            totalLastTransactions -= element.value;
          }
        },
      );
    }
    return listTransaction;
  }

  double getPorcentage(double value1, value2) {
    double percentage = 0;
    if (value1 == 0) {
      return percentage;
    } else if (value1 >= value2) {
      percentage = 100;
      return percentage;
    } else {
      return percentage = (value1 * 100) / value2;
    }
  }
}
