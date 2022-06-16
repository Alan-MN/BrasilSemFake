import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';
import '../widget/header.dart';

var dio = Dio();

class OtpasswordPage extends StatefulWidget {
  const OtpasswordPage({Key? key}) : super(key: key);

  @override
  State<OtpasswordPage> createState() => _OtpasswordPageState();
}

class _OtpasswordPageState extends State<OtpasswordPage> {
  Widget get _photoContainer => Container(
        margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
        child: Align(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'lib/assets/images/mailbox_recovery.svg',
            semanticsLabel: 'Mailbox',
          ),
        ),
      );

  Widget get _enterCode => Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 80),
          Text(
            'enterCodeTitle'.i18n(),
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ],
      ));

  Widget get _enterCodeText => Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'enterCodeDiscription'.i18n(),
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ));

  final codeController = TextEditingController();
  Widget get _textInput => Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
              controller: codeController,
              decoration: const InputDecoration(
                  labelText: 'insert your recovery code',
                  border: OutlineInputBorder())),
        ],
      ));
  Widget get _bottomText => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Modular.to.navigate('/forgot');
              },
              child: Text(
                'codTextButton'.i18n(),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
        body: SingleChildScrollView(
      reverse: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderWidget(),
          const SizedBox(height: 65.0),
          _photoContainer,
          const Padding(padding: EdgeInsets.all(10.0)),
          _enterCode,
          const Padding(padding: EdgeInsets.all(5.0)),
          _enterCodeText,
          const Padding(padding: EdgeInsets.all(20.0)),
          _textInput,
          const Padding(padding: EdgeInsets.all(5.0)),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(40),
              ),
              onPressed: () async {
                Response response = await dio
                    .post('http://10.0.2.2:8000/recovery/validate', data: {
                  'username': username,
                  'recovery_code': codeController.text
                });
                if (response.data) {
                  Navigator.pushNamed(context, '/passwordChange',
                      arguments: username);
                }
              },
              child: Text(
                'otpBottomButton'.i18n(),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(10.0)),
          _bottomText
        ],
      ),
    ));
  }
}
