// ignore_for_file: non_constant_identifier_names, unnecessary_this

import 'package:exercices_isc_2024/models/db_connexion.dart';
import 'package:sqflite/sqflite.dart';

class Etudiant {
  late String matricule;
  late String noms;
  late String genre;
  late DateTime dateNaissance;
  late String promotion;
  late bool compteBancaire;

//Contructeur de la classe
  Etudiant(
      {required this.matricule,
      required this.noms,
      required this.genre,
      required this.dateNaissance,
      required this.promotion,
      required this.compteBancaire});

//Méthode qui aide à convertir un objet Etudiant à un MAP
  Map<String, dynamic> toMap() {
    return {
      'matricule': matricule,
      'noms': noms,
      'genre': genre,
      'dateNaissance': dateNaissance.toIso8601String(),
      'promotion': promotion,
      'compteBancaire': compteBancaire ? 1 : 0,
    };
  }

//Convertion d'un Map à un objet étudiant
  Etudiant.fromMap(Map<String, dynamic> map) {
    matricule = map['matricule'];
    noms = map['noms'];
    genre = map['genre'];
    dateNaissance = DateTime.parse(map['dateNaissance']);
    promotion = map['promotion'];
    compteBancaire = map['compteBancaire'] == 1;
  }

//Methode d'insertion dans la base de donnée
  Future<int> insertEtudiant() async {
    final Database db =
        await db_connexion.initializeDB(); //Recuperation de la base de donnée
    final id = await db.insert(
      'etudiant',
      this.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

//Méthode pour pouvoir modifier un étudiant
  Future<void> modifierEtudiant() async {
    final Database db = await db_connexion.initializeDB();
    await db.update(
      'etudiant',
      this.toMap(),
      where: "matricule = ?",
      //where: "matricule = ?, noms=?",
      whereArgs: [this.matricule],
      //whereArgs: [this.matricule, this.noms],
    );
  }

//Supprimer un enregistrement étudiant
  Future<void> supprimerEtudiant() async {
    final Database db = await db_connexion.initializeDB();
    await db.delete(
      'etudiant',
      where: "matricule = ?",
      whereArgs: [this.matricule],
    );
  }

  static Future<List<Etudiant>> selection_tous_Etudiants() async {
    final Database db = await db_connexion.initializeDB();
    final List<Map<String, dynamic>> maps = await db.query('etudiant');

    return List.generate(maps.length, (i) {
      return Etudiant.fromMap(maps[i]);
    });
  }

  //Selection d'un enreigistrement
  static Future<List<Etudiant>> selectionner_un_etudiant(
      String Matricule_Rech) async {
    final Database db = await db_connexion.initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query("etudiant",
        where: "matricule = ?,",
        orderBy: 'matricule',
        whereArgs: [Matricule_Rech]); //,
    return queryResult.map((e) => Etudiant.fromMap(e)).toList();
  }
}
