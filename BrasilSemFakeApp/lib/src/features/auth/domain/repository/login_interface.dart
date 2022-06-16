import '../model/token.dart';
import '../model/user.dart';

abstract class ILogin {
  Future<Token> login(User user);
}