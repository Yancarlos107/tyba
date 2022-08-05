import 'package:flutter/material.dart';

import '../providers/UniversityProvider.dart';
import '../widgets/Grid_item.dart';

class Grid extends StatefulWidget {
  const Grid({
    Key? key,
    required this.universityProvider,
  }) : super(key: key);

  final UniversityProvider universityProvider;

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
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
    return GridView.builder(
      controller: controller,
      itemCount: index,
      itemBuilder: (_, i) =>
          GridItem(university: widget.universityProvider.universities[i]),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),

      // By default, show a loading spinner.
    );
  }
}
