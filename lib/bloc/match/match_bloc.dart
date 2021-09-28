import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter_football/model/empty_exception.dart';
import 'package:flutter_football/model/enum.dart';
import 'package:flutter_football/model/matches.dart';
import 'package:flutter_football/utils/api.dart';
import 'package:meta/meta.dart';

part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  MatchBloc() : super(MatchState());

  @override
  Stream<MatchState> mapEventToState(
    MatchEvent event,
  ) async* {
    if (event is MatchFetched){
      yield await _mapStandingToState(state, event.id, event.now);
    }
  }

  Future<MatchState> _mapStandingToState(MatchState state, int id, DateTime now) async {
    try {
      final matches = await Api().fetchDataMatch(id, now);
      final groupMatches = groupEmployeesByCountry(matches.matches);
      return state.copyWith(
          status: DataStatus.success,
          data: groupMatches
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

  Map<DateTime, List<MatchElement>> groupEmployeesByCountry(List<MatchElement> match) {
    final groups = groupBy(match, (MatchElement e) {
      return e.utcDate;
    });
    return groups;
  }
}
