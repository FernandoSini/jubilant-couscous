import 'package:flutter/material.dart';
import 'package:jubilant_couscous/web/app/data/providers/web_login_provider.dart';
import 'package:provider/src/provider.dart';

class LoginController {
  TextEditingController? userNameController = TextEditingController(text: "");
  TextEditingController? passwordController = TextEditingController(text: "");
  WebLoginProvider? loginProvider;
  bool? hasError = false;
  String? error = "";
  bool? isVisible = false;
  bool? isLoginValid = false;

  Future<bool?> login(
      String username, String password, BuildContext context) async {
    loginProvider = context.read<WebLoginProvider>();
    loginProvider?.setLoading(true);
    try {
      bool isValid = false;
      isValid = validateLogin(username, password)!;

      if (isValid || isValid == true) {
        userNameController?.clear();
        passwordController?.clear();
        return Future.delayed(const Duration(seconds: 5), () {
          loginProvider?.setLoginValid(isValid);
          loginProvider?.setLoading(false);
          loginProvider?.setHasError(false);
          return loginProvider?.isLoginValid;
        });
      } else {
        return Future.delayed(const Duration(seconds: 5), () {
          loginProvider?.setLoginValid(isValid);
          loginProvider?.setLoading(false);
          loginProvider?.setHasError(true);
          return loginProvider?.isLoginValid;
        });
      }
    } catch (e) {
      return Future.delayed(const Duration(seconds: 5), () {
        loginProvider?.setLoginValid(false);
        loginProvider?.setLoading(false);
        loginProvider?.setHasError(true);
        String error =
            "Desculpe, tivemos um erro ao conectar com o servidor!";
        loginProvider?.setErrorMessage(error);
        return loginProvider?.error;
      });
    }
  }

  bool? validateLogin(String username, String password) {
    if (username.isNotEmpty && (password.isNotEmpty && password.length >= 6)) {
      isLoginValid = true;
      return isLoginValid!;
    } else {
      isLoginValid = false;
      return isLoginValid!;
    }
  }
}
