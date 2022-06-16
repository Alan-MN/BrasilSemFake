import 'package:basearch/src/features/auth/domain/model/login_info_verification.dart';
import 'package:basearch/src/features/auth/presentation/viewmodel/login_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../widget/header.dart';

var dio = Dio();

class PasswordChangePage extends StatefulWidget {
  const PasswordChangePage({Key? key}) : super(key: key);

  @override
  State<PasswordChangePage> createState() => _PasswordChangePageState();
}

class _PasswordChangePageState extends State<PasswordChangePage> {
  var validator = LoginInfoVerification();
  final _formKey = GlobalKey<FormState>();
  var _newpassword = LoginViewModel();
  var _newpasswordconfirmation = LoginViewModel();

  _textField({String? labelText, onChanged, formValidator}) {
    return Container(
        padding: const EdgeInsets.only(
          top: 25,
          left: 20,
          right: 20,
        ),
        child: TextFormField(
          onChanged: onChanged,
          validator: (value) {
            return formValidator;
          },
          obscureText: true,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 0.0),
            ),
            border: OutlineInputBorder(),
            labelStyle: Theme.of(context).textTheme.subtitle1,
            labelText: labelText,
          ),
        ));
  }

  Widget get _enterPasswordTitile => Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 80),
          Text(
            'enterNewPasswordTitle'.i18n(),
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ],
      ));

  @override
  Widget build(BuildContext context) {
    String username = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const HeaderWidget(),
          _enterPasswordTitile,
          Form(
              key: _formKey,
              child: Column(
                children: [
                  Observer(
                    builder: (_) {
                      return _textField(
                          labelText: 'enterNewPassword'.i18n(),
                          onChanged: _newpassword.setPassword,
                          formValidator: validator.passwordVerification(
                              _newpassword.getPassword()));
                    },
                  ),
                  Observer(
                    builder: (_) {
                      return _textField(
                          labelText: 'ConfirmNewPassword'.i18n(),
                          onChanged: _newpasswordconfirmation.setPassword,
                          formValidator: validator.passwordVerification(
                              _newpasswordconfirmation.getPassword()));
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 60,
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(40),
                      ),
                      onPressed: () async {
                        if (_newpassword.getPassword() ==
                                _newpasswordconfirmation.getPassword() &&
                            _formKey.currentState!.validate()) {
                          Response response = await dio.post(
                              'https://api-brasil-sem-fake.herokuapp.com/recovery/passwordchange',
                              data: {
                                'username': username,
                                'newPassword': _newpassword.getPassword()
                              });
                          Modular.to.navigate('/login');
                        }
                      },
                      child: Text(
                        'passwordChangeButton'.i18n(),
                      ),
                    ),
                  ),
                ],
              )),
        ]),
      ),
    );
    ;
  }
}
