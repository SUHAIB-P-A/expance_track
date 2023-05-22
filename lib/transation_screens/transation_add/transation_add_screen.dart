import 'package:expance_tracker/Database/category_db/db_category.dart';
import 'package:expance_tracker/models/categories/catagory_model.dart';
import 'package:flutter/material.dart';

class screentransationadd extends StatefulWidget {
  static const routename = "transation-add";
  const screentransationadd({super.key});

  @override
  State<screentransationadd> createState() => _screentransationaddState();
}

class _screentransationaddState extends State<screentransationadd> {
  DateTime? _selecteddatetime;
  catagory_type? _selectedcatagory;
  Category_Model? _selectedcategorymodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(66, 199, 186, 186),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: const Color.fromARGB(66, 199, 186, 186),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //porpose
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Add purpose',
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
                  const SizedBox(
                    height: 10,
                  ),
                  //amount
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Add amount',
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
                  //date
                  TextButton.icon(
                    onPressed: () async {
                      final _selectdatetemp = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate:
                            DateTime.now().subtract(const Duration(days: 30)),
                        lastDate: DateTime.now(),
                      );
                      if (_selectdatetemp == null) {
                        return;
                      } else {
                        print(_selectdatetemp);
                        setState(() {
                          _selecteddatetime = _selectdatetemp;
                        });
                      }
                    },
                    icon: const Icon(Icons.calendar_month_outlined),
                    label: Text(_selecteddatetime == null
                        ? "select date"
                        : _selecteddatetime.toString()),
                  ),
                  //expance/income select
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: catagory_type.income,
                            groupValue: catagory_type.income,
                            onChanged: (newvalue) {},
                          ),
                          const Text("income")
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: catagory_type.expance,
                            groupValue: catagory_type.expance,
                            onChanged: (newvalue) {},
                          ),
                          const Text("expance")
                        ],
                      ),
                    ],
                  ),
                  //category
                  DropdownButton(
                    hint: const Text('select category'),
                    items: catagory_db.instance.incomecotegorylistlistner.value.map(
                      (e) {
                        return DropdownMenuItem(
                          value: e.id,
                          child: Text(e.name),
                        );
                      },
                    ).toList(),
                    onChanged: (selectedvalue) {
                      print('seleted value');
                    },
                  ),
                  ElevatedButton(
                    
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("submit"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
