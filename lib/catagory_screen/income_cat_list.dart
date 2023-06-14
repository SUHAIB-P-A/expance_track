import 'package:flutter/material.dart';

import '../Database/category_db/db_category.dart';

class Income extends StatelessWidget {
  const Income({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: catagory_db().incomecotegorylistlistner,
      builder: (context, newlist, _) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final categoryexp = newlist[index];
            return Card(
              color: const Color.fromARGB(255, 244, 244, 244),
              child: ListTile(
                title: Text(categoryexp.name),
                trailing: IconButton(
                  onPressed: () {
                    catagory_db.instance.deletecategory(categoryexp.id);
                  },
                  icon: const Icon(Icons.delete,color: Colors.black,),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: newlist.length,
        );
      },
    );
  }
}
