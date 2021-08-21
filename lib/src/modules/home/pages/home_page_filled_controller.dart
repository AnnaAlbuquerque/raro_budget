import 'package:mobx/mobx.dart';

import 'package:raro_budget/src/shared/models/firebase_model.dart';
import 'package:raro_budget/src/shared/models/transaction_module.dart';

part 'home_page_filled_controller.g.dart';

class HomePageFilledController = _HomePageFilledControllerBase
    with _$HomePageFilledController;

abstract class _HomePageFilledControllerBase with Store {
  FirebaseModel firebaseModel;
  _HomePageFilledControllerBase(
    this.firebaseModel,
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

  @observable
  ObservableList<TransactionModule> listaTodos =
      ObservableList<TransactionModule>();

  @action
  Future getTransactions() async {
    //listaTodos.clear();
    List<TransactionModule> responseList = await firebaseModel.testeconsulta();

    print(responseList);
    if (responseList.isNotEmpty) {
      responseList.forEach((element) {
        listaTodos.add(element);

        print(element);
      });

      return listaTodos;
    }
  }

  @action
  void getTransactions2() {
    firebaseModel.testeconsulta().then((responseList) => {
          if (responseList.isNotEmpty)
            {
              responseList.forEach((element) {
                print(element);
                listaTodos.add(element);
              })
            }
          else
            {
              print('ELSEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE'),
            }
        });
  }
}
