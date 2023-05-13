import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unicall/constants/strings.dart';
import 'package:unicall/models/RegisterModel.dart';

class RegistersDao {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final List<RegisterModel> _registersList = [];

  static final RegistersDao _instance = RegistersDao();

  static RegistersDao getInstance() => _instance;

  Future<List<RegisterModel>> loadRegisters() async {
    _registersList.clear();

    await firestore
        .collection(firestoreCollectionPath)
        .get()
        .then((collection) {
      for (var doc in collection.docs) {
        _registersList.add(RegisterModel.fromMap(doc.data()));
      }
    });

    return _registersList;
  }

  RegisterModel getRegister(int index) {
    return _registersList[index];
  }

  void addRegister(RegisterModel model) {
    firestore.collection(firestoreCollectionPath).doc(model.id).set({
      "id": model.id,
      "nomeCliente": model.name,
      "enderecoCliente": model.address,
      "numeroCliente": model.number,
      "complemento": model.complement,
      "tipoInstalacao": model.service,
      "dataInstalacao": model.date,
    });
  }

  void removeRegister(RegisterModel model) async {
    await firestore.collection(firestoreCollectionPath).doc(model.id).delete();
  }

  void editRegister(RegisterModel model) async {
    await firestore.collection(firestoreCollectionPath).doc(model.id).update(
          RegisterModel.toMap(model),
    );
  }
}
