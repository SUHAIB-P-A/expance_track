import 'package:expance_tracker/Database/category_db/db_category.dart';
import 'package:expance_tracker/Database/transation_db/db_transation.dart';
import 'package:expance_tracker/models/categories/catagory_model.dart';
import 'package:expance_tracker/transation_screens/updatetransscreen/updatetransationscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class scr_tarnsations extends StatelessWidget {
  const scr_tarnsations({super.key});

  @override
  Widget build(BuildContext context) {
    funcTransation.instance.refreshui();
    catagory_db.instance.refreshUI();
    return ValueListenableBuilder(
      valueListenable: funcTransation.instance.transationlistnotifier,
      builder: (ctx, newvalue, _) {
        return Padding(
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
                        funcTransation.instance.deletetransation(translist.id!);
                      },
                      icon: Icons.delete,
                    ),
                  ],
                ),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        Navigator.of(context)
                            .pushNamed(updatetransationsrc.routename);
                        funcTransation.instance.deletetransation(translist.id!);
                      },
                      icon: Icons.border_color_outlined,
                    ),
                  ],
                ),
                key: Key(translist.id!),
                child: Card(
                  color: const Color.fromARGB(255, 244, 244, 244),
                  shadowColor: const Color.fromARGB(255, 17, 59, 213),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
                      style: GoogleFonts.anton(fontWeight: FontWeight.bold),
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
}
