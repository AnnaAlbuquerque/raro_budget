import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raro_budget/src/shared/auth/auth_repository.dart';
import 'package:raro_budget/src/shared/models/transaction_model.dart';

class HomeRepository {
  AuthRepository firebaseRepository;
  HomeRepository(
    this.firebaseRepository,
  );

  Future<void> insert(TransactionModel transaction) async {
    try {
      await firebaseRepository.store
          .collection('users')
          .doc(firebaseRepository.auth.currentUser!.uid)
          .collection('transactions')
          .add({
        'category': transaction.category,
        'type': transaction.type,
        'name': transaction.name,
        'value': transaction.value,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> insertNewOutput(TransactionModel transaction) async {
    try {
      await firebaseRepository.store
          .collection('users')
          .doc(firebaseRepository.auth.currentUser!.uid)
          .collection('transactions')
          .add({
        'category': transaction.category,
        'type': 'saída',
        'name': transaction.name,
        'value': transaction.value,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> insertNewInput(TransactionModel transaction) async {
    try {
      await firebaseRepository.store
          .collection('users')
          .doc(firebaseRepository.auth.currentUser!.uid)
          .collection('transactions')
          .add({
        'category': transaction.category,
        'type': 'entrada',
        'name': transaction.name,
        'value': transaction.value,
        'day': transaction.day,
        'month': transaction.month,
        'year': transaction.year,
        'createdAt': FieldValue.serverTimestamp()
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(TransactionModel transaction) async {
    try {
      await firebaseRepository.store
          .collection('users')
          .doc(firebaseRepository.auth.currentUser!.uid)
          .collection('transactions')
          .where('type', isEqualTo: transaction.type)
          .where('value', isEqualTo: transaction.value)
          .where('category', isEqualTo: transaction.category)
          .get()
          .then((value) => value.docs.forEach((element) {
                firebaseRepository.store
                    .collection('users')
                    .doc(firebaseRepository.auth.currentUser!.uid)
                    .collection('transactions')
                    .doc(element.id)
                    .delete()
                    .then((value) {
                  print("Success!");
                });
              }));
    } catch (e) {
      print(e);
    }
  }

  Future<void> update(
      TransactionModel transaction, TransactionModel transactionupdated) async {
    try {
      await firebaseRepository.store
          .collection('users')
          .doc(firebaseRepository.auth.currentUser!.uid)
          .collection('transactions')
          .where('type', isEqualTo: transaction.type)
          .where('value', isEqualTo: transaction.value)
          .where('category', isEqualTo: transaction.category)
          .get()
          .then((value) => value.docs.forEach((element) {
                firebaseRepository.store
                    .collection('users')
                    .doc(firebaseRepository.auth.currentUser!.uid)
                    .collection('transactions')
                    .doc(element.id)
                    .update({
                  'type': transactionupdated.type,
                  'value': transactionupdated.value,
                  'category': transactionupdated.category
                }).then((value) {
                  print("Success!");
                });
              }));
    } catch (e) {
      print(e);
    }
  }

  Future<List<TransactionModel>> testeconsulta() async {
    List<TransactionModel> lista = [];
    try {
      await firebaseRepository.store
          .collection('users')
          .doc(firebaseRepository.auth.currentUser!.uid)
          .collection('transactions')
          .get()
          .then((querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          lista = querySnapshot.docs
              .map(
                (doc) => TransactionModel.fromMap(
                  doc.data(),
                ),
              )
              .toList();
        }
      });
      return lista;
    } catch (e) {
      throw e;
    }
  }

  Future<List> read(String id) async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firebaseRepository.store
          .collection('transactions')
          .where('id', isEqualTo: id)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "id": doc.id,
            "name": doc['name'],
            "type": doc['type'],
          };
          docs.add(a);
          print(a);
        }
        return docs;
      } else {
        return docs;
      }
    } catch (e) {
      throw (e);
    }
  }
}
