//lib/views/layout/main_layout.dart
import 'package:flutter/material.dart';
import 'package:myworkspace/core/theme/colors/app_colors.dart';
import 'package:myworkspace/presentaion/views/home/layout/components/footer.dart';
import 'package:myworkspace/presentaion/views/home/layout/components/header.dart';
import 'package:myworkspace/presentaion/views/home/sidebar/menu_screen.dart';

class MainLayout extends StatelessWidget {
  final Widget body;
  final int currentIndex;
  final Function(int) onTabSelected;
  final Function onCentrePressed;
  final Function onDevisPressed;
  final GlobalKey<ScaffoldState> _scaffoldKey;

  MainLayout({
    required this.body,
    required this.currentIndex,
    required this.onTabSelected,
    required this.onCentrePressed,
    required this.onDevisPressed,
    Key? key,
  }) : _scaffoldKey = GlobalKey<ScaffoldState>(),
       super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        elevation: 3, // Ajout d'une légère élévation
        shadowColor: Colors.black.withOpacity(0.3),
        title: HeaderLayout(
          onCentrePressed: onCentrePressed,
          onDevisPressed: onDevisPressed,
        ),
      ),
      drawer: MenuScreen(),  
      body: body,
      bottomNavigationBar: FooterLayout(
        currentIndex: currentIndex,
        onTabSelected: onTabSelected,
      ),
    );
  }
}