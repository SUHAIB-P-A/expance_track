import 'package:expance_tracker/models/categories/catagory_model.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Future<void> category_popup(BuildContext ctx) async {
  await showModalBottomSheet(
    showDragHandle: true,
    context: ctx,
    builder: (ctx1) {
      return Container(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'add item name'),
            ),
            const Row(
              children: [
                radiobutton(title: 'income', type: catagory_type.income),
                radiobutton(title: 'expance', type: catagory_type.expance),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("add"),
            ),
          ],
        ),
      );
    },
  );
}

// ignore: camel_case_types
class radiobutton extends StatelessWidget {
  final String title;
  final catagory_type type;

  const radiobutton({required this.title, required this.type, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<catagory_type>(
          value: type,
          groupValue: catagory_type.income,
          onChanged: (value) {},
        ),
        Text(title),
      ],
    );
  }
}
