// To parse this JSON data, do
//
//     final standing = standingFromJson(jsonString);

import 'dart:convert';

Standing standingFromJson(String str) => Standing.fromJson(json.decode(str));

String standingToJson(Standing data) => json.encode(data.toJson());

class Standing {
  Standing({
    required this.filters,
    required this.competition,
    required this.season,
    required this.standings,
  });

  final Filters filters;
  final Competition competition;
  final Season season;
  final List<StandingElement> standings;

  factory Standing.fromJson(Map<String, dynamic> json) => Standing(
    filters: Filters.fromJson(json["filters"]),
    competition: Competition.fromJson(json["competition"]),
    season: Season.fromJson(json["season"]),
    standings: List<StandingElement>.from(json["standings"].map((x) => StandingElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "filters": filters.toJson(),
    "competition": competition.toJson(),
    "season": season.toJson(),
    "standings": List<dynamic>.from(standings.map((x) => x.toJson())),
  };
}

class Competition {
  Competition({
    required this.id,
    required this.area,
    required this.name,
    required this.code,
    required this.plan,
    required this.lastUpdated,
  });

  final int id;
  final Area area;
  final String name;
  final String code;
  final String plan;
  final DateTime lastUpdated;

  factory Competition.fromJson(Map<String, dynamic> json) => Competition(
    id: json["id"],
    area: Area.fromJson(json["area"]),
    name: json["name"],
    code: json["code"],
    plan: json["plan"],
    lastUpdated: DateTime.parse(json["lastUpdated"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "area": area.toJson(),
    "name": name,
    "code": code,
    "plan": plan,
    "lastUpdated": lastUpdated.toIso8601String(),
  };
}

class Area {
  Area({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Filters {
  Filters();

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Season {
  Season({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.currentMatchday,
    required this.winner,
  });

  final int id;
  final DateTime startDate;
  final DateTime endDate;
  final int currentMatchday;
  final dynamic winner;

  factory Season.fromJson(Map<String, dynamic> json) => Season(
    id: json["id"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    currentMatchday: json["currentMatchday"],
    winner: json["winner"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "startDate": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "endDate": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "currentMatchday": currentMatchday,
    "winner": winner,
  };
}

class StandingElement {
  StandingElement({
    required this.stage,
    required this.type,
    required this.group,
    required this.table,
  });

  final String stage;
  final String type;
  final dynamic group;
  final List<TableStandings> table;

  factory StandingElement.fromJson(Map<String, dynamic> json) => StandingElement(
    stage: json["stage"],
    type: json["type"],
    group: json["group"],
    table: List<TableStandings>.from(json["table"].map((x) => TableStandings.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "stage": stage,
    "type": type,
    "group": group,
    "table": List<dynamic>.from(table.map((x) => x.toJson())),
  };
}

class TableStandings {
  TableStandings({
    required this.position,
    required this.team,
    required this.playedGames,
    required this.form,
    required this.won,
    required this.draw,
    required this.lost,
    required this.points,
    required this.goalsFor,
    required this.goalsAgainst,
    required this.goalDifference,
  });

  final int position;
  final Team team;
  final int playedGames;
  final dynamic form;
  final int won;
  final int draw;
  final int lost;
  final int points;
  final int goalsFor;
  final int goalsAgainst;
  final int goalDifference;

  factory TableStandings.fromJson(Map<String, dynamic> json) => TableStandings(
    position: json["position"],
    team: Team.fromJson(json["team"]),
    playedGames: json["playedGames"],
    form: json["form"],
    won: json["won"],
    draw: json["draw"],
    lost: json["lost"],
    points: json["points"],
    goalsFor: json["goalsFor"],
    goalsAgainst: json["goalsAgainst"],
    goalDifference: json["goalDifference"],
  );

  Map<String, dynamic> toJson() => {
    "position": position,
    "team": team.toJson(),
    "playedGames": playedGames,
    "form": form,
    "won": won,
    "draw": draw,
    "lost": lost,
    "points": points,
    "goalsFor": goalsFor,
    "goalsAgainst": goalsAgainst,
    "goalDifference": goalDifference,
  };
}

class Team {
  Team({
    required this.id,
    required this.name,
    required this.crestUrl,
  });

  final int id;
  final String name;
  final String? crestUrl;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json["id"],
    name: json["name"],
    crestUrl: json["crestUrl"] == null ? null : json["crestUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "crestUrl": crestUrl,
  };
}
