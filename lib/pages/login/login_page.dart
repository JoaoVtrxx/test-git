import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_1/shared/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/constants/custom_colors.dart';
import '../../shared/constants/preferences_key.dart';
import '../sign_up/sing_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();

  Color topColor = CustomColors().getGradientTopColor();
  Color bottomColor = CustomColors().getGradientBottomColor();
  bool continueConnected = false;

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
              Padding(
                padding: EdgeInsets.only(
                  bottom: 15,
                ),
                child: Image.asset(
                  "assets/imgs/fundo.png",
                  height: 125,
                ),
              ),
              Text(
                "Entrar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: mailInputController,
                      style: TextStyle(color: Colors.white),
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: "E-mail",
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
                      controller: passwordInputController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.vpn_key_sharp,
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
              Padding(padding: EdgeInsets.only(bottom: 10)),
              GestureDetector(
                onTap: (() {
                  print("funcionou");
                }),
                child: Text(
                  "Equeceu a senha",
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                children: [
                  Checkbox(
                    value: continueConnected,
                    onChanged: (value) {
                      setState(() {
                        continueConnected = value!;
                        print(continueConnected);
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                  Text(
                    "Continuar Conectado?",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              ElevatedButton(
                onPressed: () {
                  _doLogin();
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors().getActivePrimaryButtomColor(),
                  fixedSize: Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Text(
                "Ainda não tem conta?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SingUpPage()));
                  },
                  child: Text(
                    "Cadastre-se",
                    style: TextStyle(
                        color: CustomColors().getActivePrimaryButtomColor()),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        CustomColors().getActiveSecondaryButtonColor(),
                    fixedSize: Size(double.infinity, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _doLogin() async {
    String mailForm = this.mailInputController.text;
    String passForm = this.passwordInputController.text;

    LoginModel savedUser = await _getSavedUser();
    if (mailForm == savedUser.mail && passForm == savedUser.password) {
      print('Logado com sucesso');
    } else {
      print("deu erro");
    }
  }

  Future<LoginModel> _getSavedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonUser = prefs.getString(PreferencesKeys.activeUser);
    print(jsonUser);

    Map<String, dynamic> mapUser = json.decode(jsonUser!);
    LoginModel user = LoginModel.fromJson(mapUser);
    return user;
  }
}
