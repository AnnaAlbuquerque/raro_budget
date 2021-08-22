import 'package:raro_budget/src/shared/auth/auth_controller.dart';
import 'package:raro_budget/src/shared/models/total_model.dart';
import 'package:raro_budget/src/shared/models/transaction_model.dart';

class HomeRepository {
  HomeRepository(this.authController);

  final AuthController authController;

  Future<TotalModel> getTotal(int month) async {
    TotalModel total = TotalModel(totalIn: 0, totalOut: 0, month: 0);
    try {
      await authController.authRepository.store
          .collection('users')
          .doc(authController.authRepository.auth.currentUser!.uid)
          .collection('monthTotal')
          .where('month', isEqualTo: month)
          .get()
          .then(
            (query) => {
              total = TotalModel.fromMap(query.docs[0].data()),
            },
          );
      return total;
    } catch (e) {
      return total;
    }
  }

  Future<List<TransactionModel>> getLastTransactions() async {
    List<TransactionModel> listTransaction = [];
    try {
      await authController.authRepository.store
          .collection('users')
          .doc(authController.authRepository.auth.currentUser!.uid)
          .collection("transactions")
          .orderBy("date", descending: true)
          .limit(5)
          .get()
          .then((query) => {
                listTransaction = query.docs
                    .map((doc) => TransactionModel.fromMap(doc.data()))
                    .toList()
              });
      print(listTransaction);
      return listTransaction;
    } catch (e) {
      return listTransaction;
    }
  }
}
