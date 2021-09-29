import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState());

  @override
  Stream<SplashState> mapEventToState(
    SplashEvent event,
  ) async* {
    if (event is NavigateSplash){
      yield SplashState(status: SplashStatus.loading);
      await Future.delayed(Duration(seconds: 4));
      yield SplashState(status: SplashStatus.success);
    }
  }
}
