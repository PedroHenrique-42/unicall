import 'package:flutter/material.dart';
import 'package:unicall/constants/base_colors.dart';
import 'package:unicall/constants/strings.dart';
import 'package:unicall/dao/registers_dao.dart';
import 'package:unicall/models/RegisterModel.dart';
import 'package:unicall/screens/register_screen.dart';
import 'package:unicall/widgets/base/base_layout.dart';
import 'package:unicall/widgets/base/base_list_card.dart';

class ListRegistersScreen extends StatefulWidget {
  const ListRegistersScreen({super.key});

  @override
  State<ListRegistersScreen> createState() => _ListRegistersScreenState();
}

class _ListRegistersScreenState extends State<ListRegistersScreen> {
  List<RegisterModel> list = [];
  final RegistersDao dao = RegistersDao.getInstance();

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appBarTitle: "Consulta",
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width * 0.85,
        child: FutureBuilder(
            future: refresh(),
            builder: (context, snapshot) {
              if (list.isNotEmpty) {
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    RegisterModel actualModel = list[index];
                    return BaseListCard(
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nome do cliente: ${actualModel.name}"),
                          Text("Endereço do cliente: ${actualModel.address}"),
                          Text("Tipo de instalação: ${actualModel.service}"),
                          Text("Data da instalação: ${actualModel.date}"),
                        ],
                      ),
                      deleteFunc: () {
                        dao.remove(actualModel);

                        setState(() {});
                      },
                      editFunc: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(
                              action: editAction,
                              index: index,
                              model: actualModel,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const LinearProgressIndicator(color: primaryYellow);
              } else {
                return Center(
                  child: Text(
                    listScreenNoRegistersText,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                );
              }
            }),
      ),
    );
  }

  Future<bool> refresh() async {
    list = [];
    list = await dao.loadRegisters();

    return true;
  }
}
