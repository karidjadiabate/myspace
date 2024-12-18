import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myworkspace/presentaion/controllers/calendar_controller.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:myworkspace/core/theme/colors/app_colors.dart';

class CalendarScreen extends GetView<CustomCalendarController> {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendrier'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  _buildCalendarHeader(),
                  Expanded(
                    child: SfCalendar(
                      view: CalendarView.week,
                      controller: controller.calendarController, // Correct
                      firstDayOfWeek: 1,
                      showNavigationArrow: true,
                      showDatePickerButton: true,
                      allowViewNavigation: true,
                      showWeekNumber: true, // Afficher les numéros de semaine
                      timeSlotViewSettings: const TimeSlotViewSettings(
                        startHour: 8,
                        endHour: 20,
                        timeInterval: Duration(minutes: 30),
                        timeFormat: 'HH:mm',
                        timeTextStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      headerStyle: const CalendarHeaderStyle(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkGray,
                        ),
                      ),
                      viewHeaderStyle: const ViewHeaderStyle(
                        dayTextStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        dateTextStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      dataSource: _getCalendarDataSource(),
                      onTap: controller.onTapDay,
                      onViewChanged: controller.onViewChanged,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildCalendarHeader() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Calendrier',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.darkGray,
            ),
          ),
          Row(
            children: [
              _buildViewButton('Jour', CalendarView.day),
              const SizedBox(width: 8),
              _buildViewButton('Semaine', CalendarView.week),
              const SizedBox(width: 8),
              _buildViewButton('Mois', CalendarView.month),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildViewButton(String title, CalendarView view) {
    bool isSelected = controller.calendarController.view == view;
    return InkWell(
      onTap: () => controller.calendarController.view = view,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.darkTeal : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.darkTeal : AppColors.gray,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.gray,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  CalendarDataSource _getCalendarDataSource() {
    List<Appointment> appointments = [
      Appointment(
        startTime: DateTime.now().add(const Duration(hours: 1)),
        endTime: DateTime.now().add(const Duration(hours: 2)),
        subject: 'General Meeting',
        color: AppColors.darkTeal,
      ),
      Appointment(
        startTime: DateTime.now().add(const Duration(hours: 3)),
        endTime: DateTime.now().add(const Duration(hours: 4)),
        subject: 'Scrum',
        color: AppColors.red,
      ),
      Appointment(
        startTime: DateTime.now().add(const Duration(hours: 5)),
        endTime: DateTime.now().add(const Duration(hours: 6)),
        subject: 'Development Meeting',
        color: AppColors.charcoal,
      ),
    ];

    return MeetingDataSource(appointments);
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
