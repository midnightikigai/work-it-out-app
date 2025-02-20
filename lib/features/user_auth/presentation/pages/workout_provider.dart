import 'package:flutter/material.dart';

class WorkoutProvider with ChangeNotifier {
  List<Map<String, dynamic>> _workouts = [];

  List<Map<String, dynamic>> get workouts => _workouts;

  void setWorkouts(List<Map<String, dynamic>> workouts) {
    _workouts = workouts;
    notifyListeners();
  }

  void addWorkout(Map<String, dynamic> workout) {
    _workouts.add(workout);
    notifyListeners();
  }
}
