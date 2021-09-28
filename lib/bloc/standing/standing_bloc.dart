import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_football/model/empty_exception.dart';
import 'package:flutter_football/model/standing.dart';
import 'package:flutter_football/utils/api.dart';
import 'package:meta/meta.dart';

part 'standing_event.dart';
part 'standing_state.dart';

class StandingBloc extends Bloc<StandingEvent, StandingState> {
  StandingBloc() : super(StandingState());

  @override
  Stream<StandingState> mapEventToState(
    StandingEvent event,
  ) async* {
    if (event is StandingFetched){
      yield state.copyWith(status: StandingStatus.loading);
      yield await _mapStandingToState(state, event.id);
    }
  }

  Future<StandingState> _mapStandingToState(StandingState state, int id) async {
    try {
      final standing = await Api().fetchDataMatch(id);
      return state.copyWith(
          status: StandingStatus.success,
          data: standing
      );
    } on EmptyException {
      return state.copyWith(
          status: StandingStatus.empty,
          data: null
      );
    } on Exception {
      return state.copyWith(
          status: StandingStatus.failure
      );
    }
  }
}
