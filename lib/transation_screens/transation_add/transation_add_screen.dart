// ignore_for_file: non_constant_identifier_names

import 'package:expance_tracker/Database/category_db/db_category.dart';
import 'package:expance_tracker/Database/transation_db/db_transation.dart';
import 'package:expance_tracker/models/categories/catagory_model.dart';
import 'package:expance_tracker/models/transations/transation_model.dart';
import 'package:flutter/material.dart';

class screentransationadd extends StatefulWidget {
  static const routename = "transation-add";
  const screentransationadd({super.key});

  @override
  State<screentransationadd> createState() => _screentransationaddState();
}

class _screentransationaddState extends State<screentransationadd> {
  final _purposetexteditingcontroller = TextEditingController();
  final _amouttexteditingcontroller = TextEditingController();

  DateTime? _selecteddatetime;
  catagory_type? _selectedcatagory;
  Category_Model? _selectedcategorymodel;

  String? _dropdowncategoryid;

  @override
  void initState() {
    _selectedcatagory = catagory_type.income;
    super.initState();
  }

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
                  const SizedBox(
                    height: 30,
                  ),
                  const Center(
                    child: Text(
                      'ADD DATA',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //porpose
                  TextFormField(
                    controller: _purposetexteditingcontroller,
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
                    controller: _amouttexteditingcontroller,
                    keyboardType: TextInputType.number,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        onPressed: () async {
                          final _selectdatetemp = await showDatePicker(
                            keyboardType: TextInputType.numberWithOptions(),
                            confirmText: 'confirm',
                            cancelText: 'dismiss',
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 30)),
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
                        icon: const Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.black,
                        ),
                        label: Text(
                          _selecteddatetime == null
                              ? "SELECT DATE"
                              : _selecteddatetime.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //expance/income select
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Radio(
                            fillColor: MaterialStateProperty.all(Colors.black),
                            splashRadius: 20.0,
                            value: catagory_type.income,
                            groupValue: _selectedcatagory,
                            onChanged: (newvalue) {
                              setState(() {
                                _selectedcatagory = catagory_type.income;
                              });
                              _dropdowncategoryid = null;
                            },
                          ),
                          const Text(
                            "income",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            fillColor: MaterialStateProperty.all(Colors.black),
                            splashRadius: 20.0,
                            value: catagory_type.expance,
                            groupValue: _selectedcatagory,
                            onChanged: (newvalue) {
                              setState(() {
                                _selectedcatagory = catagory_type.expance;
                              });
                              _dropdowncategoryid = null;
                            },
                          ),
                          const Text(
                            "expance",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  //categorydropduwn
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DecoratedBox(
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1.0,
                              style: BorderStyle.solid,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 0.0),
                          child: DropdownButton(
                            borderRadius: BorderRadius.circular(10),
                            dropdownColor: Colors.grey,
                            underline: const SizedBox(),
                            hint: const Text(
                              'select category',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            value: _dropdowncategoryid,
                            items: (_selectedcatagory == catagory_type.income
                                    ? catagory_db
                                        .instance.incomecotegorylistlistner
                                    : catagory_db
                                        .instance.expancecotegorylistlistner)
                                .value
                                .map(
                              (e) {
                                return DropdownMenuItem(
                                  onTap: () {
                                    _selectedcategorymodel = e;
                                  },
                                  value: e.id,
                                  child: Text(
                                    e.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                            onChanged: (selectedvalue) {
                              setState(() {
                                _dropdowncategoryid = selectedvalue;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          addtransation();
                          funcTransation.instance.refreshui();
                          Navigator.of(context).pop();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white24),
                        ),
                        child: const Text(
                          "submit",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addtransation() async {
    final _purposetext = _purposetexteditingcontroller.text;
    final _amounttext = _amouttexteditingcontroller.text;
    if (_purposetext.isEmpty) {
      return;
    }
    if (_amounttext.isEmpty) {
      return;
    }
    if (_dropdowncategoryid == null) {
      return;
    }
    if (_selecteddatetime == null) {
      return;
    }

    final _parsedamount = double.tryParse(_amounttext);
    if (_parsedamount == null) {
      return;
    }
    if (_selectedcategorymodel == null) {
      return;
    }
    // _selecteddatetime;
    //_selectedcatagory;
    //_dropdowncategoryid;

    final _Model = TransationModel(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      purpos: _purposetext,
      amount: _parsedamount,
      date: _selecteddatetime!,
      type: _selectedcatagory!,
      listitemscategory: _selectedcategorymodel!,
    );
    funcTransation.instance.addtransations(_Model);
  }
}
