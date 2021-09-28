import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print("onChange ${bloc.runtimeType} $change");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}