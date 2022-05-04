import '../../domain/model/user.dart';
import '../../domain/repository/login_interface.dart';
import 'package:dio/dio.dart';


class LoginRepository implements ILogin {
  @override
  Future<User> login(User user) async{
    try {
      var response = await Dio().post('http://189.6.32.161:8000/user/login', data: {"username": user.username, "password": user.password});
      return response as Future<User>;
    } catch (e) {
      throw Exception(e);
    }
  }
}
