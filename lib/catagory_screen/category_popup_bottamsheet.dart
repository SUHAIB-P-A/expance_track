import 'package:expance_tracker/Database/category_db/db_category.dart';
import 'package:expance_tracker/models/categories/catagory_model.dart';
import 'package:flutter/material.dart';

final categorynameeditingcontroller = TextEditingController();
ValueNotifier<catagory_type> selectcategory =
    ValueNotifier(catagory_type.income);
// ignore: non_constant_identifier_names
Future<void> category_popup(BuildContext ctx) async {
  await showModalBottomSheet(
    showDragHandle: true,
    context: ctx,
    builder: (ctx1) {
      // ignore: avoid_unnecessary_containers
      return Container(
        child: Column(
          children: [
            TextFormField(
              controller: categorynameeditingcontroller,
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
              onPressed: () {
                final _name = categorynameeditingcontroller.text;
                if (_name.isEmpty) {
                  return;
                } else {
                  final _type = selectcategory.value;
                  final categorypress = Category_Model(
                    id: DateTime.now().microsecondsSinceEpoch.toString(),
                    name: _name,
                    type: _type,
                  );
                  catagory_db.instance.insert_category(categorypress);
                  Navigator.of(ctx1).pop();
                }
              },
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
        ValueListenableBuilder(
          valueListenable: selectcategory,
          builder: (context, newcategory, child) {
            return Radio<catagory_type>(
              value: type,
              groupValue: newcategory,
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                selectcategory.value = value;
                selectcategory.notifyListeners();
              },
            );
          },
        ),
        Text(title),
      ],
    );
  }
}
