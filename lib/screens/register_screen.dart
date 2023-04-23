import 'package:flutter/material.dart';
import 'package:unicall/dao/registers_dao.dart';
import 'package:unicall/models/RegisterModel.dart';
import 'package:unicall/widgets/base/base_button.dart';
import 'package:unicall/widgets/base/base_card.dart';
import 'package:unicall/widgets/base/base_layout.dart';
import 'package:unicall/widgets/base/base_text_field.dart';
import 'package:uuid/uuid.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterModel? model;
  final String? action;
  final int? index;

  RegisterScreen({this.model, this.action, this.index, super.key});

  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _serviceController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (model != null) {
      _nameController.text = model!.name;
      _addressController.text = model!.address;
      _serviceController.text = model!.service;
      _dateController.text = model!.date;
    }

    return BaseLayout(
      appBarTitle: "Cadastro",
      body: SingleChildScrollView(
        child: BaseCard(
          width: MediaQuery.of(context).size.width * 0.8,
          content: Form(
            key: _formKey,
            child: Column(children: [
              Text(
                "Formulário de Cadastro",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              BaseTextField(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                controller: _nameController,
                text: "Digite seu nome",
              ),
              BaseTextField(
                margin: const EdgeInsets.only(bottom: 20),
                controller: _addressController,
                text: "Digite seu endereço",
              ),
              BaseTextField(
                margin: const EdgeInsets.only(bottom: 20),
                controller: _serviceController,
                text: "Digite o serviço",
              ),
              BaseTextField(
                margin: const EdgeInsets.only(bottom: 20),
                controller: _dateController,
                text: "Digite a data",
              ),
              SizedBox(
                width: 120,
                child: BaseButton(action!, () {
                  if (_formKey.currentState!.validate()) {
                    RegistersDao dao = RegistersDao.getInstance();

                    if (action == "Cadastrar") {
                      dao.add(RegisterModel(
                        const Uuid().v1().toString(),
                        _nameController.text,
                        _addressController.text,
                        _serviceController.text,
                        _dateController.text,
                      ));
                    } else if (action == "Editar") {
                      dao.edit(RegisterModel(
                        model!.id,
                        _nameController.text,
                        _addressController.text,
                        _serviceController.text,
                        _dateController.text,
                      ));
                    }
                  }
                }),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
