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

  void _showLoading() {
    _isLoading = true;
    Loader.showLoader();
  }

  void hideLoading() {
    _isLoading = false;
    Loader.hideLoader();
  }

  void _showMessageError() {
    Messages.showError(error!);
  }

  void _showMessageInfo() {
    Messages.showInfo(info!);
  }

  void _showMessageSuccess(String message) {
    Messages.showSuccess(message);
  }

  void success(String message) {
    _success = true;
    if (_success) {
      _showMessageSuccess(message);
    }
  }

  void setInfo(String? info) {
    _info = info;
    if (_info != null) {
      _showMessageInfo();
    }
  }

  void setError(String? error) {
    _error = error;
    if (_error != null) {
      _showMessageError();
    }
  }

  void showLoadingAndResetState() {
    _showLoading();
    _resetState();
  }

  void _resetState() {
    setError(null);
    _success = false;
  }
}
