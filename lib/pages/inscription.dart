// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, avoid_print

import 'package:flutter/material.dart';

import '../models/model_etudiant.dart';

class inscription extends StatefulWidget {
  const inscription({super.key});

  @override
  State<inscription> createState() => _inscriptionState();
}

class _inscriptionState extends State<inscription> {
  
  //Creattion des variables
  bool inscrit = false;
  final TextEditingController matriculeController = TextEditingController();
  final TextEditingController nomsController = TextEditingController();
  String Valueurgenre = 'M';
  DateTime dateNais = DateTime.now();
  String Promotion_select = "L1 I.G";
  bool AcompteBancaire = false;

  //Methode pour insertion

  void _ajouter_etudiant() {

//Créer un objet étudiant
    Etudiant newEtudiant = Etudiant(
        matricule: matriculeController.text,
        noms: nomsController.text,
        genre: Valueurgenre,
        dateNaissance: dateNais,
        promotion: Promotion_select,
        compteBancaire: AcompteBancaire);
//Appeller la méthode insertEtudiant qui se trouver dans le model étudiant
    newEtudiant.insertEtudiant().then((value) {
      if (value != null && value != -1) {
        // Gérer l'erreur ici
        print('Insertion réussi avec succès');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Insertion reussi avec succès'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        // L'insertion a réussi
        print('Insertion echoué');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Insertion échoué avec code: $value'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
  }

  void _supprimer_etudiant() {

    Etudiant notreEtudiant = Etudiant(
        matricule: matriculeController.text,
        noms: nomsController.text,
        genre: Valueurgenre,
        dateNaissance: dateNais,
        promotion: Promotion_select,
        compteBancaire: AcompteBancaire);

    notreEtudiant.supprimerEtudiant().then((value) {
      // Gérer l'erreur ici
      print('Suppression réussi avec succès');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Suppression reussi avec succès'),
          backgroundColor: Colors.green,
        ),
      );
    });
  }

  void _modifier_etudiant() {
    Etudiant notreEtudiant = Etudiant(
        matricule: matriculeController.text,
        noms: nomsController.text,
        genre: Valueurgenre,
        dateNaissance: dateNais,
        promotion: Promotion_select,
        compteBancaire: AcompteBancaire);

    notreEtudiant.modifierEtudiant().then((value) {
      // Gérer l'erreur ici
      print('Modification réussi avec succès');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Modification reussi avec succès'),
          backgroundColor: Colors.green,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child: Text("INSCRIPTION")),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: matriculeController,
                decoration: InputDecoration(
                  labelText: 'Matricule',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.numbers_outlined),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: nomsController,
                decoration: InputDecoration(
                  labelText: 'Noms',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text('Genre: '),
                  ),
                  Radio(
                    value: 'M',
                    groupValue: Valueurgenre,
                    onChanged: (value) {
                      setState(() {
                        Valueurgenre = value!;
                      });
                    },
                  ),
                  Text('Masculin'),
                  Radio(
                    value: 'F',
                    groupValue: Valueurgenre,
                    onChanged: (value) {
                      setState(() {
                        Valueurgenre = value!;
                      });
                    },
                  ),
                  Text('Feminin'),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: dateNais,
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        ).then((date) {
                          if (date != null) {
                            setState(() {
                              dateNais = date;
                            });
                          }
                        });
                      },
                      child: Text('Selectionner une date'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("Promotion: "),
                  Expanded(
                    child: DropdownButton<String>(
                      value: Promotion_select,
                      onChanged: (value) {
                        setState(() {
                          Promotion_select = value!;
                        });
                      },
                      items: <DropdownMenuItem<String>>[
                        DropdownMenuItem(
                          value: 'L1 I.G',
                          child: Text('L1 I.G'),
                        ),
                        DropdownMenuItem(
                          value: 'L2 I.G',
                          child: Text('L3 I.G'),
                        ),
                        DropdownMenuItem(
                          value: 'L3 I.G',
                          child: Text('L3 I.G'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Text('Vous avez un compte à TID ?'),
                  Checkbox(
                    value: AcompteBancaire,
                    onChanged: (value) {
                      setState(() {
                        AcompteBancaire = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _ajouter_etudiant();
                      },
                      child: Text('Enregistrer'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _modifier_etudiant();
                      },
                      child: Text('Modifier'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _supprimer_etudiant();
                      },
                      child: Text('Supprimer'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/liste_etudiant');
                      },
                      child: Text('Voir la liste des inscrits'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
