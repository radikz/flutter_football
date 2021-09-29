part of 'splash_bloc.dart';

enum SplashStatus { loading, success }

class SplashState {
  final SplashStatus status;
  SplashState({this.status = SplashStatus.loading});

  @override
  String toString() {
    // TODO: implement toString
    return ''' Splash State: status $status ''';
  }
}
