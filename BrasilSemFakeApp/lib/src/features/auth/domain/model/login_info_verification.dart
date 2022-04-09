import 'package:localization/localization.dart';
import 'package:email_validator/email_validator.dart';

class LoginInfoVerification {
  String? passwordVerification(String password) {
    RegExp caracteresminusculos = RegExp(r"(?=.*[a-z])");
    RegExp caracteresmaiusculos = RegExp(r"(?=.*[A-Z])");
    RegExp numeros = RegExp(r"(?=.*[0-9])");
    RegExp caracteresespeciais = RegExp(r"(?=.*[!@#/$*~ç])");

    if (password.length < 8) {
      return 'password_min_size'.i18n();
    }
    if (!caracteresminusculos.hasMatch(password)) {
      return 'password_lowercase_req'.i18n();
    }
    if (!caracteresmaiusculos.hasMatch(password)) {
      return 'password_uppercase_req'.i18n();
    }
    if (!numeros.hasMatch(password)) {
      return 'password_number_req'.i18n();
    }
    if (!caracteresespeciais.hasMatch(password)) {
      return 'password_specialcaracter_req'.i18n();
    }

    return null;
  }

  String? mailVerificatio(String email) {
    if (!EmailValidator.validate(email)) {
      return 'invalid_email'.i18n();
    }
    return null;
  }
}
