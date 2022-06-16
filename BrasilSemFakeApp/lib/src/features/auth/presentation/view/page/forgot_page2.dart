import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:basearch/src/theme.dart';
import '../widget/header.dart';

var dio = Dio();

class ForgotPasswordPage2 extends StatefulWidget {
  const ForgotPasswordPage2({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage2> createState() => _ForgotPassword2PageState();
}

class _ForgotPassword2PageState extends State<ForgotPasswordPage2> {
  Widget get _photoContainer => Container(
        padding: const EdgeInsets.only(
          top: 40,
        ),
        width: 300,
        margin: const EdgeInsets.only(top: 56),
        child: Row(
          children: [
            SizedBox(
              width: 300,
              height: 200,
              child: SvgPicture.asset(
                'lib/assets/images/forgot.svg',
                semanticsLabel: 'Forgot Image',
              ),
            ),
          ],
        ),
      );

  Widget get _forgot => Container(
      padding: const EdgeInsets.only(
        top: 40,
        left: 25,
        right: 70,
      ),
      child: Row(
        children: [
          Text('forgot_password'.i18n(),
              textAlign: TextAlign.left,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        ],
      ));

  Widget get _forgotText => Container(
        padding: const EdgeInsets.only(
          top: 15,
          right: 70,
        ),
        child: Text(
          'forgot_text'.i18n(),
          textAlign: TextAlign.left,
        ),
      );

  final email_controller = TextEditingController();
  Widget get _mailBox => Container(
        padding: const EdgeInsets.only(
          top: 40,
          left: 20,
          right: 20,
        ),
        child: TextFormField(
          controller: email_controller,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: 'E-mail',
              border: const OutlineInputBorder(),
              labelStyle: Theme.of(context).textTheme.subtitle1),
        ),
      );

  Widget get _bottom => Container(
      padding: const EdgeInsets.only(
        top: 25,
        left: 20,
        right: 20,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 45,
        child: ElevatedButton(
          onPressed: () async {
            Response response = await dio.post(
                'https://api-brasil-sem-fake.herokuapp.com/recovery/forgot',
                data: {'email': email_controller.text});
            if (response.data.isNotEmpty) {
              Navigator.pushNamed(context, '/otpassword',
                  arguments: response.data);
            }
          },
          child: Text('submit'.i18n()),
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        const HeaderWidget(),
        _photoContainer,
        _forgot,
        _forgotText,
        _mailBox,
        _bottom,
      ]),
    ));
  }
}
