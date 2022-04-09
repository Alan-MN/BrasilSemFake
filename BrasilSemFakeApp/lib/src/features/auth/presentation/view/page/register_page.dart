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
        margin: const EdgeInsets.only(top: 40, right: 155),
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
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
              labelText: 'Username',
              border: const OutlineInputBorder(),
              labelStyle: Theme.of(context).textTheme.subtitle1),
          textAlign: TextAlign.center,
        ),
      );

  Widget get _mailBox => Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: 'E-mail',
              border: const OutlineInputBorder(),
              labelStyle: Theme.of(context).textTheme.subtitle1),
          textAlign: TextAlign.center,
        ),
      );

  Widget get _passwordBox => Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: TextFormField(
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              labelText: 'Password',
              border: const OutlineInputBorder(),
              labelStyle: Theme.of(context).textTheme.subtitle1),
          textAlign: TextAlign.center,
        ),
      );

  Widget get _textcreateaccount => Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 70,
        ),
        child: Text(
          'create_text'.i18n(),
          textAlign: TextAlign.left,
        ),
      );

  Widget get _dateDayBox => Container(
        padding: const EdgeInsets.only(
          top: 40,
          // left: 20,
          // right: 20,
        ),
        child: TextFormField(
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              labelText: 'Day',
              border: const OutlineInputBorder(),
              labelStyle: Theme.of(context).textTheme.subtitle1),
          textAlign: TextAlign.center,
        ),
      );

  Widget get _dateMonthBox => Container(
        padding: const EdgeInsets.only(
          top: 40,
          // left: 20,
          // right: 20,
        ),
        child: TextFormField(
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              labelText: 'Month',
              border: const OutlineInputBorder(),
              labelStyle: Theme.of(context).textTheme.subtitle1),
          textAlign: TextAlign.center,
        ),
      );

  Widget get _dateYearBox => Container(
        padding: const EdgeInsets.only(
          top: 40,
          // left: 20,
          // right: 20,
        ),
        child: TextFormField(
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              labelText: 'Year',
              border: const OutlineInputBorder(),
              labelStyle: Theme.of(context).textTheme.subtitle1),
          textAlign: TextAlign.center,
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
