// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:exercices_isc_2024/pages/accueil.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  //Creation des controleurs qui seront réliés aux Zone de saisie
  TextEditingController crt_username = TextEditingController();
  TextEditingController crt_password = TextEditingController();

  //Création d'une méthode qui va chaque fois vérifier les logins

  void verification_login() {
    if (crt_username.text == 'ISC' && crt_password.text == 'ISC') {
      print('LOGIN CORRECT');
      Navigator.pushNamed(context, '/accueil');
    } else {
      print('LOGIN INCORECT, REESSAYEZ');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User Name ou mot de passe incorrect'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'ISC L3 2024',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    border: Border.all(
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            Icon(
                              Icons.login_rounded,
                              color: Colors.pink,
                              size: 30.0,
                              semanticLabel: 'LOGIN',
                            ),
                          ],
                        ),
                        TextField(
                          controller: crt_username,
                          decoration: InputDecoration(
                            labelText: 'User Name',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          obscureText: true,
                          controller: crt_password,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.key_off),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: verification_login,
                                    child: Text("Connexion")))
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
