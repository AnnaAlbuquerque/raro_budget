import 'package:mobx/mobx.dart';
import 'package:raro_budget/src/modules/home/home_repository.dart';
import 'package:raro_budget/src/shared/models/transaction_model.dart';
part 'home_page_filled_controller.g.dart';

class HomePageFilledController = _HomePageFilledControllerBase
    with _$HomePageFilledController;

abstract class _HomePageFilledControllerBase with Store {
  HomeRepository homeRepository;
  _HomePageFilledControllerBase(
    this.homeRepository,
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
  ObservableList<TransactionModel> listAll = ObservableList<TransactionModel>();

  @action
  Future getTransactions() async {
    listAll.clear();
    List<TransactionModel> responseList = await homeRepository.testeconsulta();
    if (responseList.isNotEmpty) {
      value = 0;
      listAll.clear();
      responseList.forEach((element) {
        listAll.add(element);
        value += element.value;
      });
      return listAll;
    }
  }

  @observable
  late TransactionModel transactionModel;

  @action
  Future deleteUser(TransactionModel transactionModel) async {
    await homeRepository.delete(transactionModel);
    listAll.remove(transactionModel);
  }

  Future<void> logout() async {
    await homeRepository.firebaseRepository.auth.signOut();
  }
}
