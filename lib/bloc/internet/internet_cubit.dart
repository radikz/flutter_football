import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription streamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection() {
    return streamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
          if (connectivityResult == ConnectivityResult.wifi) {
            emitInternetConnected(InternetConnectionType.wifi);
          } else if (connectivityResult == ConnectivityResult.mobile) {
            emitInternetConnected(InternetConnectionType.mobile);
          } else if (connectivityResult == ConnectivityResult.none) {
            emitInternetDisconnected();
          }
        });
  }

  void emitInternetConnected(InternetConnectionType _connectionType) =>
      emit(InternetConnected(internetConnectedType: _connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
