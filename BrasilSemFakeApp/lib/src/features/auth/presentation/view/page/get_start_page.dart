import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';

class GetStartPage extends StatefulWidget {
  const GetStartPage({Key? key}) : super(key: key);

  @override
  State<GetStartPage> createState() => _GetStartPageState();
}

class _GetStartPageState extends State<GetStartPage> {
  Widget get _gettingStartImage =>
      SvgPicture.asset('lib/assets/images/get-started.svg',
          semanticsLabel: 'Get Started Image');

  Widget get _gettingStartSubtittle => Container(
        width: 300,
        margin: const EdgeInsets.only(top: 62),
        child: Text(
          'create_account_motivation'.i18n(),
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.center,
        ),
      );

  Widget get _headerContainer => Container(
        margin: const EdgeInsets.only(top: 16, right: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset('lib/assets/images/logo.svg',
                semanticsLabel: 'Get Started Image', height: 36),
            Container(
              margin: const EdgeInsets.only(left: 5),
              child: const Text('Brasil Sem Fake',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            )
          ],
        ),
      );

  Widget get _footerButtons => Container(
        padding: const EdgeInsets.only(right: 45, left: 45),
        margin: const EdgeInsets.only(bottom: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                Modular.to.navigate('/login');
              },
              child: Text('login'.i18n()),
            ),
            ElevatedButton(
              onPressed: () {
                Modular.to.navigate('/register');
              },
              child: Text('register'.i18n()),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      children: [
        _headerContainer,
        Expanded(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [_gettingStartImage, _gettingStartSubtittle])),
        ),
        _footerButtons
      ],
    ));
  }
}
