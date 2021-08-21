import 'package:flutter/material.dart';
import 'package:skripsian/constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var username;
  var password;
  var phone;
  var email;
  var address;
  // final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Form(
            // key: _formKey,
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/Logo_Black.png'),
              width: 205,
              height: 140,
            ),
            Text('Sign Up'),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
              validator: (val) {
                if (val!.isEmpty) return "Username cannot be empyt";
                username = val;
                return null;
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              validator: (val) {
                if (val!.isEmpty) return "Password cannot be empyt";
                password = val;
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
              validator: (val) {
                if (val!.isEmpty) return "Phone Number cannot be empyt";
                if (!val.isValidPhone) return "Please enter valid phone number";
                phone = val;
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              validator: (val) {
                if (val!.isEmpty) return "Email cannot be empyt";
                if (!val.isValidEmail) return "Please enter valid email";
                email = val;
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Address',
              ),
              validator: (val) {
                if (val!.isEmpty) return "Address cannot be empyt";
                email = val;
                return null;
              },
            ),
            ElevatedButton(
              child: Text(
                'Register',
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
                // if (_formKey.currentState!.validate()) _register();
              },
            ),
          ],
        )),
      ),
    );
  }

  void _register() {}
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = new RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}
