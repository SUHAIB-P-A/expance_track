import 'package:expance_tracker/Database/budget/func_budget.dart';
import 'package:expance_tracker/Database/category_db/db_category.dart';
import 'package:expance_tracker/Database/transation_db/db_transation.dart';
//import 'package:expance_tracker/main.dart';
import 'package:expance_tracker/models/budget/budgetmodel.dart';
import 'package:expance_tracker/models/categories/catagory_model.dart';
//import 'package:expance_tracker/transation_screens/updatetransscreen/updatetransationscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

final budgetNotifier = ValueNotifier<double>(0);

double totalExpense = 0.0;

// ignore: camel_case_types
class scr_tarnsations extends StatelessWidget {
  scr_tarnsations({super.key});
  final budgeteditingcontroller = TextEditingController();
  // double budgetBalance = budgetNotifier.value - totalExpense;

  @override
  Widget build(BuildContext context) {
    funcTransation.instance.refreshui();
    catagory_db.instance.refreshUI();

    final transList = funcTransation.instance.transationlistnotifier.value;
 totalExpense = 0.0;
    transList.forEach((translist) {
      
      if (translist.type == catagory_type.expance) {
        totalExpense += translist.amount;
        
      } 
    });

  final budget=  budgetNotifier.value - totalExpense;

    return ValueListenableBuilder(
      valueListenable: funcTransation.instance.transationlistnotifier,
      builder: (ctx, newvalue, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Slidable(
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (ctx) {
                      _dialogBuilder(context);
                    },
                    icon: Icons.add,
                  ),
                ],
              ),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (ctx) {
                      cleardb();
                    },
                    icon: Icons.clear_outlined,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Card(
                    elevation: 50.0,
                    surfaceTintColor: const Color.fromARGB(255, 208, 80, 247),
                    child: Container(
                      color: const Color.fromARGB(179, 230, 225, 232),
                      height: 100,
                      width: 382,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ValueListenableBuilder(
                            valueListenable: budgetNotifier,
                            builder: (BuildContext context, value, Widget? _) {
                              return Text(
                                  'monthly budget \n           ${value}');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  elevation: 50.0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  surfaceTintColor: const Color.fromARGB(255, 208, 80, 247),
                  child: Container(
                    color: const Color.fromARGB(179, 230, 225, 232),
                    height: 80,
                    width: 382,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('total expence \n       ${totalExpense}'),
                      ],
                    ),
                  ),
                ),
                // Card(
                //   elevation: 50.0,
                //   surfaceTintColor: const Color.fromARGB(255, 208, 80, 247),
                //   child: Container(
                //     color: const Color.fromARGB(179, 230, 225, 232),
                //     height: 80,
                //     width: 185,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Text(
                //             'budget balance\n       ${budget}'),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.separated(
                  physics: const ScrollPhysics(
                    parent: ScrollPhysics(),
                  ),
                  shrinkWrap: false,
                  itemBuilder: (context, index) {
                    final translist = newvalue[index];
                    return Slidable(
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (ctx) {
                              funcTransation.instance
                                  .deletetransation(translist.id!);
                            },
                            icon: Icons.delete,
                          ),
                        ],
                      ),
                      // endActionPane: ActionPane(
                      //   motion: const ScrollMotion(),
                      //   children: [
                      //     SlidableAction(
                      //       onPressed: (context) {
                      //         Navigator.of(context)
                      //             .pushNamed(updatetransationsrc.routename);
                      //         funcTransation.instance
                      //             .deletetransation(translist.id!);
                      //       },
                      //       icon: Icons.border_color_outlined,
                      //     ),
                      //   ],
                      // ),
                      key: Key(translist.id!),
                      child: Card(
                        color: const Color.fromARGB(255, 244, 244, 244),
                        shadowColor: const Color.fromARGB(255, 17, 59, 213),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(179, 230, 225, 232),
                            radius: 50,
                            child: Text(
                              parsedate(translist.date),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.crimsonText(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          title: Text(
                            translist.purpos,
                            style:
                                GoogleFonts.anton(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            translist.listitemscategory.name,
                            //style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            '₹${translist.amount}',
                            style: TextStyle(
                              color: translist.type == catagory_type.income
                                  ? const Color.fromARGB(255, 12, 232, 20)
                                  : const Color.fromARGB(255, 240, 28, 8),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 0,
                    );
                  },
                  itemCount: newvalue.length,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  String parsedate(DateTime date) {
    final _date = DateFormat.MMMd().format(date);
    final _spliteddate = _date.split(' ');
    return '${_spliteddate.last}\n${_spliteddate.first}';
    //return '${date.day}\n${date.month}';
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('add your monthly budget!'),
          actions: <Widget>[
            TextFormField(
              controller: budgeteditingcontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Add amount',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                filled: true,
                fillColor: Colors.white24,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('add'),
              onPressed: () async {
                final String budgetText = budgeteditingcontroller.text;
                final double budgetValue = double.tryParse(budgetText) ?? 0.0;

                final add_db = Budget(
                  budget: budgetValue,
                  id: DateTime.now().microsecondsSinceEpoch.toString(),
                );
                addbudget(add_db);

                List<Budget> db_values = await getBudgetValue();
                for (var item in db_values) {
                  budgetNotifier.value = item.budget;
                }

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
