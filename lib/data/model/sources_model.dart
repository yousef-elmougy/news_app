// To parse this JSON data, do
//
//     final sourcesResponse = sourcesResponseFromJson(jsonString);

import 'dart:convert';

// SourcesResponse sourcesResponseFromJson(String str) => SourcesResponse.fromJson(json.decode(str));
//
// String sourcesResponseToJson(SourcesResponse data) => json.encode(data.toJson());

class SourcesResponse {
  SourcesResponse({
    this.status,
    this.sources,
  });

  final String ?status;
  final List<Sources>? sources;

  factory SourcesResponse.fromJson(Map<String, dynamic> json) => SourcesResponse(
    status: json["status"],
    sources: json["sources"] == null ? null : List<Sources>.from(json["sources"].map((x) => Sources.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "sources": sources == null ? null : List<dynamic>.from(sources!.map((x) => x.toJson())),
  };
}

class Sources {
  Sources({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  final String? id;
  final String? name;
  final String? description;
  final String? url;
  final String? category;
  final String? language;
  final String? country;

  factory Sources.fromJson(Map<String, dynamic> json) => Sources(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    url: json["url"],
    category: json["category"] ,
    language: json["language"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "url": url,
    "category": category ,
    "language": language,
    "country": country,
  };
}



