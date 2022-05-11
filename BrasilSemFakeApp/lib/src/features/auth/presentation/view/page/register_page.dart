import 'package:basearch/src/features/auth/presentation/viewmodel/register_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../auth/domain/model/login_info_verification.dart';
import '../widget/header.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  var validator = LoginInfoVerification();
  final _formKey = GlobalKey<FormState>();
  final _register = RegisterViewModel();

  _textField({String? labelText, onChanged, formValidator, required bool isPassword}){
    return Container(
      padding: const EdgeInsets.only(
        top: 25,
        left: 20,
        right: 20,
      ),
      child:  TextFormField(
        onChanged: onChanged,
        validator: (value) {
          return formValidator;
        },
        obscureText: isPassword,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0.0),
          ),
          border: OutlineInputBorder(),
          labelStyle: Theme.of(context).textTheme.subtitle1,
          labelText: labelText,
        ),
      )
    );
  }

  Widget get _createAccountText => Container(
        margin: const EdgeInsets.only(top: 40, right: 120),
        child: Text(
          'create_account'.i18n(),
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
          // textAlign: TextAlign.left,
        ),
      );

  Widget get _textcreateaccount => Container(
        padding: const EdgeInsets.only(
          top: 25,
          left: 20,
          right: 50,
        ),
        child: Text(
          'create_text'.i18n(),
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 15),
        ),
      );

  Widget get _termOfUse => Container(
        padding: const EdgeInsets.only(
          top: 25,
          left: 20,
          right: 20,
        ),
        child: Text('term_of_use'.i18n()),
      );

  Widget get _inviteRegister => Container(
        padding: const EdgeInsets.only(
          top: 25,
          left: 20,
          right: 20,
        ),
        child: SizedBox(
          width: double.infinity,
          height: 45,
          child: ElevatedButton(
          onPressed: () {
            if(_formKey.currentState!.validate()){
              _register.register();
              Modular.to.navigate('/login');
            }
          },
          child: Text('create_account'.i18n()),
          ),
        )
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        children: [
          const HeaderWidget(),
          _createAccountText,
          _textcreateaccount,
          Form(
            key: _formKey,
              child: Column(
                children: [
                  Observer(
                    builder: (_){
                      return _textField(
                        labelText: "Username", 
                        onChanged: _register.setUsername,
                        formValidator: validator.userVerification(_register.getUsername() as String),
                        isPassword: false
                      );
                    },
                  ),
                  Observer(
                    builder: (_){
                      return _textField(
                        labelText: "Email", 
                        onChanged: _register.setEmail,
                        formValidator: validator.mailVerificatio(_register.getEmail() as String),
                        isPassword: false
                      );
                    },
                  ),
                  Observer(
                    builder: (_){
                      return _textField(
                        labelText: "Password", 
                        onChanged: _register.setPassword,
                        formValidator: validator.passwordVerification(_register.getPassword() as String),
                        isPassword: true
                      );
                    },
                  ),
                  Container(
              padding: const EdgeInsets.only(
                top: 25,
                left: 30,
                right: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            _termOfUse,
            _inviteRegister,
            ]
            ) ,
          ),
        ],
      ),
      )
    );
  }
}
