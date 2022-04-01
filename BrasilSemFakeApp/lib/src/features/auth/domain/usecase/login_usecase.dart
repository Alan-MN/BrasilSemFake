import 'package:flutter_modular/flutter_modular.dart';

import '../model/user.dart';
import '../repository/login_interface.dart';

class LoginUseCase {
  final repository = Modular.get<ILogin>();

  Future<User> login(String username, String password) {
    return repository.login(User(username, password));
  }
}
