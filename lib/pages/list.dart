// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, non_constant_identifier_names

import 'package:exercices_isc_2024/models/db_connexion.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/model_etudiant.dart';

class list_etud extends StatefulWidget {
  @override
  _TableContentPageState createState() => _TableContentPageState();
}

class _TableContentPageState extends State<list_etud> {
  @override
  void initState() {
    // Le nom depend du concepteur
    super.initState();

    db_connexion.initializeDB().whenComplete(() async {
      setState(() {
        _refreshEtudiants();
      });
    });
  }

  // All items
  late List<Etudiant> _List_Etudiants = []; // la variable liste des étudiants
  Future _refreshEtudiants() async {
    _List_Etudiants = await Etudiant.selection_tous_Etudiants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contenu de la table'),
      ),
      body: ListView.builder(
        itemCount: _List_Etudiants.length,
        itemBuilder: (context, index) {
          final item = _List_Etudiants[index];
          return ListTile(
            title: Text(item.noms),
            subtitle:
                Text('MATRICULE: ${item.matricule}, GENRE: ${item.genre}'),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    // _database?.close();
    super.dispose();
  }
}
