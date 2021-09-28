part of 'match_bloc.dart';

@immutable
abstract class MatchEvent {}

class MatchFetched extends MatchEvent {
  final int id;
  final DateTime now;
  MatchFetched({required this.id, required this.now});
}
