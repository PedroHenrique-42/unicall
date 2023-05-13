import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:unicall/constants/base_colors.dart';
import 'package:unicall/constants/strings.dart';
import 'package:unicall/dao/registers_dao.dart';
import 'package:unicall/models/RegisterModel.dart';
import 'package:unicall/widgets/base/base_button.dart';
import 'package:unicall/widgets/base/base_card.dart';
import 'package:unicall/widgets/base/base_layout.dart';
import 'package:unicall/widgets/base/base_text_field.dart';
import 'package:uuid/uuid.dart';

class RegisterScreen extends StatefulWidget {
  final RegisterModel? model;
  final String action;
  final int? index;

  const RegisterScreen(
      {this.model, required this.action, this.index, super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _numberController = TextEditingController();

  final TextEditingController _complementController = TextEditingController();

  final TextEditingController _serviceController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.model != null) {
      setFieldValue(_nameController, widget.model!.name);
      setFieldValue(_addressController, widget.model!.address);
      setFieldValue(_numberController, widget.model!.number);
      setFieldValue(_complementController, widget.model!.complement);
      setFieldValue(_serviceController, widget.model!.service);
      setFieldValue(_dateController, widget.model!.date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appBarTitle: widget.action,
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
                keyboardType: TextInputType.text,
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
                keyboardType: TextInputType.text,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Campo obrigatório";
                  }
                  return null;
                },
              ),
              BaseTextField(
                margin: const EdgeInsets.only(bottom: 20),
                controller: _numberController,
                text: "Digite o número",
                keyboardType: TextInputType.number,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Campo obrigatório";
                  }
                  return null;
                },
              ),
              BaseTextField(
                margin: const EdgeInsets.only(bottom: 20),
                controller: _complementController,
                text: "Digite o complemento",
                keyboardType: TextInputType.text,
              ),
              BaseTextField(
                margin: const EdgeInsets.only(bottom: 20),
                controller: _serviceController,
                text: "Escolha o serviço",
                readOnly: true,
                keyboardType: TextInputType.text,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Campo obrigatório";
                  }
                  return null;
                },
                suffixIcon: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    items: const [
                      DropdownMenuItem(
                        value: "Fibra",
                        child: Text("Fibra"),
                      ),
                      DropdownMenuItem(
                        value: "Banda-larga",
                        child: Text("Banda-larga"),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        _serviceController.text = value.toString();
                      }
                    },
                  ),
                ),
              ),
              BaseTextField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  DataInputFormatter(),
                ],
                margin: const EdgeInsets.only(bottom: 20),
                controller: _dateController,
                text: "Digite a data",
                keyboardType: TextInputType.number,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Campo obrigatório";
                  }

                  DateFormat brazilianDateFormat = DateFormat('dd/MM/yyyy');
                  DateTime data = brazilianDateFormat.parse(value);

                  if (data.isBefore(DateTime.now()) ||
                      data.isAfter(
                          DateTime.now().add(const Duration(days: 30)))) {
                    return "Data inválida";
                  }

                  return null;
                },
                suffixIcon: IconButton(
                  icon: const Icon(Icons.date_range_sharp),
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now().add(const Duration(days: 1)),
                      firstDate: DateTime.now().add(const Duration(days: 1)),
                      lastDate: DateTime.now().add(const Duration(days: 30)),
                    ).then((value) {
                      if (value != null) {
                        DateFormat brazilianDateFormat = DateFormat('dd/MM/yyyy');
                        final date = DateTime.parse(value.toString());
                        _dateController.text = brazilianDateFormat.format(date);
                      }
                    });
                  },
                ),
              ),
              SizedBox(
                width: 120,
                child: BaseButton(widget.action, () {
                  if (_formKey.currentState!.validate()) {
                    RegistersDao dao = RegistersDao.getInstance();

                    if (widget.action == registerAction) {
                      dao.addRegister(RegisterModel(
                        id: const Uuid().v1().toString(),
                        name: _nameController.text,
                        address: _addressController.text,
                        number: _numberController.text,
                        complement: _complementController.text,
                        service: _serviceController.text,
                        date: _dateController.text,
                      ));

                      clearForm();
                      showSnackBar(context, "cadastrado");
                    } else if (widget.action == editAction) {
                      dao.editRegister(RegisterModel(
                        id: widget.model!.id,
                        name: _nameController.text,
                        address: _addressController.text,
                        number: _numberController.text,
                        complement: _complementController.text,
                        service: _serviceController.text,
                        date: _dateController.text,
                      ));

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
    );

    controller.selection =
        TextSelection.collapsed(offset: controller.text.length);
  }

  clearForm() {
    _nameController.text = "";
    _addressController.text = "";
    _numberController.text = "";
    _complementController.text = "";
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
