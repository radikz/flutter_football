import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_football/model/competition.dart';
import 'package:flutter_football/model/empty_exception.dart';
import 'package:flutter_football/model/enum.dart';
import 'package:flutter_football/utils/api.dart';

part 'competition_event.dart';

part 'competition_state.dart';

class CompetitionBloc extends Bloc<CompetitionEvent, CompetitionState> {
  CompetitionBloc() : super(CompetitionState());

  @override
  Stream<CompetitionState> mapEventToState(
    CompetitionEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is CompetitionFetched) {
      yield state.copyWith(status: DataStatus.loading);
      yield await _mapCompetitionToState(state);
    }
  }

  Future<CompetitionState> _mapCompetitionToState(CompetitionState state) async {
    try {
      final competition = await Api().fetchDataCompetition();
      return state.copyWith(
          status: DataStatus.success,
          data: competition
      );
    } on EmptyException {
      return state.copyWith(
          status: DataStatus.empty,
          data: null
      );
    } on Exception {
      return state.copyWith(
        status: DataStatus.failure
      );
    }
  }
}
