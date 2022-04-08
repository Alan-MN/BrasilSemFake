import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  Widget get _headerContainer => Container(
    margin: const EdgeInsets.only(top: 16, right: 22),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SvgPicture.asset('lib/assets/images/logo.svg',
          semanticsLabel: 'Get Started Image', height: 36),
        Container(
          margin: const EdgeInsets.only(left: 5),
          child: const Text(
            'Brasil Sem Fake', 
            style: TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.w700 
            )
          ),
        )
      ],
    ),
  );

  Widget get _createAccountText => Container(
    margin: const EdgeInsets.only(top: 40, left: 25),
    child: const Text(
      'Create a account', 
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _headerContainer,
          Row(
            children: [
              _createAccountText
            ]
          )
        ],
      )
    );
  }
}
