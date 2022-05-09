import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';
import '../../../domain/model/login_info_verification.dart';
import '../../viewmodel/login_viewmodel.dart';
import '../widget/header.dart';
import 'package:mobx/mobx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _login = LoginViewModel();
  final _formKey = GlobalKey<FormState>();
  final validator = LoginInfoVerification();

  _textField({String? labelText, onChanged, formValidator}){
    return Container(
      padding: const EdgeInsets.only(
        top: 25,
        left: 20,
        right: 20,
      ),
      child:  TextFormField(
        onChanged: onChanged,
        validator: (value) {
          return formValidator;
        },
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
        ),
      )
    );
  }

  Widget get _loginText => Container(
      margin: const EdgeInsets.only(top: 56, right: 22, left: 22),
      child: Row(
        children: [
          Text('welcome_back'.i18n(), 
            style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700
            )
          )
        ]
      ),
    );

  Widget get _loginSubtext => Container(
        margin: const EdgeInsets.only(top: 15, right: 22, left: 22, bottom: 50),
        child: Row(
          children: [
            Container(
              child: Text('login_subtext'.i18n(), 
              style: const TextStyle(
                  fontSize: 15
              )
            ),
            )
          ]
        ),
      );

  
  Widget get _loginButton => Container(
        padding: const EdgeInsets.only(
          top: 25,
          left: 20,
          right: 20,
        ),
        child: SizedBox(
          width: double.infinity,
          height: 45,
          child: ElevatedButton(
          onPressed: () {
            if(_formKey.currentState!.validate()){
              _login.login();
            }
          },
          child: Text('login'.i18n()),
          ),
        )
      );

  Widget get _forgotPassword => Container(
        margin: const EdgeInsets.only(top: 180),
        padding: const EdgeInsets.only(
          top: 25,
          left: 20,
          right: 20,
        ),
        child: TextButton(
          child: Text('forgot_password'.i18n()),
          onPressed: (){ Modular.to.navigate('/forgot');},
        )
      );
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            _loginText,
            _loginSubtext,
            Form(
            key: _formKey,
              child: Column(
                children: [
                  Observer(
                    builder: (_){
                      return _textField(
                        labelText: "Username", 
                        onChanged: _login.setUsername,
                        formValidator: validator.userVerification(_login.getUsername() as String)
                      );
                    },
                  ),
                  Observer(
                    builder: (_){
                      return _textField(
                        labelText: "Password", 
                        onChanged: _login.setPassword,
                        formValidator: validator.passwordVerification(_login.getPassword() as String)
                      );
                    },
                  ),
                  _loginButton,
                ],
              )
            ),
            _forgotPassword
          ]
        ),
      ),
    );
  }
}
