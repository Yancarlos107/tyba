import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyba/pages/List_page.dart';
import 'package:tyba/pages/grid_page.dart';

import '../models/university_model.dart';
import '../providers/UiProvider.dart';
import '../providers/UniversityProvider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final universityProvider = Provider.of<UniversityProvider>(context);
    final uiProvider = Provider.of<UiProvider>(context);
    var currentIndex = uiProvider.selectMenuOpt;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Universities'),
          actions: [
            IconButton(
                onPressed: () {
                  uiProvider.selectMenuOpt = !currentIndex;
                },
                icon: const Icon(Icons.grid_view))
          ],
        ),
        body: FutureBuilder(
          future: universityProvider.getJsonData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const _HomeScreenBody();
            } else if (snapshot.hasError) {
              return const Center(child: Text('no hay data'));
            }

            // By default, show a loading spinner.
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final universityProvider = Provider.of<UniversityProvider>(context);
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectMenuOpt;

    switch (currentIndex) {
      case false:
        return List(universityProvider: universityProvider);
      case true:
        return Grid(universityProvider: universityProvider);
      default:
        return List(universityProvider: universityProvider);
    }
  }
}
