import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        ),
        onPressed: () async{
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.remove('token');
          Modular.to.navigate('/login');
         },
        child: Text('Logout'),
      ),
    );
  }
}
