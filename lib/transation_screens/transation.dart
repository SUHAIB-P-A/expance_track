import 'package:flutter/material.dart';

class scr_tarnsations extends StatelessWidget {
  const scr_tarnsations({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.separated(
        physics: const ScrollPhysics(
          parent: ScrollPhysics(),
        ),
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return const Card(
            shadowColor: Color.fromARGB(255, 112, 110, 110),
            child: ListTile(
              leading: CircleAvatar(
                radius: 50,
                child: Text(
                  "12\ndec",
                  textAlign: TextAlign.center,
                ),
              ),
              title: Text('RS 200'),
              subtitle: Text('tarvel'),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 10,
      ),
    );
  }
}
