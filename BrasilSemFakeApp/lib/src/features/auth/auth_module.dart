import 'package:basearch/src/features/auth/data/repository/news_repository.dart';
import 'package:basearch/src/features/auth/data/repository/register_repository.dart';
import 'package:basearch/src/features/auth/domain/repository/news_interface.dart';
import 'package:basearch/src/features/auth/domain/repository/register_interface.dart';
import 'package:basearch/src/features/auth/domain/usecase/create_user_usecase.dart';
import 'package:basearch/src/features/auth/domain/usecase/news_usecase.dart';
import 'package:basearch/src/features/auth/presentation/view/page/forgot_page2.dart';
import 'package:basearch/src/features/auth/presentation/view/page/get_start_page.dart';
import 'package:basearch/src/features/auth/presentation/view/page/login_page.dart';
import 'package:basearch/src/features/auth/presentation/view/page/otpassword_page.dart';
import 'package:basearch/src/features/auth/presentation/view/page/register_page.dart';
import 'package:basearch/src/features/auth/presentation/viewmodel/register_viewmodel.dart';
import 'package:basearch/src/features/home/presentation/view/page/news_data.dart';
import 'package:basearch/src/features/home/presentation/view/page/news_page.dart';
import 'package:basearch/src/features/onboarding/presentation/view/page/onboarding_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home/presentation/view/page/Home.dart';
import 'auth_guard.dart';
import 'data/repository/login_repository.dart';
import 'domain/repository/login_interface.dart';
import 'domain/usecase/login_usecase.dart';
import 'presentation/view/page/hero_page.dart';
import 'presentation/view/page/password_change.dart';
import 'presentation/viewmodel/login_viewmodel.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => LoginViewModel()),
        Bind.factory((i) => RegisterViewModel()),
        Bind.factory((i) => LoginUseCase()),
        Bind.factory((i) => CreateUserUseCase()),
        Bind.factory((i) => NewsUseCase()),
        Bind.factory<INews>((i) => NewsRepository()),
        Bind.factory<ILogin>((i) => LoginRepository()),
        Bind.factory<IRegister>((i) => CreateRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HeroPage(), children: []),
        ChildRoute('/get-started', child: (_, __) => const GetStartPage()),
        ChildRoute('/register', child: (_, __) => const RegisterPage()),
        ChildRoute('/login', child: (_, __) => const LoginPage()),
        ChildRoute('/forgot', child: (_, __) => const ForgotPasswordPage2()),
        ChildRoute('/Onboarding', child: (_, __) => OnboardingPage()),
        ChildRoute('/otpassword', child: (_, __) => const OtpasswordPage()),
        ChildRoute('/home',
            child: (_, __) => const HomePage(), guards: [AuthGuard()]),
        ChildRoute('/passwordChange',
            child: (_, __) => const PasswordChangePage()),
        ChildRoute('/news-data', child: (context, args) => NewsData(arguments: args.data)),
      ];
}
