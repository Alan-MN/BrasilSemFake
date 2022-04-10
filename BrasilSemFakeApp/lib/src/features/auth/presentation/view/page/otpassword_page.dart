import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';

class OtpasswordPage extends StatefulWidget {
  const OtpasswordPage({Key? key}) : super(key: key);

  @override
  State<OtpasswordPage> createState() => _OtpasswordPageState();
}

class _OtpasswordPageState extends State<OtpasswordPage> {
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
  Widget get _photoContainer => Container(
        margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80.0),
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
  Widget get _textInput => Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder())),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder())),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder())),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder())),
            ),
          ),
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
          onPressed: () {},
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
        _headerContainer,
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
