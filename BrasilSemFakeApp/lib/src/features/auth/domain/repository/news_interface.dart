import 'package:basearch/src/features/auth/domain/model/news.dart';

abstract class INews {
  Future<News> create(News news);
}