import 'package:basearch/src/features/auth/domain/model/create_user.dart';
import 'package:basearch/src/features/auth/domain/repository/register_interface.dart';
import 'package:dio/dio.dart';

class CreateRepository implements IRegister {
  @override
  Future<CreateUser> create(CreateUser user) async {
    try {
      var response = await Dio().post('http://10.0.2.2:8000/user/create',
          data: {
            "username": user.username,
            "email": user.email,
            "password": user.password
          });
      return CreateUser(
          response.data.username, response.data.password, response.data.email);
    } catch (e) {
      return CreateUser("", "", "");
    }
  }
}
