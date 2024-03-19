

import 'dart:convert';

List<UniversityModal> universityModalFromJson(String str) => List<UniversityModal>.from(json.decode(str).map((x) => UniversityModal.fromJson(x)));

String universityModalToJson(List<UniversityModal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UniversityModal {
  String alphaTwoCode;
  List<String> webPages;
  dynamic stateProvince;
  String name;
  List<String> domains;
  String country;

  UniversityModal({
    required this.alphaTwoCode,
    required this.webPages,
    required this.stateProvince,
    required this.name,
    required this.domains,
    required this.country,
  });

  factory UniversityModal.fromJson(Map<String, dynamic> json) => UniversityModal(
    alphaTwoCode: json["alpha_two_code"],
    webPages: List<String>.from(json["web_pages"].map((x) => x)),
    stateProvince: json["state-province"],
    name: json["name"],
    domains: List<String>.from(json["domains"].map((x) => x)),
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "alpha_two_code": alphaTwoCode,
    "web_pages": List<dynamic>.from(webPages.map((x) => x)),
    "state-province": stateProvince,
    "name": name,
    "domains": List<dynamic>.from(domains.map((x) => x)),
    "country": country,
  };
}
