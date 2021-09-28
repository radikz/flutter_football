import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_football/bloc/standing/standing_bloc.dart';
import 'package:flutter_football/view/screens/detail/widgets/standing_tab/standing_item.dart';

class StandingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<StandingBloc, StandingState>(
        builder: (context, state) {
          switch (state.status) {
            case StandingStatus.failure:
              return Center(
                child: Text('Failed to load data'),
              );
            case StandingStatus.success:
              return RefreshIndicator(
                onRefresh: () async =>
                  context
                      .read<StandingBloc>()
                      .add(StandingFetched(id: state.data!.competition.id))
                ,
                child: Column(
                  children: [
                    Container(
                      child: StandingItem(
                        header: true,
                        points: "Pt",
                        playedGames: "P",
                        won: "W",
                        draw: "D",
                        lost: "L",
                        goalsFor: "GF",
                        goalsAgainst: "GA",
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: state.data!.standings[0].table.length,
                        itemBuilder: (context, index) {
                          final standing =
                              state.data!.standings[0].table[index];
                          return StandingItem(
                            header: false,
                            position: standing.position,
                            teamCrestUrl: standing.team.crestUrl,
                            teamName: standing.team.name,
                            points: standing.points.toString(),
                            playedGames: standing.playedGames.toString(),
                            won: standing.won.toString(),
                            draw: standing.draw.toString(),
                            lost: standing.lost.toString(),
                            goalsFor: standing.goalsFor.toString(),
                            goalsAgainst: standing.goalsAgainst.toString(),
                          );
                        },
                        separatorBuilder: (context, int) {
                          return Divider();
                        },
                      ),
                    ),
                  ],
                ),
              );
            default:
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
