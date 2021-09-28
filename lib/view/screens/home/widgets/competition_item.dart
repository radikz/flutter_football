import 'package:flutter/material.dart';
import 'package:flutter_football/bloc/match/match_bloc.dart';
import 'package:flutter_football/bloc/standing/standing_bloc.dart';
import 'package:flutter_football/model/competition.dart';
import 'package:flutter_football/view/screens/detail/detail_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CompetitionItem extends StatelessWidget {

  final CompetitionElement competition;
  CompetitionItem({required this.competition});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.read<StandingBloc>().add(StandingFetched(id: competition.id));
        context.read<MatchBloc>().add(MatchFetched(id: competition.id, now: DateTime.now()));
        Navigator.of(context).pushNamed(DetailScreen.routeName);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: SvgPicture.network(competition.area.ensignUrl, width: 140,),
            ),
            SizedBox(height: 10,),
            Container(
              child: Text(competition.name),
            ),
            SizedBox(height: 5,),
            Container(
              child: Text(competition.area.name),
            )
          ],
        ),
      ),
    );
  }
}
