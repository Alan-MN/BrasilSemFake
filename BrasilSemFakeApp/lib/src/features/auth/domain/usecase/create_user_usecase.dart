import 'package:flutter_modular/flutter_modular.dart';

import '../model/create_user.dart';
import '../repository/register_interface.dart';

class CreateUserUseCase {
  final repository = Modular.get<IRegister>();

  Future<CreateUser> create(String username, String password, String email) {
    return repository.create(CreateUser(username,password,email));
  }
}
