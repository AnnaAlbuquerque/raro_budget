import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:raro_budget/src/shared/auth/repositories/firebase_repository.dart';
import 'package:raro_budget/src/shared/models/transaction_module.dart';

class FirebaseModel {
  FirebaseRepository firebaseRepository;
  FirebaseModel(
    this.firebaseRepository,
  );

  Future<void> insert(TransactionModule transaction) async {
    try {
      await firebaseRepository.store
          .collection('users')
          .doc(firebaseRepository.auth.currentUser!.uid)
          .collection('transactions')
          .add({
        'category': transaction.category,
        'type': transaction.type,
        'name': transaction.name,
        'date': transaction.date,
        'valor': transaction.value,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(TransactionModule transaction) async {
    try {
      await firebaseRepository.store
          .collection('users')
          .doc(firebaseRepository.auth.currentUser!.uid)
          .collection('transactions')
          .where('type', isEqualTo: transaction.type)
          .where('valor', isEqualTo: transaction.value)
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

  Future<void> update(TransactionModule transaction,
      TransactionModule transactionupdated) async {
    try {
      await firebaseRepository.store
          .collection('users')
          .doc(firebaseRepository.auth.currentUser!.uid)
          .collection('transactions')
          .where('type', isEqualTo: transaction.type)
          .where('valor', isEqualTo: transaction.value)
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
                  'valor': transactionupdated.value,
                  'category': transactionupdated.category
                }).then((value) {
                  print("Success!");
                });
              }));
    } catch (e) {
      print(e);
    }
  }

  Future<List<TransactionModule>?> testeconsulta() async {
    try {
      firebaseRepository.store
          .collection('users')
          .doc(firebaseRepository.auth.currentUser!.uid)
          .collection('transactions')
          .get()
          .then((querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          final List<TransactionModule> list = querySnapshot.docs
              .map(
                (doc) => TransactionModule.fromMap(
                  doc.data(),
                ),
              )
              .toList();
          print(list);
          //doc.data()).toList();

          // print(transactionList);
          return list;
        } else {
          return null;
        }
      });
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
            "date": doc['date']
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
