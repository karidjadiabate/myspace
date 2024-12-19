// lib/views/home/home_view.dart
import 'package:flutter/material.dart';
import 'package:myworkspace/presentaion/views/home/layout/main_layout.dart';
import 'package:myworkspace/presentaion/views/home/sidebar/menu_items/calendar/calendar_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedMenu = "Home"; // Par défaut, afficher l'écran principal

  @override
  Widget build(BuildContext context) {
    Widget getBodyContent() {
      switch (selectedMenu) {
        case "ProSync":
          return const CalendarScreen(); // Appel de l'écran pour "ProSync"
        default:
          return const Center(child: Text('Contenu par défaut')); // Contenu par défaut
      }
    }

    return MainLayout(
      body: getBodyContent(),
      currentIndex: 0,
      onTabSelected: (index) {
        // Gérer la navigation via le footer si nécessaire
      },
      onCentrePressed: () {
        // Gérer l'action centrale
      },
      onDevisPressed: () {
        // Gérer l'action devis
      },
      onMenuItemSelected: (String menuTitle) {
        setState(() {
          selectedMenu = menuTitle; // Met à jour le menu sélectionné
        });
      },
    );
  }
}
