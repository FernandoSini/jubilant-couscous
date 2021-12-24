import 'package:flutter/material.dart';

class WebLoginProvider extends ChangeNotifier {
  bool? isLoginValid = false;
  bool? isLoading = false;
  bool? get loading => isLoading;
  bool? hasError = false;
  bool? get error => hasError;
  String? errorMessage = "";
  bool? isVisible = false;

  void setErrorMessage(String text) {
    errorMessage = text;
    notifyListeners();
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void setHasError(bool value) {
    hasError = value;
    notifyListeners();
  }

  void setVisible(bool value) {
    isVisible = value;
    notifyListeners();
  }

  void setLoginValid(bool value) {
    isLoginValid = value;
    notifyListeners();
  }
}
