// lib/views/sidebar/menu_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:myworkspace/core/routes/app_pages.dart';
import 'package:myworkspace/core/theme/colors/app_colors.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String? selectedParent;
  String? selectedItem;

  List<Map<String, dynamic>> menuItems = [
    {
      'title': 'Task Pilot',
      'icon': 'assets/images/sbar/actions.svg',
      'subItems': [],
    },
    {
      'title': 'ProSync',
      'icon': 'assets/images/sbar/prosync.svg',
      'subItems': [],
    },
    {
      'title': 'My CRM',
      'icon': 'assets/images/sbar/crm.svg',
      'subItems': [],
    },
    {
      'title': 'ProcuLink',
      'icon': 'assets/images/sbar/procu.svg',
      'isExpanded': true,
      'subItems': [
        {
          'title': 'My GR-SE',
          'isDashed': false,
        },
        {
          'title': 'My CAR',
          'isDashed': false,
        },
        {
          'title': 'Bidwise',
          'isDashed': false,
        },
      ],
    },
    {
      'title': 'My Budget',
      'icon': 'assets/images/sbar/crm.svg',
      'isExpanded': true,
      'subItems': [
        {
          'title': 'OPEX',
          'isDashed': false,
        },
        {
          'title': 'CAPEX',
          'isDashed': false,
        },
      ],
    },
    {
      'title': 'HRConnect',
      'icon': 'assets/images/sbar/hr.svg',
      'subItems': [],
    },
    {
      'title': 'FixItNow',
      'icon': 'assets/images/sbar/fixit.svg',
      'subItems': [],
    },
    {
      'title': 'IncidentLink',
      'icon': 'assets/images/sbar/incident.svg',
      'subItems': [],
    },
    {
      'title': 'JourneyQuest',
      'icon': 'assets/images/sbar/journey.svg',
      'subItems': [],
    },
    {
      'title': 'MeetingHub',
      'icon': 'assets/images/sbar/meeting.svg',
      'subItems': [],
    },
    {
      'title': 'Chart Of Account',
      'icon': 'assets/images/sbar/chart-account.svg',
      'subItems': [],
    },
    {
      'title': 'SOPConnect',
      'icon': 'assets/images/sbar/sop.svg',
      'subItems': [],
    },
    {
      'title': 'Work Permits',
      'icon': 'assets/images/sbar/work-permit.svg',
      'subItems': [],
    },
  ];

  Widget _buildVerticalDottedLine({
    required double height,
    required Color color,
    double spacing = 2.0,
    double dotSize = 2.0,
  }) {
    int numberOfDots = (height / (spacing + dotSize)).floor();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        numberOfDots,
        (index) => Column(
          children: [
            Container(
              width: dotSize,
              height: dotSize,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            if (index != numberOfDots - 1) SizedBox(height: spacing),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalDottedLine({
    required double width,
    required Color color,
    double spacing = 2.0,
    double dotSize = 2.0,
  }) {
    int numberOfDots = (width / (spacing + dotSize)).floor();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        numberOfDots,
        (index) => Row(
          children: [
            Container(
              width: dotSize,
              height: dotSize,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            if (index != numberOfDots - 1) SizedBox(width: spacing),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: AppColors.white,
      child: Drawer(
        backgroundColor: AppColors.white,
        child: Column(
          children: [
            Container(
              height: 120,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/logo/logoblanc.svg',
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'App Menu',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  final bool hasSubItems = item['subItems'] != null && 
                                        (item['subItems'] as List).isNotEmpty;
                  final bool isParentSelected = selectedParent == item['title'];
                  
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: isParentSelected ? AppColors.lightTeal : Colors.transparent,
                          border: Border(
                            left: BorderSide(
                              color: isParentSelected ? AppColors.darkTeal : Colors.transparent,
                              width: 6,
                            ),
                          ),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4
                          ),
                          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                          leading: SvgPicture.asset(
                            item['icon'] as String,
                            width: 28,
                            height: 28,
                          ),
                          title: Text(
                            item['title'] as String,
                            style: TextStyle(
                              fontSize: 16,
                              color: isParentSelected ? AppColors.darkTeal : Colors.black87,
                            ),
                          ),
                          trailing: hasSubItems
                              ? Icon(
                                  item['isExpanded'] == true ? Icons.expand_less : Icons.expand_more,
                                  color: const Color.fromARGB(255, 139, 136, 96),
                                )
                              : null,
                          onTap: () {
                            setState(() {
                              if (hasSubItems) {
                                menuItems[index] = {
                                  ...item,
                                  'isExpanded': !(item['isExpanded'] ?? false),
                                };
                              }
                              selectedParent = item['title'] as String;
                              if (!hasSubItems) {
                                selectedItem = item['title'] as String;
                              }
                              if (item['title'] == 'ProSync') {
                                if (!Get.currentRoute.startsWith(Routes.home)) {
                                  Get.offAllNamed(Routes.home);
                                }

                              }
                            });
                                                      
                          },
                        ),
                      ),
                      if (hasSubItems && (item['isExpanded'] == true))
                        ...(item['subItems'] as List).asMap().entries.map((entry) {
                          final int subIndex = entry.key;
                          final subItem = entry.value;
                          final bool isSelected = selectedItem == subItem['title'];
                          final bool isLastItem = subIndex == (item['subItems'] as List).length - 1;
                          final Color greyColor = Colors.grey.withOpacity(0.3);

                          // Trouver l'index de l'élément sélectionné
                          int selectedIndex = -1;
                          for (int i = 0; i < (item['subItems'] as List).length; i++) {
                            if (selectedItem == (item['subItems'] as List)[i]['title']) {
                              selectedIndex = i;
                              break;
                            }
                          }

                          return Container(
                            height: 40,
                            margin: const EdgeInsets.only(left: 16),
                            child: Stack(
                              children: [
                                if (!isLastItem)
                                  // Ligne verticale pointillée grise (s'arrête au dernier élément)
                                  Positioned(
                                    left: 20,
                                    top: 0,
                                    child: SizedBox(
                                      height: 40,
                                      child: _buildVerticalDottedLine(
                                        height: 40,
                                        color: greyColor,
                                      ),
                                    ),
                                  ),

                                if (selectedIndex >= 0 && subIndex <= selectedIndex)
                                  // Ligne verticale pointillée rouge
                                  Positioned(
                                    left: 20,
                                    top: 0,
                                    child: SizedBox(
                                      height: subIndex == selectedIndex ? 20 : 40,
                                      child: _buildVerticalDottedLine(
                                        height: subIndex == selectedIndex ? 20 : 40,
                                        color: AppColors.red,
                                      ),
                                    ),
                                  ),

                                // Contenu du sous-élément
                                Row(
                                  children: [
                                    // Ligne horizontale pointillée
                                    Container(
                                      width: 40,
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(left: 20),
                                      child: _buildHorizontalDottedLine(
                                        width: 20,
                                        color: isSelected ? AppColors.red : greyColor,
                                      ),
                                    ),
                                    // Texte du sous-élément
                                    Expanded(
                                      child: ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        dense: true,
                                        visualDensity: const VisualDensity(vertical: -4),
                                        title: Text(
                                          subItem['title'] as String,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: isSelected ? AppColors.red : Colors.black87,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            selectedItem = subItem['title'] as String;
                                            selectedParent = item['title'] as String;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}