part of 'match_bloc.dart';

class MatchState {
  const MatchState({this.status = DataStatus.loading, this.data});

  final DataStatus status;
  // final Matches? data;
  final Map<DateTime, List<MatchElement>>? data;

  MatchState copyWith({DataStatus? status, Map<DateTime, List<MatchElement>>? data}) {
    return MatchState(status: status ?? this.status, data: data ?? this.data);
  }

  @override
  String toString() {
    return ''' Matches State: status $status ''';
  }
}
