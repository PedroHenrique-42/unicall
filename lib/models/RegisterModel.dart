class RegisterModel {
  String id;
  String name;
  String address;
  String complement;
  String service;
  String date;

  RegisterModel({
    required this.id,
    required this.name,
    required this.address,
    required this.complement,
    required this.service,
    required this.date,
  });

  RegisterModel.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["nomeCliente"],
        address = map["enderecoCliente"],
        complement = map["complemento"],
        service = map["tipoInstalacao"],
        date = map["dataInstalacao"];

  static Map<Object, Object> toMap(RegisterModel model) {
    Map<Object, Object> map = {};

    map["id"] = model.id;
    map["nomeCliente"] = model.name;
    map["enderecoCliente"] = model.address;
    map["complemento"] = model.complement;
    map["tipoInstalacao"] = model.service;
    map["dataInstalacao"] = model.date;

    return map;
  }
}
