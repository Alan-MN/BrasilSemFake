import 'package:basearch/src/features/auth/domain/model/login_info_verification.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecase/login_usecase.dart';

part 'login_viewmodel.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  final _usecase = Modular.get<LoginUseCase>();
  final validator = LoginInfoVerification();

  @observable
  String username = '';

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

  String? validateUsername(){
    return validator.userVerification(username);
  }

  String? validatePassword(){
    return validator.passwordVerification(password);
  }

  void login() async {
    await _usecase.login(username, password);
  }
}
