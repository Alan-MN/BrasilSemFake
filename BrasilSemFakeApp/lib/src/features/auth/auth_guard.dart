import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/login');

  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('token');
    if(data != null) return true;
    return false;
  }
}