// lib/core/interfaces/home_interface.dart
abstract class IHomeController {
  // Navigation et gestion des pages
  void changePage(int index);
  int getCurrentIndex();

  // Gestion du menu latéral
  void openDrawer();
  void closeDrawer();

  // Actions spécifiques de l'en-tête
  void toggleCompanySelector();
  void changeYear(String year);
  void changeCompany(String company);
  
  // Actions de la barre de navigation
  void onWorkspaceTab();
  void onMessageTab();
  void onEmailTab();
  void onAdministrationTab();
}