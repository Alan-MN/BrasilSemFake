import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget get _headerContainer => Container(
        margin: const EdgeInsets.only(top: 16, right: 22, left: 12),
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
          ),
        );

  Widget get _passwordBox => Container(
        padding: const EdgeInsets.only(
          top: 25,
          left: 20,
          right: 20,
        ),
        child: TextFormField(
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              labelText: 'Password',
              border: const OutlineInputBorder(),
              labelStyle: Theme.of(context).textTheme.subtitle1),
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
          onPressed: () {},
          child: Text('login'.i18n()),
          ),
        )
      );

  Widget get _forgotPassword => Container(
        margin: const EdgeInsets.only(top: 220),
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
            _headerContainer,
            _loginText,
            _loginSubtext,
            _usernameBox,
            _passwordBox,
            _loginButton,
            _forgotPassword
          ]
        ),
      ),
    );
  }
}
