import 'package:basearch/src/features/auth/presentation/view/widget/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:dio/dio.dart';

var dio = Dio();

class PasswordChangePage extends StatefulWidget {
  const PasswordChangePage({Key? key}) : super(key: key);

  @override
  State<PasswordChangePage> createState() => _PasswordChangePageState();
}

class _PasswordChangePageState extends State<PasswordChangePage> {
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

  final newPasswordController = TextEditingController();
  final newPasswordConfirmationController = TextEditingController();
  Widget get _textInput => Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
              controller: newPasswordController,
              decoration: InputDecoration(
                  labelText: 'enterNewPassword'.i18n(),
                  border: OutlineInputBorder())),
          TextField(
              controller: newPasswordConfirmationController,
              decoration: InputDecoration(
                  labelText: 'ConfirmNewPassword'.i18n(),
                  border: OutlineInputBorder())),
        ],
      ));

  Widget get _bottomButton => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 60,
        alignment: Alignment.center,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(40),
          ),
          onPressed: () async {
            // Response response = await dio
            //     .post('http://10.0.2.2:8000/recovery/validate', data: {
            //   'username': usernameController.text,
            //   'recovery_code': codeController.text
            // });
            // if (newPasswordConfirmationController == newPasswordController) {

            // }
          },
          child: Text(
            'passwordChangeButton'.i18n(),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      const HeaderWidget(),
      _enterPasswordTitile,
      _textInput,
      _bottomButton
    ])));
  }
}
