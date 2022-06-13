class NewsVerification {

  String? titleVerification(String title) {
    if (title.isEmpty) {
      return 'Insira um título';
    }

    return null;
  }

  String? textVerification(String text) {
    if (text.isEmpty) {
      return 'Insira um texto';
    }

    return null;
  }
}
