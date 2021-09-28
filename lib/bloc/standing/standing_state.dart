part of 'standing_bloc.dart';

class StandingState {
  const StandingState({this.status = DataStatus.loading, this.data});

  final DataStatus status;
  final Standing? data;

  StandingState copyWith({DataStatus? status, Standing? data}) {
    return StandingState(status: status ?? this.status, data: data ?? this.data);
  }

  @override
  String toString() {
    return ''' Standing State: status $status ''';
  }
}
