part of 'competition_bloc.dart';

class CompetitionState {
  const CompetitionState({this.status = DataStatus.loading, this.data});

  final DataStatus status;
  final Competition? data;

  CompetitionState copyWith({DataStatus? status, Competition? data}) {
    return CompetitionState(status: status ?? this.status, data: data ?? this.data);
  }

  @override
  String toString() {
    return ''' Competition State: status $status ''';
  }
}
