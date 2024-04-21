// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Bienvenue!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  DashboardCard(
                    title: 'Enregistrer ',
                    icon: Icons.person_add,
                    color: Colors.green,
                    onTap: () {
                      Navigator.pushNamed(context, '/inscription');
                    },
                  ),
                  DashboardCard(
                    title: 'Lister',
                    icon: Icons.list,
                    color: Colors.blue,
                    onTap: () {
                      Navigator.pushNamed(context, '/liste_etudiant');
                    },
                  ),
                  DashboardCard(
                    title: 'Enregistrer en ligne',
                    icon: Icons.add_reaction_outlined,
                    color: Colors.orange,
                    onTap: () {
                      // Action pour afficher les statistiques
                    },
                  ),
                  DashboardCard(
                    title: 'Liste en ligne',
                    icon: Icons.list_alt_rounded,
                    color: Colors.lime,
                    onTap: () {
                      // Action pour afficher les statistiques
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const DashboardCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: Colors.white),
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
