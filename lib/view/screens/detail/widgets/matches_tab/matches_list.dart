import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_football/bloc/match/match_bloc.dart';
import 'package:flutter_football/view/screens/detail/widgets/matches_tab/matches_item.dart';

class MatchesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchBloc, MatchState>(
      builder: (context, state) {
        switch (state.status) {
          case MatchStatus.failure:
            return Center(
              child: Text(''),
            );
          case MatchStatus.success:
            return ListView.separated(
              itemCount: state.data!.length,
              itemBuilder: (context, index) {
                // final match = state.data!.matches[index];
                final match = state.data!;
                return MatchesItem(
                  date: match.keys.elementAt(index),
                  match: match.values.elementAt(index),
                );
              },
              separatorBuilder: (context, index){
                return SizedBox(height: 30,);
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
}
