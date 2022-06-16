import 'package:basearch/src/features/auth/domain/model/news.dart';
import 'package:basearch/src/features/auth/domain/repository/news_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewsUseCase {
  final repository = Modular.get<INews>();

  Future<News> create(String title, String text) async {
    return await repository.create(News(title, text));
  }
}
