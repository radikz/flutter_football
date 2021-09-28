import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StandingItem extends StatelessWidget {
  final int? position;
  final String? teamCrestUrl;
  final String? teamName;
  final String points;
  final String playedGames;
  final String won;
  final String draw;
  final String lost;
  final String goalsFor;
  final String goalsAgainst;

  StandingItem(
      {this.position,
      this.teamCrestUrl,
      this.teamName,
      required this.points,
      required this.playedGames,
      required this.won,
      required this.draw,
      required this.lost,
      required this.goalsFor,
      required this.goalsAgainst});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(position == null ? "" : position.toString()),
        ),
        Expanded(
          flex: 1,
          child: teamCrestUrl != null
              ? SvgPicture.network(
                  teamCrestUrl!,
                  width: 40,
                )
              : Container(),
        ),
        Expanded(
          flex: 5,
          child: Text(teamName ?? ""),
        ),
        Expanded(
          flex: 1,
          child: Text(points.toString()),
        ),
        Expanded(
          flex: 1,
          child: Text(playedGames.toString()),
        ),
        Expanded(
          flex: 1,
          child: Text(won.toString()),
        ),
        Expanded(
          flex: 1,
          child: Text(draw.toString()),
        ),
        Expanded(
          flex: 1,
          child: Text(lost.toString()),
        ),
        Expanded(
          flex: 1,
          child: Text(goalsFor.toString()),
        ),
        Expanded(
          flex: 1,
          child: Text(goalsAgainst.toString()),
        ),
      ],
    );
  }
}
