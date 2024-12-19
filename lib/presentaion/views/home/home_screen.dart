import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myworkspace/presentaion/views/home/layout/main_layout.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool showProSync = false;

  @override
  void initState() {
    super.initState();
    final args = Get.arguments;
    if (args != null && args is Map<String, dynamic>) {
      setState(() {
        showProSync = args['showProSync'] ?? false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentIndex: 0,
      onTabSelected: (index) {
        // Gérer la navigation du footer
      },
      onCentrePressed: () {
        setState(() {
          showProSync = !showProSync;
        });
      },
      onDevisPressed: () {
        // Action devis
      },
      body: Container(
        padding: const EdgeInsets.all(1.0),
        // child:  CalendarView(),  
      ),
    );
  }
}