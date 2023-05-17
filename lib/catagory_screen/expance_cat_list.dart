import 'package:flutter/material.dart';

class expance extends StatelessWidget {
  const expance({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Card(
          color:const Color.fromARGB(66, 199, 186, 186) ,
          child: ListTile(
            title: Text('expance category list $index'),
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
