// To parse this JSON data, do
//
//     final universities = universitiesFromJson(jsonString);

import 'dart:convert';

Universities universitiesFromJson(String str) =>
    Universities.fromJson(json.decode(str));

String universitiesToJson(Universities data) => json.encode(data.toJson());

class Universities {
  Universities({
    required this.alphaTwoCode,
    required this.domains,
    required this.country,
    this.stateProvince,
    required this.webPages,
    required this.name,
  });

  final String alphaTwoCode;
  final List<String> domains;
  final String country;
  final dynamic stateProvince;
  final List<String> webPages;
  final String name;

  factory Universities.fromJson(String str) =>
      Universities.fromMap(json.decode(str));

  factory Universities.fromMap(Map<String, dynamic> json) => Universities(
        alphaTwoCode: json["alpha_two_code"],
        domains: List<String>.from(json["domains"].map((x) => x)),
        country: json["country"],
        stateProvince: json["state-province"],
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "alpha_two_code": alphaTwoCode,
        "domains": List<dynamic>.from(domains.map((x) => x)),
        "country": country,
        "state-province": stateProvince,
        "web_pages": List<dynamic>.from(webPages.map((x) => x)),
        "name": name,
      };
}
