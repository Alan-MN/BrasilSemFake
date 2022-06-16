import '../../domain/model/token.dart';
import '../../domain/model/user.dart';
import '../../domain/repository/login_interface.dart';
import 'package:dio/dio.dart';

class LoginRepository implements ILogin {
  @override
  Future<Token> login(User user) async {
    try {
      var response = await Dio().post('http://10.0.2.2:8000/user/login',
          data: {"username": user.username, "password": user.password});
      return Token(response.data["token"]);
    } catch (e) {
      return Token("");
    }
  }
}
