import 'package:flutter/services.dart';

class ShowToast {
  ShowToast(String message) {
    _showToast(message);
  }

  static const platform = const MethodChannel("flutter.toast.message.channel");

  _showToast(String message) {
    platform.invokeMethod('toast', {message: 'message'});
  }
}
