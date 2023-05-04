import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unicall/constants/strings.dart';
import 'package:unicall/models/RegisterModel.dart';

class RegistersDao {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final List<RegisterModel> _list = [];

  static final RegistersDao _instance = RegistersDao();

  static RegistersDao getInstance() => _instance;

  Future<List<RegisterModel>> loadRegisters() async {
    _list.clear();

    await firestore.collection(firestoreCollectionPath).get().then((collection) {
      for (var doc in collection.docs) {
        _list.add(RegisterModel.fromMap(doc.data()));
      }
    });

    return _list;
  }

  int count() {
    return _list.length;
  }

  RegisterModel get(int index) {
    return _list[index];
  }

  void add(RegisterModel model) {
    firestore.collection(firestoreCollectionPath).doc(model.id).set({
      "id": model.id,
      "nomeCliente": model.name,
      "enderecoCliente": model.address,
      "complemento": model.complement,
      "tipoInstalacao": model.service,
      "dataInstalacao": model.date,
    });
  }

  void remove(RegisterModel model) async {
    await firestore.collection(firestoreCollectionPath).doc(model.id).delete();
  }

  void edit(RegisterModel model) async {
    await firestore.collection(firestoreCollectionPath).doc(model.id).update(
          RegisterModel.toMap(model),
        );
  }
}
