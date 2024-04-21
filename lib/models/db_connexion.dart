import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'model_etudiant.dart';

class db_connexion {

  static Future<Database> initializeDB() async {
    Database? _database;
    String path = await getDatabasesPath();
    // Check if the database exists
    print("====> Chemin BDD: $path");

    return openDatabase(
      join(path, 'db_exer_prog_mob.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE etudiant( matricule TEXT PRIMARY KEY, noms TEXT, genre TEXT, dateNaissance TEXT, promotion TEXT, compteBancaire INTEGER)",
        );

        // Création d’une deuxième table, Etc…………
        await database.execute(
          "CREATE TABLE enseignants(Matricule TEXT PRIMARY KEY, Faculte TEXT NOT NULL)",
        );
        
        // Création d’une troisième table, Etc…………
      },
      version: 1,
    );
  }
}
