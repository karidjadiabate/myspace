import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:myworkspace/core/theme/colors/app_colors.dart';

class FooterLayout extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const FooterLayout({
    required this.currentIndex,
    required this.onTabSelected,
    super.key,
  });

  @override
  State createState() => _FooterLayoutState();
}

class _FooterLayoutState extends State<FooterLayout> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex.clamp(0, 3); 
  }

  void _handleTabPress(int index) {
    setState(() {
      currentIndex = index; // Met à jour l'index courant
    });
    widget.onTabSelected(index);
    if (index == 3) {
      // Affiche un message dans la console
      print('Administration tab selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      initialActiveIndex: currentIndex,
      backgroundColor: AppColors.red, 
      activeColor: AppColors.white, 
      color: AppColors.white, 
      style: TabStyle.reactCircle,
      height: 60, // Hauteur de la barre ajustée
      items: [
        _buildTabItem('assets/images/sbar/workspace.svg', 'Workspace', 0),
     
        _buildTabItem(Icons.message, 'Message', 1),
        _buildTabItem(Icons.email, 'E-mail', 2),
        _buildTabItem(Icons.settings, 'Administration', 3),
      ],
      onTap: _handleTabPress, // Gère la sélection des onglets
    );
  }
TabItem<dynamic> _buildTabItem(dynamic icon, String label, int index) {
  const double iconSize = 25; 
  const double activeIconSize = 40; 
  final isActive = index == currentIndex;

if (icon is String) {
  return TabItem<dynamic>(
    icon: Transform.scale(
      scale: isActive ? 0.6 : 1.0, 
      child: SvgPicture.asset(
        icon,
        width: iconSize,
        height: iconSize,
        colorFilter: ColorFilter.mode(
          isActive ? AppColors.gray : AppColors.white,
          BlendMode.srcIn,
        ),
      ),
    ),
    title: label,
  );

  } else {
    // Si l'icône est un widget Icon
    return TabItem(
      icon: Icon(
        icon,
        size: isActive ? activeIconSize : iconSize, 
        color: isActive ? AppColors.gray : AppColors.white, 
      ),
      title: label, 
    );
  }
}

    }
