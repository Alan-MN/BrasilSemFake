import 'package:basearch/src/features/auth/domain/model/news_verification.dart';
import 'package:basearch/src/features/auth/presentation/viewmodel/news_viewmodel.dart';
import 'package:basearch/src/features/home/presentation/view/page/news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'chatDetailPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var validator = NewsVerification();
  final _formKey = GlobalKey<FormState>();
  final _createnews = NewsViewModel();

  final screens = [NewsPage()];
  _textField(
      {String? labelText,
      onChanged,
      formValidator,
      required bool isPassword,
      maxLines = 1}) {
    return Container(
        padding: const EdgeInsets.only(
          top: 15,
        ),
        child: TextFormField(
          maxLines: maxLines,
          onChanged: onChanged,
          validator: (value) {
            return formValidator;
          },
          style: TextStyle(color: Colors.white),
          obscureText: isPassword,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 0.0),
            ),
            border: OutlineInputBorder(),
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            labelText: labelText,
          ),
        ));
  }

  Widget get _inviteRegister => Container(
      padding: const EdgeInsets.only(
        top: 25,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 45,
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _createnews.create();
              Navigator.pop(context);
            }
          },
          child: Text('submit'.i18n()),
        ),
      ));

  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[0],
      bottomNavigationBar: BottomAppBar(
          color: Color(0xffffa000),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: IconButton(
                      splashRadius: 16,
                      icon: Icon(Icons.map, color: Colors.white),
                      onPressed: () {}),
                ),
                Spacer(),
                IconButton(
                    splashRadius: 16,
                    icon:
                        Icon(Icons.account_circle_rounded, color: Colors.white),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ChatDetailPage();
                      }));
                    }),
                IconButton(
                    splashRadius: 16,
                    icon: Icon(Icons.logout, color: Colors.white),
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.remove('token');
                      Modular.to.navigate('/login');
                    }),
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white),
          onPressed: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10.0))),
                backgroundColor: Colors.grey[700],
                context: context,
                isScrollControlled: true,
                builder: (context) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                      height: 500,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('addNews'.i18n(),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white)),
                          Form(
                              key: _formKey,
                              child: Column(children: [
                                Observer(
                                  builder: (_) {
                                    return _textField(
                                        labelText: "Título",
                                        onChanged: _createnews.setTitle,
                                        formValidator:
                                            validator.titleVerification(
                                                _createnews.getTitle()
                                                    as String),
                                        isPassword: false);
                                  },
                                ),
                                Observer(
                                  builder: (_) {
                                    return _textField(
                                        labelText: "Corpo da notícia",
                                        onChanged: _createnews.setText,
                                        formValidator:
                                            validator.textVerification(
                                                _createnews.getText()
                                                    as String),
                                        isPassword: false,
                                        maxLines: 8);
                                  },
                                ),
                                _inviteRegister
                              ]))
                        ],
                      ),
                    )));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
