import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';
import '../widget/header.dart';

class OtpasswordPage extends StatefulWidget {
  const OtpasswordPage({Key? key}) : super(key: key);

  @override
  State<OtpasswordPage> createState() => _OtpasswordPageState();
}

class _OtpasswordPageState extends State<OtpasswordPage> {
  Widget get _photoContainer => Container(
        margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 65.0),
            SvgPicture.asset(
              'lib/assets/images/mailbox_recovery.svg',
              semanticsLabel: 'Mailbox',
            ),
          ],
        ),
      );

  Widget get _enterCode => Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
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
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'enterCodeDiscription'.i18n(),
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ));

  final usernameController = TextEditingController();
  final codeController = TextEditingController();
  Widget get _textInput => Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                  labelText: 'insert your username',
                  border: OutlineInputBorder())),
          TextField(
              controller: codeController,
              decoration: const InputDecoration(
                  labelText: 'insert your recovery code',
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
          onPressed: () {
            Modular.to.navigate('/passwordChange');
          },
          child: Text(
            'otpBottomButton'.i18n(),
          ),
        ),
      );
  Widget get _bottomText => Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                'codText1'.i18n(),
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'codTextButton'.i18n(),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                'codText2'.i18n(),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderWidget(),
        _photoContainer,
        _enterCode,
        _enterCodeText,
        _textInput,
        _bottomButton,
        _bottomText
      ],
    ));
  }
}
