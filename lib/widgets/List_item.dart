import 'package:flutter/material.dart';
import 'package:tyba/models/university_model.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.university,
  }) : super(key: key);

  final Universities university;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'university', arguments: university);
      },
      child: ListTile(
        leading: const Icon(Icons.school_outlined),
        title: Text(
          university.name,
          style: const TextStyle(fontSize: 18),
        ),
        trailing: const Icon(Icons.chevron_right_outlined),
      ),
    );
  }
}
