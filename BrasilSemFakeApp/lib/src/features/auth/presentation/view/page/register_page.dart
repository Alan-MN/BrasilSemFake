import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Widget get _headerContainer => Container(
        margin: const EdgeInsets.only(top: 16, right: 22, left: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Modular.to.navigate('/get-started');
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
      );

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

  Widget get _usernameBox => Container(
        padding: const EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
        ),
        child: TextFormField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
              labelText: 'Username',
              border: const OutlineInputBorder(),
              labelStyle: Theme.of(context).textTheme.subtitle1),
        ),
      );

  Widget get _mailBox => Container(
        padding: const EdgeInsets.only(
          top: 25,
          left: 20,
          right: 20,
        ),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: 'E-mail',
              border: const OutlineInputBorder(),
              labelStyle: Theme.of(context).textTheme.subtitle1),
        ),
      );

  Widget get _passwordBox => Container(
        padding: const EdgeInsets.only(
          top: 25,
          left: 20,
          right: 20,
        ),
        child: TextFormField(
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              labelText: 'Password',
              border: const OutlineInputBorder(),
              labelStyle: Theme.of(context).textTheme.subtitle1),
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

  String dropdownValue = 'Day';
  String monthValue = 'Month';
  String yearValue = 'Year';

  Widget get _dateDayBox => Container(
        child: Builder(builder: (context) {
          return DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.orange),
            underline: Container(
              height: 2,
              color: Colors.orangeAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>[
              'Day',
              '01',
              '02',
              '03',
              '04',
              '05',
              '06',
              '07',
              '08',
              '09',
              '10',
              '11',
              '12',
              '13',
              '14',
              '15',
              '16',
              '17',
              '18',
              '19',
              '20',
              '21',
              '22',
              '23',
              '24',
              '25',
              '26',
              '27',
              '28',
              '29'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          );
        }),
      );

  Widget get _dateMonthBox => Container(
        child: Builder(builder: (context) {
          return DropdownButton<String>(
            value: monthValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.orange),
            underline: Container(
              height: 2,
              color: Colors.orangeAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                monthValue = newValue!;
              });
            },
            items: <String>[
              'Month',
              '01',
              '02',
              '03',
              '04',
              '05',
              '06',
              '07',
              '08',
              '09',
              '10',
              '11',
              '12'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          );
        }),
      );

  Widget get _dateYearBox => Container(
        child: Builder(builder: (context) {
          return DropdownButton<String>(
            value: yearValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.orange),
            underline: Container(
              height: 2,
              color: Colors.orangeAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                yearValue = newValue!;
              });
            },
            items: <String>['Year', '2022', '2021', '2020', '2019']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          );
        }),
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
          onPressed: () {},
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
          _headerContainer,
          _createAccountText,
          _textcreateaccount,
          _usernameBox,
          _mailBox,
          _passwordBox,
          Container(
            padding: const EdgeInsets.only(
              top: 25,
              left: 30,
              right: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_dateDayBox, _dateMonthBox, _dateYearBox],
            ),
          ),
          _termOfUse,
          _inviteRegister,
        ],
      ),
      )
    );
  }
}
