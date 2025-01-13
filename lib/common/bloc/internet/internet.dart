import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/// Enum for connectivity states
enum ConnectivityState {
  connected,
  disconnected,
}

class ConnectivityCubit extends Cubit<ConnectivityState> {
  final InternetConnectionChecker _internetConnectionChecker;
  late final Stream<InternetConnectionStatus> _connectionStream;

  ConnectivityCubit(this._internetConnectionChecker)
      : super(ConnectivityState.disconnected) {
    // Initialize the connection stream
    _connectionStream = _internetConnectionChecker.onStatusChange;

    // Start listening to the connection status
    _connectionStream.listen((status) {
      if (status == InternetConnectionStatus.connected) {
        emit(ConnectivityState.connected);
      } else {
        emit(ConnectivityState.disconnected);
      }
    });
  }

  /// Manual check for connectivity, useful for retry logic
  Future<void> checkConnection() async {
    final isConnected = await _internetConnectionChecker.hasConnection;
    if (isConnected) {
      emit(ConnectivityState.connected);
    } else {
      emit(ConnectivityState.disconnected);
    }
  }

  @override
  Future<void> close() {
    // Dispose resources if any
    return super.close();
  }
}
