import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../auth/domain/model/login_info_verification.dart';
import '../widget/header.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  var validator = LoginInfoVerification();
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  Widget get _createAccountText => Container(
        margin: const EdgeInsets.only(top: 40, right: 120),
        child: Text(
          'create_account'.i18n(),
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
          // textAlign: TextAlign.left,
        ),
      );

  Widget get _usernameBox => Container(
        padding: const EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
        ),
        child: TextFormField(
          controller: _usernameController,
          validator: (value) {
            return validator.userVerification(value as String);
          },
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
              labelText: 'Username',
              border: const OutlineInputBorder(),
              labelStyle: Theme.of(context).textTheme.subtitle1),
        ),
      );

  Widget get _mailBox => Container(
        padding: const EdgeInsets.only(
          top: 25,
          left: 20,
          right: 20,
        ),
        child: TextFormField(
          controller: _emailController,
          validator: (value) {
            return validator.mailVerificatio(value as String);
          },
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: 'E-mail',
              border: const OutlineInputBorder(),
              labelStyle: Theme.of(context).textTheme.subtitle1),
        ),
      );

  Widget get _passwordBox => Container(
        padding: const EdgeInsets.only(
          top: 25,
          left: 20,
          right: 20,
        ),
        child: TextFormField(
          controller: _passwordController,
          validator: (value) {
            return validator.passwordVerification(value as String);
          },
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              labelText: 'Password',
              border: const OutlineInputBorder(),
              labelStyle: Theme.of(context).textTheme.subtitle1),
        ),
      );

  Widget get _textcreateaccount => Container(
        padding: const EdgeInsets.only(
          top: 25,
          left: 20,
          right: 50,
        ),
        child: Text(
          'create_text'.i18n(),
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 15),
        ),
      );

  Widget get _termOfUse => Container(
        padding: const EdgeInsets.only(
          top: 25,
          left: 20,
          right: 20,
        ),
        child: Text('term_of_use'.i18n()),
      );

  Widget get _inviteRegister => Container(
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
              print("IMPLEMENTA O CADASTRO");
            }
          },
          child: Text('create_account'.i18n()),
          ),
        )
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        children: [
          const HeaderWidget(),
          _createAccountText,
          _textcreateaccount,
          Form(
            key: _formKey,
              child: Column(
                children: [
                  _usernameBox,
                  _mailBox,
                  _passwordBox,
                  Container(
              padding: const EdgeInsets.only(
                top: 25,
                left: 30,
                right: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            _termOfUse,
            _inviteRegister,
            ]
            ) ,
          ),
        ],
      ),
      )
    );
  }
}
