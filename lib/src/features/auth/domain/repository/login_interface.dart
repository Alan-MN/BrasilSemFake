import '../model/user.dart';

abstract class ILogin {
  Future<User> login(User user);
}
