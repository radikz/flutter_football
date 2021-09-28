import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_football/bloc/competition/competition_bloc.dart';
import 'package:flutter_football/model/enum.dart';
import 'package:flutter_football/view/screens/error/error_screen.dart';
import 'package:flutter_football/view/screens/home/widgets/competition_item.dart';

class CompetitionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompetitionBloc, CompetitionState>(
      builder: (context, state) {
        switch (state.status) {
          case DataStatus.failure:
            return ErrorScreen();
          case DataStatus.success:
            // return listCompetition(state);
            final competition = state.data!.competitions;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: competition.length,
              itemBuilder: (context, index) {
                return CompetitionItem(competition: competition[index]);
              },
            );
          default:
            return Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }

  Widget listCompetition(CompetitionState state) {
    final list = state.data!.competitions;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Wrap(
        spacing: 5.0,
        runSpacing: 10.0,
        children: list
            .map((competition) => CompetitionItem(
                  competition: competition,
                ))
            .toList(),
      ),
    );
  }
}
