import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tyba/models/university_model.dart';

class UniversityProvider extends ChangeNotifier {
  List<Universities> universities = [];

  UniversityProvider() {
    getJsonData();
  }

  Future<List<Universities>> getJsonData() async {
    final response = await http.get(Uri.parse(
        'https://tyba-assets.s3.amazonaws.com/FE-Engineer-test/universities.json'));

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      universities =
          List.from(responseJson.map((x) => Universities.fromMap(x)));
      return universities;
    } else {
      throw Exception('Failed to load Universities');
    }
  }
}
