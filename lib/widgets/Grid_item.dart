import 'package:flutter/material.dart';
import 'package:tyba/models/university_model.dart';

class GridItem extends StatelessWidget {
  const GridItem({
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
      child: Container(
          decoration: BoxDecoration(border: Border.all()),
          margin: const EdgeInsets.all(5),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.school_outlined),
              Text(
                university.name,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          )),
    );
  }
}
