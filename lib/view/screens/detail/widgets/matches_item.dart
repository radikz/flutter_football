import 'package:flutter/material.dart';
import 'package:flutter_football/model/matches.dart';
import 'package:flutter_football/utils/converter.dart';

class MatchesItem extends StatelessWidget {
  // final Map<DateTime, List<MatchElement>> match;
  final DateTime date;
  final List<MatchElement> match;

  MatchesItem({required this.date, required this.match});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(Converter().dateToString(date)),
          ),
          SizedBox(height: 10,),
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: match.map((m) {
              return Container(
                width: width * 0.45,
                height: 110,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
                ),
                child: Row(
                  children: [
                    _teamName(
                      homeTeam: m.homeTeam.name,
                      awayTeam: m.awayTeam.name
                    ),
                    _status(m.status),
                    _score(
                      homeTeamScore: m.score?.fullTime.homeTeam,
                      awayTeamScore: m.score?.fullTime.awayTeam
                    ),
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
  
  Widget _teamName({required String homeTeam, required String awayTeam}){
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(child: Text(homeTeam)),
            SizedBox(height: 10,),
            Container(child: Text(awayTeam))
          ],
        ),
      ),
    );
  }
  
  Widget _status(String status){
    return Expanded(
      flex: 1,
      child: Container(
          alignment: Alignment.center,
          child: Text(status)
      ),
    );
  }

  Widget _score({required int? homeTeamScore, required int? awayTeamScore}){
    return Expanded(
      flex: 1,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(homeTeamScore != null
                ? homeTeamScore.toString()
                : "??"),
            SizedBox(height: 10,),
            Text(awayTeamScore != null
                ? awayTeamScore.toString()
                : "??"),
          ],
        ),
      ),
    );
  }
}
