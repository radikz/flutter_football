import 'dart:convert';

Matches matchFromJson(String str) => Matches.fromJson(json.decode(str));

String matchToJson(Matches data) => json.encode(data.toJson());

class Matches {
  Matches({
    required this.count,
    required this.filters,
    required this.competition,
    required this.matches,
  });

  final int count;
  final Filters filters;
  final Competition competition;
  final List<MatchElement> matches;

  factory Matches.fromJson(Map<String, dynamic> json) => Matches(
    count: json["count"],
    filters: Filters.fromJson(json["filters"]),
    competition: Competition.fromJson(json["competition"]),
    matches: List<MatchElement>.from(json["matches"].map((x) => MatchElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "filters": filters.toJson(),
    "competition": competition.toJson(),
    "matches": List<dynamic>.from(matches.map((x) => x.toJson())),
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

class MatchElement {
  MatchElement({
    required this.id,
    required this.season,
    required this.utcDate,
    required this.status,
    required this.matchday,
    required this.stage,
    required this.group,
    required this.lastUpdated,
    required this.odds,
    required this.score,
    required this.homeTeam,
    required this.awayTeam,
    required this.referees,
  });

  final int id;
  final Season season;
  final DateTime utcDate;
  final String status;
  final int matchday;
  final String stage;
  final dynamic group;
  final DateTime lastUpdated;
  final Odds odds;
  final Score? score;
  final Area homeTeam;
  final Area awayTeam;
  final List<Referee> referees;

  factory MatchElement.fromJson(Map<String, dynamic> json) => MatchElement(
    id: json["id"],
    season: Season.fromJson(json["season"]),
    utcDate: DateTime.parse(json["utcDate"]),
    status: json["status"],
    matchday: json["matchday"],
    stage: json["stage"],
    group: json["group"],
    lastUpdated: DateTime.parse(json["lastUpdated"]),
    odds: Odds.fromJson(json["odds"]),
    score: Score.fromJson(json["score"]),
    homeTeam: Area.fromJson(json["homeTeam"]),
    awayTeam: Area.fromJson(json["awayTeam"]),
    referees: List<Referee>.from(json["referees"].map((x) => Referee.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "season": season.toJson(),
    "utcDate": utcDate.toIso8601String(),
    "status": status,
    "matchday": matchday,
    "stage": stage,
    "group": group,
    "lastUpdated": lastUpdated.toIso8601String(),
    "odds": odds.toJson(),
    "score": score == null ? null : score!.toJson(),
    "homeTeam": homeTeam.toJson(),
    "awayTeam": awayTeam.toJson(),
    "referees": List<dynamic>.from(referees.map((x) => x.toJson())),
  };
}

class Odds {
  Odds({
    required this.msg,
  });

  final String msg;

  factory Odds.fromJson(Map<String, dynamic> json) => Odds(
    msg:json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
  };
}

class Referee {
  Referee({
    required this.id,
    required this.name,
    required this.role,
    required this.nationality,
  });

  final int id;
  final String name;
  final String role;
  final String? nationality;

  factory Referee.fromJson(Map<String, dynamic> json) => Referee(
    id: json["id"],
    name: json["name"],
    role: json["role"],
    nationality: json["nationality"] == null ? null : json["nationality"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "role": role,
    "nationality": nationality == null ? null : nationality,
  };
}

class Score {
  Score({
    required this.winner,
    required this.duration,
    required this.fullTime,
    required this.halfTime,
    required this.extraTime,
    required this.penalties,
  });

  final String? winner;
  final String duration;
  final ExtraTime fullTime;
  final ExtraTime halfTime;
  final ExtraTime extraTime;
  final ExtraTime penalties;

  factory Score.fromJson(Map<String, dynamic> json) => Score(
    winner: json["winner"],
    duration: json["duration"],
    fullTime: ExtraTime.fromJson(json["fullTime"]),
    halfTime: ExtraTime.fromJson(json["halfTime"]),
    extraTime: ExtraTime.fromJson(json["extraTime"]),
    penalties: ExtraTime.fromJson(json["penalties"]),
  );

  Map<String, dynamic> toJson() => {
    "winner": winner,
    "duration": duration,
    "fullTime": fullTime.toJson(),
    "halfTime": halfTime.toJson(),
    "extraTime": extraTime.toJson(),
    "penalties": penalties.toJson(),
  };
}

class ExtraTime {
  ExtraTime({
    required this.homeTeam,
    required this.awayTeam,
  });

  final int? homeTeam;
  final int? awayTeam;

  factory ExtraTime.fromJson(Map<String, dynamic> json) => ExtraTime(
    homeTeam: json["homeTeam"] == null ? null : json["homeTeam"],
    awayTeam: json["awayTeam"] == null ? null : json["awayTeam"],
  );

  Map<String, dynamic> toJson() => {
    "homeTeam": homeTeam == null ? null : homeTeam,
    "awayTeam": awayTeam == null ? null : awayTeam,
  };
}

class Season {
  Season({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.currentMatchday,
  });

  final int id;
  final DateTime startDate;
  final DateTime endDate;
  final int currentMatchday;

  factory Season.fromJson(Map<String, dynamic> json) => Season(
    id: json["id"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    currentMatchday: json["currentMatchday"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "startDate": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "endDate": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "currentMatchday": currentMatchday,
  };
}

