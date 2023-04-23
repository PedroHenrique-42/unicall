class RegisterModel {
  String id;
  String name;
  String address;
  String service;
  String date;

  RegisterModel(this.id, this.name, this.address, this.service, this.date);

  RegisterModel.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["nomeCliente"],
        address = map["enderecoCliente"],
        service = map["tipoInstalacao"],
        date = map["dataInstalacao"];

  static Map<Object, Object> toMap(RegisterModel model) {
    Map<Object, Object> map = {};

    map["id"] = model.id;
    map["nomeCliente"] = model.name;
    map["enderecoCliente"] = model.address;
    map["tipoInstalacao"] = model.service;
    map["dataInstalacao"] = model.date;

    return map;
  }
}
