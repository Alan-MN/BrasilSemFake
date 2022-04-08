import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';

//cores ainda não padronizadas.
//estruturação
class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: ListView(children: [
          SizedBox(
            width: 200,
            height: 200,
            child: SvgPicture.asset(
              'lib/assets/images/forgot.svg',
              semanticsLabel: 'Forgot Image',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'forgot'.i18n(),
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'forgot_text'.i18n(),
            style: Theme.of(context).textTheme.subtitle2,
            textAlign: TextAlign.center,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "E-mail",
            ),
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Text(
              'SUBMIT',
              textAlign: TextAlign.left,
            ),
          ),
        ]),
      ),
    );
  }
}
