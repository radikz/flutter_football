part of 'internet_cubit.dart';

enum InternetConnectionType {mobile, wifi}

@immutable
abstract class InternetState {}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState{
  final InternetConnectionType internetConnectedType;

  InternetConnected({required this.internetConnectedType});

  @override
  String toString() {
    // TODO: implement toString
    return "Internet Connected";
  }
}

class InternetDisconnected extends InternetState {}
