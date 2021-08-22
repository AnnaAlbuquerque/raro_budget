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

  @observable
  ObservableList<TransactionModel> listAllIn =
      ObservableList<TransactionModel>();

  @observable
  ObservableList<TransactionModel> listAllOut =
      ObservableList<TransactionModel>();

  @action
  Future getTransactionsWithType(String transactionsType) async {
    listAllIn.clear();
    listAllOut.clear();
    listAll.clear();

    if (transactionsType == 'entrada') {
      try {
        List<TransactionModel> responseList =
            await homeRepository.getTransactionsDocsWithType(transactionsType);
        if (responseList.isNotEmpty) {
          value = 0;
          listAllIn.clear();
          responseList.forEach((element) {
            listAllIn.add(element);
            value += element.value;
          });
          return listAllIn;
        }
      } catch (e) {
        print('SOMETHING WENT WRONG :(');
        print(e);
      }
    }

    if (transactionsType == 'saida') {
      try {
        List<TransactionModel> responseList =
            await homeRepository.getTransactionsDocsWithType(transactionsType);
        if (responseList.isNotEmpty) {
          value = 0;
          listAllOut.clear();
          responseList.forEach((element) {
            listAllOut.add(element);
            value += element.value;
          });
          return listAllOut;
        }
      } catch (e) {
        print('SOMETHING WENT WRONG :(');
        print(e);
      }
    }

    if (transactionsType == 'total') {
      try {
        List<TransactionModel> responseList =
            await homeRepository.getAllTransactionsDocs();
        if (responseList.isNotEmpty) {
          value = 0;
          listAll.clear();
          responseList.forEach((element) {
            listAll.add(element);
            value += element.value;
          });
          return listAll;
        }
      } catch (e) {
        print('SOMETHING WENT WRONG :(');
        print(e);
      }
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
    await homeRepository.authRepository.auth.signOut();
  }

  @observable
  String? currentMonthString;

  List<String> months = [
    'JANEIRO',
    'FEVEREIRO',
    'MARÇO',
    'ABRIL',
    'MAIO',
    'JUNHO',
    'JULHO',
    'AGOSTO',
    'SETEMBRO',
    'OUTUBRO',
    'NOVEMBRO',
    'DEZEMBRO'
  ];

  @action
  void getCurrentMonth(int currentMonth) {
    currentMonthString = months[currentMonth - 1];
  }

  @action
  void changeDropDownMenuItem(selectedMonth, currentMonth) {
    selectedMonth == 1 || selectedMonth == 'JANEIRO'
        ? currentMonthString = months[0]
        : selectedMonth == 2 || selectedMonth == 'FEVEREIRO'
            ? currentMonthString = months[1]
            : selectedMonth == 3 || selectedMonth == 'MARÇO'
                ? currentMonthString = months[2]
                : selectedMonth == 4 || selectedMonth == 'ABRIL'
                    ? currentMonthString = months[3]
                    : selectedMonth == 5 || selectedMonth == 'MAIO'
                        ? currentMonthString = months[4]
                        : selectedMonth == 6 || selectedMonth == 'JUNHO'
                            ? currentMonthString = months[5]
                            : selectedMonth == 7 || selectedMonth == 'JULHO'
                                ? currentMonthString = months[6]
                                : selectedMonth == 8 ||
                                        selectedMonth == 'AGOSTO'
                                    ? currentMonthString = months[7]
                                    : selectedMonth == 9 ||
                                            selectedMonth == 'SETEMBRO'
                                        ? currentMonthString = months[8]
                                        : selectedMonth == 10 ||
                                                selectedMonth == 'OUTUBRO'
                                            ? currentMonthString = months[9]
                                            : selectedMonth == 11 ||
                                                    selectedMonth == 'NOVEMBRO'
                                                ? currentMonthString =
                                                    months[10]
                                                : selectedMonth == 12 ||
                                                        selectedMonth ==
                                                            'DEZEMBRO'
                                                    ? currentMonthString =
                                                        months[11]
                                                    : currentMonthString =
                                                        months[
                                                            currentMonth - 1];
  }
}
