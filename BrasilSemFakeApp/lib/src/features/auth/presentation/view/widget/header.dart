import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key, key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 16, right: 22, left: 12),
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
        )
      ],
    );
  }
}