import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
        margin: const EdgeInsets.only(top: 40, left: 1),
        child: Text(
          'create_account'.i18n(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.left,
        ),
      );

  Widget get _usernameBox => Container(
        padding: const EdgeInsets.only(
          top: 40,
          left: 20,
          right: 70,
        ),
        child: TextFormField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
              labelText: 'Username',
              labelStyle: Theme.of(context).textTheme.subtitle1),
          textAlign: TextAlign.center,
        ),
      );

  Widget get _mailBox => Container(
        padding: const EdgeInsets.only(
          top: 40,
          left: 20,
          right: 70,
        ),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: 'E-mail',
              labelStyle: Theme.of(context).textTheme.subtitle1),
          textAlign: TextAlign.center,
        ),
      );

  Widget get _passwordBox => Container(
        padding: const EdgeInsets.only(
          top: 40,
          left: 20,
          right: 70,
        ),
        child: TextFormField(
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: Theme.of(context).textTheme.subtitle1),
          textAlign: TextAlign.center,
        ),
      );

  Widget get _textcreateaccount => Container(
        padding: const EdgeInsets.only(
          top: 40,
          left: 20,
          right: 70,
        ),
        child: Text(
          'create_text'.i18n(),
          textAlign: TextAlign.left,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        _headerContainer,
        _createAccountText,
        _textcreateaccount,
        _usernameBox,
        _mailBox,
        _passwordBox,
      ],
    ));
  }
}
