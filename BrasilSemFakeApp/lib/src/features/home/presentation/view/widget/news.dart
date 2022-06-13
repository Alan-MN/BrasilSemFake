import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewsWidget extends StatelessWidget {
  final String title;
  final String text;

  const NewsWidget({
    Key, key,
    required this.title, required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 95,
          padding: EdgeInsets.all(8),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            color: Colors.grey[700]
          ),
          margin: const EdgeInsets.only(top: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child:
                    Text(this.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600
                      )
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(child: 
                    Text(
                      this.text,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 12, 
                      ),
                    )
                  )
                ],
              ),
              Row(
                children: [
                  Spacer(),
                  TextButton(onPressed: () {}, 
                    child: Text('readRore'.i18n(),
                      style: TextStyle(fontWeight: FontWeight.w600)  
                    )
                  )
                ],
              ),
            ],
          )
        )
      ],
    );
  }
}