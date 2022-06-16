import 'package:basearch/src/features/auth/domain/model/login_info_verification.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecase/create_user_usecase.dart';

part 'register_viewmodel.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store {

  final _usecase = Modular.get<CreateUserUseCase>();
  final validator = LoginInfoVerification();

  @observable
  String username = '';

  @observable
  String email = '';
  
  @observable
  String password = '';

  @action
  void setUsername(String value) {
    username = value;
  }

  String getUsername() {
    return username;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  String getPassword() {
    return password;
  }

  @action
  void setEmail(String value) {
    email = value;
  }

  String getEmail() {
    return email;
  }

  String? validateUsername(){
    return validator.userVerification(username);
  }

  String? validatePassword(){
    return validator.passwordVerification(password);
  }

  String? validateEmail(){
    return validator.mailVerificatio(email);
  }

  void register() async {
    await _usecase.create(username, password, email);
  }
}

