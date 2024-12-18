import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CustomCalendarController extends GetxController {
  final calendarController = CalendarController(); // Syncfusion CalendarController
  final selectedDate = DateTime.now().obs;
  final CalendarView currentView = CalendarView.week;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadAppointments();
  }

  void loadAppointments() {
    try {
      isLoading.value = true;
      // Ici, charger les rendez-vous depuis une API ou base de données
      Future.delayed(const Duration(seconds: 2), () {
        // Simule un chargement
        isLoading.value = false;
      });
    } catch (e) {
      Get.snackbar('Erreur', 'Impossible de charger les rendez-vous');
    } finally {
      isLoading.value = false;
    }
  }

  void onViewChanged(ViewChangedDetails details) {
    // Gérer le changement de vue ( mise à jour des rendez-vous)
    update();
  }

  void onTapDay(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.calendarCell) {
      selectedDate.value = details.date!;
      print('Date sélectionnée : ${selectedDate.value}');
      update();
    }
  }

  @override
  void onClose() {
    calendarController.dispose(); // Nettoyage de l'instance Syncfusion
    super.onClose();
  }
}
