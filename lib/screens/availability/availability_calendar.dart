import 'package:flutter/material.dart';
import 'package:front_end_padelapp/models/availability_model.dart';
import 'package:front_end_padelapp/models/hours_model.dart';
import 'package:front_end_padelapp/models/trainer_availability.dart';
import 'package:front_end_padelapp/services/availability_service.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

class AvailabilityCalendar extends StatefulWidget {
  const AvailabilityCalendar({super.key});

  @override
  _AvailabilityCalendarState createState() => _AvailabilityCalendarState();
}

class _AvailabilityCalendarState extends State<AvailabilityCalendar> {
  DateTime _selectedDate = DateTime.now();
  AvailabilityService availabilityService = AvailabilityService();
  List<HoursModel> availableHours = [];

  Future<void> updateSelectedDate(DateTime date) async {
    setState(() {
      _selectedDate = date;
    });

    TrainerAvailability availability = await availabilityService.getTrainerAvailability(1);

    // Find the availability for the selected date
    var selectedAvailability = availability.availabilities?.firstWhere((a) => a.day != null && DateTime.parse(a.day!) == _selectedDate, orElse: () => AvailabilityModel(day: '', hours: []));

    if (selectedAvailability != null) {
      setState(() {
        availableHours = selectedAvailability.hours!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Availability Calendar'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        color: AppColors.primary,
        child: Column(
          children: [
            Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(
                  primary: Colors.white,
                  onPrimary: AppColors.primary,
                  surface: Colors.white,
                  onSurface: AppColors.primaryWhite,
                ),
                dialogBackgroundColor: Colors.white,
              ),
              child: CalendarDatePicker(
                initialDate: _selectedDate,
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
                onDateChanged: updateSelectedDate,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: availableHours.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(availableHours[index].hour!),
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