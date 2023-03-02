import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/constants/custom_colors.dart';
import '../../shared/constants/preferences_key.dart';
import '../../shared/models/login_model.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  TextEditingController _confirmInputController = TextEditingController();

  bool showPassword = false;
  Color topColor = CustomColors().getGradientTopColor();
  Color bottomColor = CustomColors().getGradientBottomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              topColor,
              bottomColor,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Cadastro",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameInputController,
                      style: TextStyle(color: Colors.white),
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: "Nome",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _mailInputController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _passwordInputController,
                      obscureText: (this.showPassword == false) ? true : false,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _confirmInputController,
                      obscureText: (this.showPassword == false) ? true : false,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        labelText: "Confirme a senha",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              Row(
                children: [
                  Checkbox(
                    value: showPassword,
                    onChanged: (value) {
                      setState(() {
                        showPassword = value!;
                        print(showPassword);
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                  Text(
                    "Mostrar senha?",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              ElevatedButton(
                onPressed: () {
                  _doSignUp();
                  Navigator.pop(context);
                },
                child: Text(
                  "Cadastrar-se",
                  style: TextStyle(color: bottomColor),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _doSignUp() {
    LoginModel newUser = LoginModel(
      name: _nameInputController.text,
      mail: _mailInputController.text,
      password: _passwordInputController.text,
      keppOn: true,
    );

    print(newUser);
    _saveUser(newUser);
  }

  void _saveUser(LoginModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      PreferencesKeys.activeUser,
      json.encode(user.toJson()),
    );
  }
}
