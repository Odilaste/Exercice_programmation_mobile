// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'pages/accueil.dart';
import 'pages/list.dart';
import 'pages/login.dart';
import 'package:exercices_isc_2024/models/db_connexion.dart';
import 'package:exercices_isc_2024/pages/home.dart';
import 'package:exercices_isc_2024/pages/inscription.dart';

void main() {
  runApp(MyWidget());
}

// Creer une classe Stateless qui va porter la configuration initiale des pages

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {

     db_connexion.initializeDB(); //Instruction qui va nous creer la BDD dans le telephone

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => login(),
        '/accueil': (context) => DashboardPage(),
        '/inscription': (context) => inscription(),
        '/liste_etudiant': (context) => list_etud()
      },
    );
  }
}
