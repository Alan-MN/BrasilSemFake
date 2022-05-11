import 'package:flutter_modular/flutter_modular.dart';

import '../model/token.dart';
import '../model/user.dart';
import '../repository/login_interface.dart';

class LoginUseCase {
  final repository = Modular.get<ILogin>();

  Future<Token> login(String username, String password) async {
    return await repository.login(User(username, password));
  }
}
