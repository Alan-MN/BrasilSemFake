// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterViewModel on _RegisterViewModelBase, Store {
  final _$usernameAtom = Atom(name: '_RegisterViewModelBase.username');

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$emailAtom = Atom(name: '_RegisterViewModelBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_RegisterViewModelBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$_RegisterViewModelBaseActionController =
      ActionController(name: '_RegisterViewModelBase');

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
username: ${username},
email: ${email},
password: ${password}
    ''';
  }
}
