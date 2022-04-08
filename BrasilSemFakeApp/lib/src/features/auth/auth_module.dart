import 'package:basearch/src/features/auth/presentation/view/page/forgot_page2.dart';
import 'package:basearch/src/features/auth/presentation/view/page/get_start_page.dart';
import 'package:basearch/src/features/auth/presentation/view/page/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/repository/login_repository.dart';
import 'domain/repository/login_interface.dart';
import 'domain/usecase/login_usecase.dart';
import 'presentation/view/page/hero_page.dart';
import 'presentation/viewmodel/login_viewmodel.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => LoginViewModel()),
        Bind.factory((i) => LoginUseCase()),
        Bind.factory<ILogin>((i) => LoginRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HeroPage(), children: []),
        ChildRoute('/get-started', child: (_, __) => const GetStartPage()),
        ChildRoute('/register', child: (_, __) => const RegisterPage()),
        ChildRoute('/forgot', child: (_, __) => const ForgotPasswordPage2()),
      ];
}
