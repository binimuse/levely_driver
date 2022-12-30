import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';



class NetworkController extends GetxController {
  var connectionStatus = 0.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void onInit() async {
    super.onInit();
    // initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
      return;
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = 1;
        break;
      case ConnectivityResult.mobile:
        connectionStatus.value = 2;
        break;
      case ConnectivityResult.none:
        connectionStatus.value = 0;

        break;
      default:
    }
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
  }

  restart() {
    update();
  }
}
