part of 'competition_bloc.dart';

enum CompetitionStatus { loading, success, failure, empty }

class CompetitionState {
  const CompetitionState({this.status = CompetitionStatus.loading, this.data});

  final CompetitionStatus status;
  final Competition? data;

  CompetitionState copyWith({CompetitionStatus? status, Competition? data}) {
    return CompetitionState(status: status ?? this.status, data: data ?? this.data);
  }

  @override
  String toString() {
    return ''' Competition State: status $status ''';
  }
}
