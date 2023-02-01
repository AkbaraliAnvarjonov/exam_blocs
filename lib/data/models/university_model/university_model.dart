class UniversityModel {
  UniversityModel({
    required this.country,
    required this.domains,
    required this.alphaTwoCode,
    required this.stateProvince,
    required this.name,
    required this.webPages,
  });

  String country;
  List<String> domains;
  String alphaTwoCode;
  String stateProvince;
  String name;
  List<String> webPages;

  factory UniversityModel.fromJson(Map<String, dynamic> json) =>
      UniversityModel(
        country: json["country"] ?? "",
        domains: List<String>.from(json["domains"].map((x) => x)),
        alphaTwoCode: json["alpha_two_code"] ?? "",
        stateProvince: json["state-province"] ?? "",
        name: json["name"] ?? "",
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
      );
}
