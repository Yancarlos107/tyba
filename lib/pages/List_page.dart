import 'package:flutter/material.dart';
import 'package:tyba/models/university_model.dart';

import '../providers/UniversityProvider.dart';
import '../widgets/List_item.dart';

class List extends StatefulWidget {
  const List({
    Key? key,
    required this.universityProvider,
  }) : super(key: key);

  final UniversityProvider universityProvider;

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  final controller = ScrollController();
  var index = 0;
  @override
  void initState() {
    index = 20;
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        index = index + 20;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: controller,
        itemCount: index,
        itemBuilder: (_, i) =>
            ListItem(university: widget.universityProvider.universities[i]));
  }
}
