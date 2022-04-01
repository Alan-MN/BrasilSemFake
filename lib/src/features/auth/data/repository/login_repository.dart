import '../../domain/model/user.dart';
import '../../domain/repository/login_interface.dart';

class LoginRepository implements ILogin {
  @override
  Future<User> login(User user) {
    throw UnimplementedError();
  }
}
