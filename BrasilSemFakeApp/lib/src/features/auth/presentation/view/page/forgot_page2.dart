import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';

class ForgotPasswordPage2 extends StatefulWidget {
  const ForgotPasswordPage2({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage2> createState() => _ForgotPassword2PageState();
}

class _ForgotPassword2PageState extends State<ForgotPasswordPage2> {
  Widget get _headerContainer => Container(
        margin: const EdgeInsets.only(top: 16, right: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
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
        ),
      );

  Widget get _photoContainer => Container(
        padding: const EdgeInsets.only(
          top: 40,
        ),
        width: 300,
        margin: const EdgeInsets.only(top: 16),
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
          right: 70,
        ),
        child: Text(
          'forgot'.i18n(),
          textAlign: TextAlign.left,
        ),
      );
  Widget get _forgotText => Container(
        padding: const EdgeInsets.only(
          top: 40,
          left: 20,
          right: 70,
        ),
        child: Text(
          'forgot_text'.i18n(),
          textAlign: TextAlign.left,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        _headerContainer,
        _photoContainer,
        _forgot,
        _forgotText,
      ]),
    );
  }
}
