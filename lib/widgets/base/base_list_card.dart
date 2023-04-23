import 'package:flutter/material.dart';
import 'package:unicall/constants/base_colors.dart';
import 'package:unicall/dao/registers_dao.dart';
import 'package:unicall/models/RegisterModel.dart';

class BaseListCard extends StatelessWidget {
  final Widget content;
  final double? width;
  final double? height;
  final void Function()? deleteFunc;
  final void Function()? editFunc;
  final RegistersDao dao = RegistersDao.getInstance();


  BaseListCard({
    required this.content,
    required this.deleteFunc,
    required this.editFunc,
    this.width,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        color: primaryYellow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: content,
            ),
            Container(
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: deleteFunc,
                    icon: const Icon(
                      Icons.delete,
                      color: primaryRed,
                    ),
                  ),
                  IconButton(
                    onPressed: editFunc,
                    icon: const Icon(
                      Icons.edit,
                      color: primaryYellow,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}