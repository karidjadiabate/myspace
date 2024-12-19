import 'package:flutter/material.dart';


class HeaderLayout extends StatefulWidget {
  final Function onCentrePressed;
  final Function onDevisPressed;

  const HeaderLayout({
    required this.onCentrePressed,
    required this.onDevisPressed,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _HeaderLayoutState createState() => _HeaderLayoutState();
}

class _HeaderLayoutState extends State<HeaderLayout> {
  String selectedCompany = '2251-Emergence plaza sa';
  String selectedYear = '2024';
  String tempSelectedCompany = '2251-Emergence plaza sa';
  String tempSelectedYear = '2024';
  
  final List<String> companies = [
    '2251-Emergence plaza sa',
    '2252-Cosmos angre',
    '2253-Hc capital properties',
    '2254-Groupe behira'
  ];
  
  final List<String> years = [
    '2024', '2023', '2022', '2021', '2020',
    '2019', '2018', '2017'
  ];

  void _showCompanyModal() {
    tempSelectedCompany = selectedCompany;
    tempSelectedYear = selectedYear;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(20),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Year Selector
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: PopupMenuButton<String>(
                          onSelected: (String value) {
                            setState(() {
                              tempSelectedYear = value;
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            return years.map((String year) {
                              return PopupMenuItem<String>(
                                value: year,
                                child: Text(year),
                              );
                            }).toList();
                          },
                          offset: const Offset(0, 40),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            color: const Color.fromARGB(255, 252, 251, 251),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(tempSelectedYear),
                                const Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Company Selector
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: PopupMenuButton<String>(
                          onSelected: (String value) {
                            setState(() {
                              tempSelectedCompany = value;
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            return companies.map((String company) {
                              return PopupMenuItem<String>(
                                value: company,
                                child: Text(company),
                              );
                            }).toList();
                          },
                          offset: const Offset(0, 40),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            color: Colors.grey[200],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(tempSelectedCompany),
                                const Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Action Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                          style: TextButton.styleFrom(
                            foregroundColor: const Color.fromARGB(255, 182, 20, 8)
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            this.setState(() {
                              selectedCompany = tempSelectedCompany;
                              selectedYear = tempSelectedYear;
                            });
                            Navigator.pop(context);
                          },
                          child: const Text('Save'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 15, 54, 16),
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.menu,size:30, color: Colors.black),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            const SizedBox(width: 20),
          ],
        ),
        Row(
          children: [
            TextButton(
              onPressed: _showCompanyModal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    selectedCompany.split('-')[0],
                    style: const TextStyle(color: Colors.black),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 0.0, top: 2.0),
                    child: Icon(Icons.arrow_drop_down, color: Colors.black),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            // Fcfa en texte fixe
            const Text(
              'Fcfa',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),

            const SizedBox(width: 30),

            const Icon(Icons.notifications, size:25 ,color: Color.fromARGB(255, 86, 85, 85)),

            const SizedBox(width: 35),

            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            color: Colors.transparent,
                          ),
                        ),
                        // ProfileScreen(top: 55),
                      ],
                    );
                  },
                  barrierColor: Colors.transparent,
                );
              },
              child: const CircleAvatar(
                radius: 17,
                backgroundImage: AssetImage('assets/images/autres/aa.png'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}