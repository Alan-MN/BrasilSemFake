import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../model/user.dart';
import '../repository/login_interface.dart';

class LoginUseCase {
  final repository = Modular.get<ILogin>();

  String? validateUserName(String username) {
    if (username.isEmpty) {
      return 'username_required'.i18n();
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'password_required'.i18n();
    }
    return null;
  }

  Future<User> login(String username, String password) {
    return repository.login(User(username, password));
  }
}
