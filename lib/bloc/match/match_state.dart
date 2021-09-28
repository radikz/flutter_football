part of 'match_bloc.dart';

enum MatchStatus { loading, success, failure, empty }

class MatchState {
  const MatchState({this.status = MatchStatus.loading, this.data});

  final MatchStatus status;
  final Matches? data;

  MatchState copyWith({MatchStatus? status, Matches? data}) {
    return MatchState(status: status ?? this.status, data: data ?? this.data);
  }

  @override
  String toString() {
    return ''' Matches State: status $status ''';
  }
}
