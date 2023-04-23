import 'package:flutter/material.dart';
import 'package:unicall/constants/base_colors.dart';
import 'package:unicall/constants/strings.dart';
import 'package:unicall/dao/registers_dao.dart';
import 'package:unicall/models/RegisterModel.dart';
import 'package:unicall/widgets/base/base_button.dart';
import 'package:unicall/widgets/base/base_card.dart';
import 'package:unicall/widgets/base/base_layout.dart';
import 'package:unicall/widgets/base/base_text_field.dart';
import 'package:uuid/uuid.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterModel? model;
  final String action;
  final int? index;

  RegisterScreen({this.model, required this.action, this.index, super.key});

  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _serviceController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (model != null) {
      setFieldValue(_nameController, model!.name);
      setFieldValue(_addressController, model!.address);
      setFieldValue(_serviceController, model!.service);
      setFieldValue(_dateController,  model!.date);
    }

    return BaseLayout(
      appBarTitle: action,
      body: SingleChildScrollView(
        child: BaseCard(
          width: MediaQuery.of(context).size.width * 0.8,
          content: Form(
            key: _formKey,
            child: Column(children: [
              Text(
                "Preencha o formulário abaixo",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              BaseTextField(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                controller: _nameController,
                text: "Digite o nome do cliente",
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Campo obrigatório";
                  }
                  return null;
                },
              ),
              BaseTextField(
                margin: const EdgeInsets.only(bottom: 20),
                controller: _addressController,
                text: "Digite o endereço",
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Campo obrigatório";
                  }
                  return null;
                },
              ),
              BaseTextField(
                margin: const EdgeInsets.only(bottom: 20),
                controller: _serviceController,
                text: "Digite o serviço",
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Campo obrigatório";
                  }
                  return null;
                },
              ),
              BaseTextField(
                margin: const EdgeInsets.only(bottom: 20),
                controller: _dateController,
                text: "Digite a data",
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Campo obrigatório";
                  }
                  return null;
                },
              ),
              SizedBox(
                width: 120,
                child: BaseButton(action, () {
                  if (_formKey.currentState!.validate()) {
                    RegistersDao dao = RegistersDao.getInstance();

                    if (action == registerAction) {
                      dao.add(RegisterModel(
                        const Uuid().v1().toString(),
                        _nameController.text,
                        _addressController.text,
                        _serviceController.text,
                        _dateController.text,
                      ));

                      clearForm();
                      showSnackBar(context, "cadastrado");
                    } else if (action == editAction) {
                      dao.edit(RegisterModel(
                        model!.id,
                        _nameController.text,
                        _addressController.text,
                        _serviceController.text,
                        _dateController.text,
                      ));

                      // clearForm();
                      showSnackBar(context, "editado");
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

  setFieldValue(TextEditingController controller, String text) {
    controller.value = TextEditingValue(
      text: text,
      selection: TextSelection.fromPosition(
        TextPosition(offset: text.length),
      ),
    );
  }

  clearForm() {
    _nameController.text = "";
    _addressController.text = "";
    _serviceController.text = "";
    _dateController.text = "";
  }

  showSnackBar(BuildContext context, String action) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: primaryYellow,
        content: Text(
          "Produto $action com sucesso!",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
