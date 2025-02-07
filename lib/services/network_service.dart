import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService {
  final Connectivity _connectivity = Connectivity();

  // Checks if the device has internet access
  Future<bool> hasNetwork() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.vpn;
  }

  // Stream to listen for network changes
  Stream<bool> get onNetworkChange {
    return _connectivity.onConnectivityChanged.map((connectivityResult) {
      return connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.vpn;
    });
  }
}
