import 'package:flutter/material.dart';

class CalendarProvider with ChangeNotifier {
  final Map<DateTime, List<Map<String, String>>> _appointments = {};
  final Map<DateTime, List<Map<String, String>>> _completedWorkouts = {};

  Map<DateTime, List<Map<String, String>>> get appointments => _appointments;
  Map<DateTime, List<Map<String, String>>> get completedWorkouts =>
      _completedWorkouts;

  void addAppointment(DateTime date, Map<String, String> appointment) {
    if (_appointments[date] == null) {
      _appointments[date] = [];
    }
    _appointments[date]!.add(appointment);
    notifyListeners();
  }

  void removeAppointment(DateTime date, Map<String, String> appointment) {
    _appointments[date]?.remove(appointment);
    if (_appointments[date]?.isEmpty ?? true) {
      _appointments.remove(date);
    }
    notifyListeners();
  }

  void editAppointmentTime(
      DateTime date, Map<String, String> appointment, String newTime) {
    int index = _appointments[date]?.indexOf(appointment) ?? -1;
    if (index != -1) {
      _appointments[date]![index]['time'] = newTime;
      notifyListeners();
    }
  }

  void completeAppointment(DateTime date, Map<String, String> appointment) {
    if (_appointments[date]?.contains(appointment) ?? false) {
      _appointments[date]?.remove(appointment);
      if (_appointments[date]?.isEmpty ?? true) {
        _appointments.remove(date);
      }
      if (_completedWorkouts[date] == null) {
        _completedWorkouts[date] = [];
      }
      _completedWorkouts[date]!.add(appointment);
      notifyListeners();
    }
  }
}
