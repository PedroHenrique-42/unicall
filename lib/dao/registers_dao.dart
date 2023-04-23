import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unicall/models/RegisterModel.dart';

class RegistersDao {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final List<RegisterModel> _list = [];

  static final RegistersDao _instance = RegistersDao();

  static RegistersDao getInstance() => _instance;

  Future<List<RegisterModel>> loadRegisters() async {
    _list.clear();

    var fireBaseList = await firestore.collection("registros").get();

    for (var doc in fireBaseList.docs) {
      _list.add(RegisterModel.fromMap(doc.data()));
    }

    return _list;
  }

  int count() {
    return _list.length;
  }

  RegisterModel get(int index) {
    return _list[index];
  }

  void add(RegisterModel model) {
    firestore.collection("registros").doc(model.id).set({
      "id": model.id,
      "nomeCliente": model.name,
      "enderecoCliente": model.address,
      "tipoInstalacao": model.service,
      "dataInstalacao": model.date,
    });
  }

  void remove(RegisterModel model) async {
    await firestore.collection("registros").doc(model.id).delete();

    _list.remove(model);
  }

  void edit(RegisterModel model) {
    firestore.collection("registros").doc(model.id).update(
          RegisterModel.toMap(model),
        );
  }
}
