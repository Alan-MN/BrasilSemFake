import 'package:basearch/src/features/auth/domain/model/news.dart';
import 'package:basearch/src/features/auth/domain/repository/news_interface.dart';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsRepository implements INews {
  @override
  Future<News> create(News news) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      Dio dio = Dio();
      dio.options.headers["token"] = token;
      var response = await dio.post('https://api-brasil-sem-fake.herokuapp.com/report/create',
          data: {"title": news.title, "content": news.text});
      return News(response.data["title"], response.data["content"]);
    } catch (e) {
      return News("", "");
    }
  }
}
