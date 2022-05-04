import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../auth/domain/model/login_info_verification.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  var validator = LoginInfoVerification();

  final _formKey = GlobalKey<FormState>();

  Widget get _headerContainer => Container(
        margin: const EdgeInsets.only(top: 16, right: 22, left: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Modular.to.navigate('/get-started');
                },
                icon: SvgPicture.asset('lib/assets/images/backHome.svg')),
            Row(
              children: [
                SvgPicture.asset('lib/assets/images/logo.svg',
                    semanticsLabel: 'Logo image', height: 36),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Text("app_name".i18n(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700)),
                )
              ],
            )
          ],
        ),
      );

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

  String dropdownValue = 'Day';
  String monthValue = 'Month';
  String yearValue = 'Year';

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
            _formKey.currentState!.validate();
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
          _headerContainer,
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
