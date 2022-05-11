import 'package:basearch/src/features/home/presentation/view/page/Home.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/home', child: (_, __) => const HomePage(), children: []),
  ];
}