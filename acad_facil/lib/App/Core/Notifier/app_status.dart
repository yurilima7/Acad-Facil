import 'package:acad_facil/App/Core/Utils/loader.dart';
import 'package:acad_facil/App/Core/Utils/messages.dart';
import 'package:flutter/material.dart';

class AppStatus extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;
  String? _info;
  bool _success = false;

  bool get loading => _isLoading;
  String? get error => _error;
  String? get info => _info;
  bool get hasError => _error != null;
  bool get isSuccess => _success;

  void showLoading() {
    _isLoading = true;
    Loader.showLoader();
  }

  void hideLoading() {
    _isLoading = false;
    Loader.hideLoader();
  }

  void showMessageError() {
    Messages.showError(error!);
  }

  void showMessageInfo() {
    Messages.showInfo(info!);
  }

  void showMessageSuccess(String message) {
    Messages.showSuccess(message);
  }

  void success(String message) {
    _success = true;
    if (_success) {
      showMessageSuccess(message);
    }
  }

  void setInfo(String? info) {
    _info = info;
    if (_info != null) {
      
    }
  }

  void setError(String? error) {
    _error = error;
    if (_error != null) {
      showMessageError();
    }
  }

  void showLoadingAndResetState() {
    showLoading();
    resetState();
  }

  void resetState() {
    setError(null);
    _success = false;
  }
}
