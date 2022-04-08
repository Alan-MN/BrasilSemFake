import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';

class HeroPage extends StatefulWidget {
  const HeroPage({Key? key}) : super(key: key);

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  Widget get _heroPageLogo => SvgPicture.asset('lib/assets/images/logo.svg',
      semanticsLabel: 'Application Logo');

  Widget get _heroPageTitle => Container(
    margin: const EdgeInsets.only(top: 16),
    child: Text('Brasil Sem Fake',
        style: Theme.of(context).textTheme.headline4
    ),
  );

  Widget get _heroPageDescription => Container(
    width: 300,
    margin: const EdgeInsets.only(top: 12, bottom:50),
    child: Text(
        'hero_page_subtitle'.i18n(),
        style: Theme.of(context).textTheme.subtitle1,
        textAlign: TextAlign.center,
      ),
  );

  Widget get _nextPageButton => Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      border: Border.all(width: 2, color: const Color(0XFFCED4DA))
    ),
    child: Ink(
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: const CircleBorder(),
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_forward_rounded),
        color: Colors.white,
        onPressed: () { Modular.to.navigate('/get-started'); },
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _heroPageLogo, 
            _heroPageTitle, 
            _heroPageDescription,
            _nextPageButton
          ]
        )
      ),
    );
  }
}
