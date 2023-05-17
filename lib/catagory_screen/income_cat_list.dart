import 'package:flutter/material.dart';

class Income extends StatelessWidget {
  const Income({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Card(
          color:const Color.fromARGB(66, 199, 186, 186) ,
          child: ListTile(
            title: Text('income category list $index'),
            trailing: const Icon(Icons.delete),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10,);
      },
      itemCount: 10,
    );
  }
}
