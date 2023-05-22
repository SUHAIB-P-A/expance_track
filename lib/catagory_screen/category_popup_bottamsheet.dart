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
        color: Color.fromARGB(240, 228, 223, 223),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            clipBehavior: Clip.antiAlias,
            surfaceTintColor: Color.fromARGB(142, 93, 89, 89),
            shadowColor: const Color.fromARGB(96, 108, 101, 101),
            color: const Color.fromARGB(66, 199, 186, 186),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: categorynameeditingcontroller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Add Category Item',
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      filled: true,
                      fillColor: Colors.white24,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const Row(
                    children: [
                      radiobutton(title: 'income', type: catagory_type.income),
                      radiobutton(
                          title: 'expance', type: catagory_type.expance),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(66, 199, 186, 186),
                      ),
                    ),
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
                        categorynameeditingcontroller.clear();
                      }
                    },
                    child: const Text("add"),
                  ),
                ],
              ),
            ),
          ),
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
