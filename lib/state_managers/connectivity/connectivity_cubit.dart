import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fifth_exam/state_managers/connectivity/connectivity_state.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit()
      : super(
            ConnectivityState(connectivityResult: ConnectivityResult.mobile)) {
    checkInternet();
  }

  final Connectivity _connectivity = Connectivity();

  checkInternet() {
    initConnectivity();
    _connectivity.onConnectivityChanged.listen((event) {
      emit(state.copyWith(connectivityResult: event));
    });
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException {
      return;
    }
    emit(state.copyWith(connectivityResult: result));
  }
}
