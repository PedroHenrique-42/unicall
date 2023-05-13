class RegisterModel {
  String id;
  String name;
  String address;
  String number;
  String complement;
  String service;
  String date;

  RegisterModel({
    required this.id,
    required this.name,
    required this.address,
    required this.number,
    required this.complement,
    required this.service,
    required this.date,
  });

  RegisterModel.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["nomeCliente"],
        address = map["enderecoCliente"],
        number = map["numeroCliente"],
        complement = map["complemento"],
        service = map["tipoInstalacao"],
        date = map["dataInstalacao"];

  static Map<Object, Object> toMap(RegisterModel model) {
    Map<Object, Object> map = {};

    map["id"] = model.id;
    map["nomeCliente"] = model.name;
    map["enderecoCliente"] = model.address;
    map["numeroCliente"] = model.number;
    map["complemento"] = model.complement;
    map["tipoInstalacao"] = model.service;
    map["dataInstalacao"] = model.date;

    return map;
  }
}
