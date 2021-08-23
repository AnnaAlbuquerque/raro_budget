import 'package:intl/intl.dart';
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
    'DEZEMBRO',
    'TODOS',
  ];

  int? monthStringToInt(String? currentMonthString) {
    if (currentMonthString == 'JANEIRO') return 1;
    if (currentMonthString == 'FEVEREIRO') return 2;
    if (currentMonthString == 'MARÇO') return 3;
    if (currentMonthString == 'ABRIL') return 4;
    if (currentMonthString == 'MAIO') return 5;
    if (currentMonthString == 'JUNHO') return 6;
    if (currentMonthString == 'JULHO') return 7;
    if (currentMonthString == 'AGOSTO') return 8;
    if (currentMonthString == 'SETEMBRO') return 9;
    if (currentMonthString == 'OUTUBRO') return 10;
    if (currentMonthString == 'NOVEMBRO') return 11;
    if (currentMonthString == 'DEZEMBRO') return 12;
  }

  @action
  void getCurrentMonth(int currentMonth) {
    currentMonthString = months[currentMonth - 1];
  }

  @action
  void changeDropDownMenuItem(selectedMonth, currentMonth) {
    selectedMonth == 'JANEIRO'
        ? currentMonthString = months[0]
        : selectedMonth == 'FEVEREIRO'
            ? currentMonthString = months[1]
            : selectedMonth == 'MARÇO'
                ? currentMonthString = months[2]
                : selectedMonth == 'ABRIL'
                    ? currentMonthString = months[3]
                    : selectedMonth == 'MAIO'
                        ? currentMonthString = months[4]
                        : selectedMonth == 'JUNHO'
                            ? currentMonthString = months[5]
                            : selectedMonth == 'JULHO'
                                ? currentMonthString = months[6]
                                : selectedMonth == 'AGOSTO'
                                    ? currentMonthString = months[7]
                                    : selectedMonth == 'SETEMBRO'
                                        ? currentMonthString = months[8]
                                        : selectedMonth == 'OUTUBRO'
                                            ? currentMonthString = months[9]
                                            : selectedMonth == 'NOVEMBRO'
                                                ? currentMonthString =
                                                    months[10]
                                                : selectedMonth == 'DEZEMBRO'
                                                    ? currentMonthString =
                                                        months[11]
                                                    : selectedMonth == 'TODOS'
                                                        ? currentMonthString =
                                                            months[12]
                                                        : currentMonthString =
                                                            months[
                                                                currentMonth -
                                                                    1];
  }

  @observable
  num value = 0;

  @observable
  num valueIn = 0;

  @observable
  num valueOut = 0;

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
      if (currentMonthString == 'TODOS') {
        List<TransactionModel> responseList =
            await homeRepository.getTransactionsDocsWithType(transactionsType);

        if (responseList.isNotEmpty) {
          valueIn = 0;
          listAllIn.clear();
          responseList.forEach((element) {
            listAllIn.add(element);
            valueIn += element.value;
          });

          return listAllIn;
        }
      } else {
        int? currentMonthInt = monthStringToInt(currentMonthString);
        List<TransactionModel> responseList =
            await homeRepository.getTransactionsDocsWithTypeAndMonth(
                transactionsType, currentMonthInt as int);

        if (responseList.isNotEmpty) {
          valueIn = 0;
          listAllIn.clear();
          responseList.forEach((element) {
            listAllIn.add(element);
            valueIn += element.value;
          });

          return listAllIn;
        } else {
          valueIn = 0.00;
        }
      }
    }

    if (transactionsType == 'saida') {
      if (currentMonthString == 'TODOS') {
        List<TransactionModel> responseList =
            await homeRepository.getTransactionsDocsWithType(transactionsType);
        if (responseList.isNotEmpty) {
          valueOut = 0;
          listAllOut.clear();
          responseList.forEach((element) {
            listAllOut.add(element);
            valueOut += element.value;
          });

          return listAllOut;
        }
      } else {
        int? currentMonthInt = monthStringToInt(currentMonthString);
        List<TransactionModel> responseList =
            await homeRepository.getTransactionsDocsWithTypeAndMonth(
                transactionsType, currentMonthInt as int);

        if (responseList.isNotEmpty) {
          valueOut = 0;
          listAllOut.clear();
          responseList.forEach((element) {
            listAllOut.add(element);
            valueOut += element.value;
          });

          return listAllOut;
        } else {
          valueOut = 0.00;
        }
      }
    }

    if (transactionsType == 'total') {
      if (currentMonthString == 'TODOS') {
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
      } else {
        int? currentMonthInt = monthStringToInt(currentMonthString);
        List<TransactionModel> responseList = await homeRepository
            .getAllTransactionsDocsWithMonth(currentMonthInt as int);

        if (responseList.isNotEmpty) {
          value = 0;
          listAll.clear();
          responseList.forEach((element) {
            listAll.add(element);
            value += element.value;
          });

          return listAll;
        } else {
          value = 0.00;
        }
      }
    }
  }

  @computed
  num get getBalance => valueIn - valueOut;

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
}
