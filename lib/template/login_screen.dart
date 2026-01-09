import 'package:flutter/material.dart';
import 'package:flutter_application_1/template/FoodMenu/first_screen.dart';
//import 'package:flutter_application_1/template/FoodMenu/first_screen.dart';
import 'package:flutter_application_1/template/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
  //const LoginScreen({super.key});
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  String _text = "";
  bool _hidePassword = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,
      body: InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 600),
            alignment: Alignment.center,
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person, size: 110, color: Color(0xFF26CCC2)),
                  Text(
                    "LOGIN",
                    style: GoogleFonts.volkhov(
                      color: Color(0xFF26CCC2),
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 120),
                  TextFormField(
                    controller: _emailCtrl,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      label: Text("Email"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(64),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Email is required";
                      }
                      if (EmailValidator.validate(value) == false) {
                        return "Email format is incorrect";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordCtrl,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      label: Text("Password"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(64),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _hidePassword = !_hidePassword;
                          });
                        },
                        icon: Icon(
                          _hidePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    obscureText: _hidePassword,
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          return;
                        }
                        if (_emailCtrl.text == "admin@gmail.com" &&
                            _passwordCtrl.text == "admin123") {
                          setState(() {
                            _text = "Login Successful";
                          });
                          debugPrint(_text);
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => FirstScreen(),
                            ),
                          );
                        } else {
                          setState(() {
                            _text = "Login Failed";
                          });
                          debugPrint(_text);
                        }
                      },
                      icon: Icon(Icons.login),
                      label: Text("LOGIN"),
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: double.maxFinite,
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.person),
                      label: Text("Register New Account"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
