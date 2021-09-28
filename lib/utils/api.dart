import 'package:flutter_football/model/competition.dart';
import 'package:flutter_football/model/matches.dart' as matches;
import 'package:flutter_football/model/standing.dart' as standing;
import 'package:flutter_football/utils/constants.dart';
import 'package:flutter_football/utils/converter.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class Api {

  Future<Competition> fetchDataCompetition() async {

    final url = Uri.parse(
        '$URL/competitions?areas=$PARAM_AREA&plan=$PARAM_PLAN',
    );
    print(url);
    final response = await http.get(url);

    if (response.statusCode == 200){
      final body = json.decode(response.body);
      return Competition.fromJson(body);
    }
    throw Exception('Error fetching data');
  }

  Future<standing.Standing> fetchDataStanding(int id) async {
    final url = Uri.parse(
      '$URL/competitions/$id/standings',
    );
    print(url);
    final response = await http.get(url, headers: {
      'X-Auth-Token': API_TOKEN,
    });

    if (response.statusCode == 200){
      final body = json.decode(response.body);
      print(body);
      return standing.Standing.fromJson(body);
    }
    throw Exception('Error fetching data');
  }

  Future<matches.Matches> fetchDataMatch(int id, DateTime now) async {
    final before = Converter().date14Before(now);
    final after = Converter().date14After(now);
    final url = Uri.parse(
      '$URL/competitions/$id/matches?dateFrom=$before&dateTo=$after',
    );
    print(url);
    final response = await http.get(url, headers: {
      'X-Auth-Token': API_TOKEN,
    });

    if (response.statusCode == 200){
      final body = json.decode(response.body);
      return matches.Matches.fromJson(body);
    }
    throw Exception('Error fetching data');
  }
}