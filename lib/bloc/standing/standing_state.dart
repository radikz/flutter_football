part of 'standing_bloc.dart';

enum StandingStatus { loading, success, failure, empty }

class StandingState {
  const StandingState({this.status = StandingStatus.loading, this.data});

  final StandingStatus status;
  final Standing? data;

  StandingState copyWith({StandingStatus? status, Standing? data}) {
    return StandingState(status: status ?? this.status, data: data ?? this.data);
  }

  @override
  String toString() {
    return ''' Standing State: status $status ''';
  }
}
