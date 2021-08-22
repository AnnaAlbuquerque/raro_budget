import 'package:mobx/mobx.dart';
import 'package:raro_budget/src/shared/models/firebase_model.dart';
import 'package:raro_budget/src/shared/models/transaction_model.dart';
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
  num value = 0;
  @observable
  ObservableList<TransactionModel> listaTodos =
      ObservableList<TransactionModel>();

  @action
  Future getTransactions() async {
    listaTodos.clear();
    List<TransactionModel> responseList = await firebaseModel.testeconsulta();
    if (responseList.isNotEmpty) {
      value = 0;
      listaTodos.clear();
      responseList.forEach((element) {
        listaTodos.add(element);
        value += element.value;
      });
      return listaTodos;
    }
  }

  @observable
  late TransactionModel transactionModel;

  @action
  Future deleteUser(TransactionModel transactionModel) async {
    await firebaseModel.delete(transactionModel);
    listaTodos.remove(transactionModel);
  }
}
