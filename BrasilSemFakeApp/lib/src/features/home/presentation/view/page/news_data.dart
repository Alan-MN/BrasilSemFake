import 'package:basearch/src/features/auth/domain/model/News.dart';
import 'package:basearch/src/features/auth/domain/model/news_res.dart';
import 'package:basearch/src/features/home/presentation/view/widget/news.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';

import 'package:localization/localization.dart';

Widget get _filter => Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 16, right: 22, left: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Modular.to.navigate('/home');
                  },
                  icon: SvgPicture.asset('lib/assets/images/backHome.svg')),
              Row(
                children: [
                  SvgPicture.asset('lib/assets/images/logo.svg',
                      semanticsLabel: 'Logo image', height: 36),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: Text("app_name".i18n(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700)),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );

class NewsData extends StatelessWidget {
  final NewsRes arguments;
  const NewsData({Key, key, required this.arguments}) : super(key: key);

  Color _card_color_picker() {
    if(arguments.status == "FAKE"){
      return Colors.red;
    }else if(arguments.status == "FATO") {
      return Colors.green;
    }
    return Colors.orange;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _filter,
            Padding (
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: _card_color_picker(),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                          margin: EdgeInsets.only(bottom: 8.0),
                          child: Text(arguments.status, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)) 
                        )
                      ]
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(child:
                          Text(arguments.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.w700
                            )
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      children: [
                        Text(arguments.created_at)
                      ],
                    )
                  ),
                  Row(
                    children: [
                      Expanded(child:
                        Text(arguments.content,
                          style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400
                          )
                        ),
                      )
                    ]
                  ),
                ],
              )
            )
          ] 
        ),
      )
    );
  }
}

