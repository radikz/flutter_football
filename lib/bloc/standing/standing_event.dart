part of 'standing_bloc.dart';

@immutable
abstract class StandingEvent {}

class StandingFetched extends StandingEvent{
  final int id;
  StandingFetched({required this.id});
}
