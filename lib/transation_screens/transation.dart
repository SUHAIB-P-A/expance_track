import 'package:flutter/material.dart';

class scr_tarnsations extends StatelessWidget {
  const scr_tarnsations({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: false,
      itemBuilder: (context, index) {
        return const ListTile(
          leading: CircleAvatar(
            radius: 50,
            child: Text("12\ndec"),
          ),
          title: Text('RS 200'),
          subtitle: Text('tarvel'),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: 10,
    );
  }
}
