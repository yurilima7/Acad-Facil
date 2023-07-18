import 'package:acad_facil/App/Core/Utils/loader.dart';
import 'package:acad_facil/App/Core/Utils/messages.dart';
import 'package:flutter/material.dart';

class AppStatus extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;
  bool _success = false;

  bool get loading => _isLoading;
  String? get error => _error;
  bool get hasError => _error != null;
  bool get isSuccess => _success;

  // void showLoading() => _isLoading = true;
  void showLoading() {
    _isLoading = true;
    Loader.showLoader();
  }

  // void hideLoading() => _isLoading = false;
  void hideLoading() {
    _isLoading = false;
    Loader.hideLoader();
  }

  void showMessageError() {
    Messages.showError(error!);
  }

  void showMessageSuccess(String message) {
    Messages.showSuccess(message);
  }

  // void success() => _success = true;
  void success(String message) {
    _success = true;
    if (_success) {
      showMessageSuccess(message);
    }
  }

  // void setError(String? error) => _error = error;
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
