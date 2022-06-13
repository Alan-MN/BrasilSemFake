import 'package:localization/localization.dart';

class NewsVerification {

  String? titleVerification(String title) {
    if (title.isEmpty) {
      return 'newsEmptyTitle'.i18n();
    }

    return null;
  }

  String? textVerification(String text) {
    if (text.isEmpty) {
      return 'newsEmptyBody'.i18n();
    }

    return null;
  }
}
