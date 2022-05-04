import '../model/create_user.dart';

abstract class IRegister{
  Future<CreateUser> create(CreateUser user);
}