import 'package:basearch/src/features/auth/domain/model/News.dart';
import 'package:basearch/src/features/auth/domain/model/news_res.dart';
import 'package:basearch/src/features/home/presentation/view/widget/news.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Future<List<NewsRes>> newReports = _getNews();

  @override
  void initState() {
    super.initState();
    _getNews();
  } 

  static Future<List<NewsRes>> _getNews() async {
    var response = await Dio().get('http://localhost:8000/reports');
    var decoded = jsonDecode(jsonEncode(response.data));
    List<NewsRes> result = List<NewsRes>.from(decoded.map((data) => NewsRes.fromJson(data))).toList();
    return result;
  }

  Widget get _banner => Container(
    width: double.infinity,
    height: 120,
    decoration: new BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(3)),
      color: Color(0xffffa000)
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: 
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: Text(
                    '👋 Bem vindo !!',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600
                    ),
                  ),
                )
              )
            ],
          ),
          Row(
            children: [
              Expanded(child: 
                Text(
                  'Nessa primeira página se encontra todas as noticias que foram recentemente analizadas por nosso algoritmo, sinta-se a vontade para checar as noticias !',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: TextStyle(
                    fontSize: 12, 
                  ),
                )
              )
            ],
          ),
        ],
      )
    ),
  );

  Widget get _filter => Container(
    width: double.infinity,
    margin: EdgeInsets.only(top: 15),
    decoration: new BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(3)),
    ),
    child: Column(
        children: [
          Row(
            children: [
              Text("News",
                style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w600
                )
              ),
              Spacer(),
              IconButton(splashRadius: 16, icon: Icon(Icons.refresh, color: Colors.white, size: 20), onPressed: () { setState(() {
                newReports = _getNews();
              }); }),
            ],
          ),
        ],
      )
    );

  Widget buildNews(List<NewsRes> news) => ListView.builder(
    itemCount: news.length,
    shrinkWrap: true,
    itemBuilder: (context, index) {
      final report = news[index]; 
      return Container(
        child: NewsWidget(title: report.title, text: report.content)
      );
    }
  );

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding (
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              _banner,
              _filter,
              FutureBuilder<List<NewsRes>>(
                future: newReports,
                builder: (context, build) {
                  if(build.hasData){
                    final news = build.data!;
                    return buildNews(news);
                  }
                    return Text("no data");
                },
              )
            ],
          )
        ) 
      )
    );
  }
}
