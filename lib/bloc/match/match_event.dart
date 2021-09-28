part of 'match_bloc.dart';

@immutable
abstract class MatchEvent {}

class MatchFetched extends MatchEvent {
  final int id;
  MatchFetched({required this.id});
}
