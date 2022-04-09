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
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 80),
          Text(
            'enterCodeTitle'.i18n(),
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ],
      ));

  Widget get _enterCodeText => Container(
          child: Row(
        children: [
          //Padding(padding: padding);
          Text(
            'enterCodeDiscription'.i18n(),
            style: const TextStyle(fontSize: 15),
            textAlign: TextAlign.start,
          ),
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [_headerContainer, _photoContainer, _enterCode, _enterCodeText],
    ));
  }
}
