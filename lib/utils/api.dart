import 'package:flutter_football/model/competition.dart';
import 'package:flutter_football/model/matches.dart' as matches;
import 'package:flutter_football/model/standing.dart' as standing;
import 'package:http/http.dart' as http;

import 'dart:convert';

class Api {

  Future<Competition> fetchDataCompetition() async {

    final url = Uri.parse(
        'https://api.football-data.org/v2/competitions?areas=2072,2224,2114,2081,2088,2163,2187&plan=TIER_ONE',
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
      'http://api.football-data.org/v2/competitions/$id/standings',
    );
    print(url);
    final response = await http.get(url, headers: {
      'X-Auth-Token': '9b2bd174192142afab99eb592dfba571',
    });

    if (response.statusCode == 200){
      final body = json.decode(response.body);
      print(body);
      return standing.Standing.fromJson(body);
    }
    throw Exception('Error fetching data');
  }

  Future<matches.Matches> fetchDataMatch(int id) async {

    final url = Uri.parse(
      'http://api.football-data.org/v2/competitions/$id/matches',
    );
    print(url);
    final response = await http.get(url, headers: {
      'X-Auth-Token': '9b2bd174192142afab99eb592dfba571',
    });

    if (response.statusCode == 200){
      final body = json.decode(response.body);
      return matches.Matches.fromJson(body);
    }
    throw Exception('Error fetching data');
  }
}