import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:skripsian/components/RoundedInputField.dart';
import 'package:skripsian/components/RoundedInputPasswordField.dart';
import 'package:skripsian/constants.dart';
import 'package:skripsian/network_utils/api.dart';
import 'package:skripsian/screens/Auth/register.dart';
import 'package:skripsian/screens/main_menu.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var email;
  var password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/Logo_Black.png'),
                width: 205,
                height: 140,
              ),
              RoundedInputField(
                hintText: "Username",
                onChanged: (value) {},
                validator: (value) {
                  if (value.isEmpty) return 'please enter your username';
                  email = value;
                  return null;
                },
              ),
              RoundedInputPasswordField(
                onChanged: (value) {},
                validator: (value) {
                  if (value.isEmpty) return 'please enter your password';
                  password = value;
                  return null;
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ));
                },
                child: Text(
                  'Create new account',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              ElevatedButton(
                child: Text(
                  'Login',
                  style: new TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Nunito',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 35,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) _login();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    var data = {
      'email': email,
      'password': password,
    };
    var res = await Network().authData(data, '/login');
    var body = json.decode(res.body);
    if (body['success']) {
      final storage = new FlutterSecureStorage();
      await storage.write(key: 'token', value: body['data']['token']);
      Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
          builder: (context) => MainMenuPage(),
        ),
      );
    }
  }
}

// class LoginPage extends StatelessWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//             child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Image(
//           image: AssetImage('assets/Logo_Black.png'),
//           width: 205,
//           height: 140,
//         ),
//         RoundedInputField(
//           hintText: "Username",
//           onChanged: (value) {},
//         ),
//         RoundedInputPasswordField(
//           onChanged: (value) {},
//         ),
//         ElevatedButton(
//           child: Text(
//             'Login',
//             style: new TextStyle(
//               fontSize: 12.0,
//               fontFamily: 'Nunito',
//             ),
//           ),
//           style: ElevatedButton.styleFrom(
//             primary: kPrimaryColor,
//             padding: EdgeInsets.symmetric(
//               vertical: 10,
//               horizontal: 35,
//             ),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//           ),
//           onPressed: () {
//             // Navigator.pushReplacement(
//             //   context,
//             //   MaterialPageRoute(
//             //     builder: (context) {
//             //       return MainMenuPage();
//             //     },
//             //   ),
//             // );
//           },
//         ),
//       ],
//     )));
//   }
// }





