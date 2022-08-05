import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyba/pages/Home_page.dart';
import 'package:tyba/providers/UiProvider.dart';

import 'pages/University_page.dart';
import 'providers/UniversityProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UniversityProvider()),
        ChangeNotifierProvider(create: (_) => UiProvider())
      ],
      child: MaterialApp(
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'university': (_) => UniversityPage()
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
            iconTheme: IconThemeData(color: Colors.black87),
            appBarTheme: AppBarTheme(backgroundColor: Colors.indigo[300])),
      ),
    );
  }
}
