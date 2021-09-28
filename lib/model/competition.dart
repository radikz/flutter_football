// To parse this JSON data, do
//
//     final competition = competitionFromJson(jsonString);

import 'dart:convert';

Competition competitionFromJson(String str) => Competition.fromJson(json.decode(str));

String competitionToJson(Competition data) => json.encode(data.toJson());

class Competition {
  Competition({
    required this.count,
    required this.filters,
    required this.competitions,
  });

  final int count;
  final Filters filters;
  final List<CompetitionElement> competitions;

  factory Competition.fromJson(Map<String, dynamic> json) => Competition(
    count: json["count"],
    filters: Filters.fromJson(json["filters"]),
    competitions: List<CompetitionElement>.from(json["competitions"].map((x) => CompetitionElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "filters": filters.toJson(),
    "competitions": List<dynamic>.from(competitions.map((x) => x.toJson())),
  };
}

class CompetitionElement {
  CompetitionElement({
    required this.id,
    required this.area,
    required this.name,
    required this.code,
    required this.emblemUrl,
    required this.plan,
    required this.currentSeason,
    required this.numberOfAvailableSeasons,
    required this.lastUpdated,
  });

  final int id;
  final Area area;
  final String name;
  final String? code;
  final String? emblemUrl;
  final String plan;
  final CurrentSeason currentSeason;
  final int numberOfAvailableSeasons;
  final DateTime lastUpdated;

  factory CompetitionElement.fromJson(Map<String, dynamic> json) => CompetitionElement(
    id: json["id"],
    area: Area.fromJson(json["area"]),
    name: json["name"],
    code: json["code"] == null ? null : json["code"],
    emblemUrl: json["emblemUrl"] == null ? null : json["emblemUrl"],
    plan: json["plan"],
    currentSeason: CurrentSeason.fromJson(json["currentSeason"]),
    numberOfAvailableSeasons: json["numberOfAvailableSeasons"],
    lastUpdated: DateTime.parse(json["lastUpdated"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "area": area.toJson(),
    "name": name,
    "code": code == null ? null : code,
    "emblemUrl": emblemUrl == null ? null : emblemUrl,
    "plan": plan,
    "currentSeason": currentSeason.toJson(),
    "numberOfAvailableSeasons": numberOfAvailableSeasons,
    "lastUpdated": lastUpdated.toIso8601String(),
  };
}

class Area {
  Area({
    required this.id,
    required this.name,
    required this.countryCode,
    required this.ensignUrl,
  });

  final int id;
  final String name;
  final String countryCode;
  final String ensignUrl;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
    id: json["id"],
    name: json["name"],
    countryCode: json["countryCode"],
    ensignUrl: json["ensignUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "countryCode": countryCode,
    "ensignUrl": ensignUrl,
  };
}

class CurrentSeason {
  CurrentSeason({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.currentMatchday,
    required this.winner,
  });

  final int id;
  final DateTime startDate;
  final DateTime endDate;
  final int? currentMatchday;
  final Winner? winner;

  factory CurrentSeason.fromJson(Map<String, dynamic> json) => CurrentSeason(
    id: json["id"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    currentMatchday: json["currentMatchday"] == null ? null : json["currentMatchday"],
    winner: json["winner"] == null ? null : Winner.fromJson(json["winner"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "startDate": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "endDate": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "currentMatchday": currentMatchday == null ? null : currentMatchday,
    "winner": winner == null ? null : winner!.toJson(),
  };
}

class Winner {
  Winner({
    required this.id,
    required this.name,
    required this.shortName,
    required this.tla,
    required this.crestUrl,
  });

  final int id;
  final String name;
  final dynamic shortName;
  final dynamic tla;
  final dynamic crestUrl;

  factory Winner.fromJson(Map<String, dynamic> json) => Winner(
    id: json["id"],
    name: json["name"],
    shortName: json["shortName"],
    tla: json["tla"],
    crestUrl: json["crestUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "shortName": shortName,
    "tla": tla,
    "crestUrl": crestUrl,
  };
}

class Filters {
  Filters({
    required this.areas,
  });

  final List<int> areas;

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
    areas: List<int>.from(json["areas"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "areas": List<dynamic>.from(areas.map((x) => x)),
  };
}
