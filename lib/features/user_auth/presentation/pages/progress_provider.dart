import 'package:flutter/foundation.dart';

class ProgressProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _goals = [];

  List<Map<String, dynamic>> get goals => _goals;

  void addGoal(String goalText) {
    _goals.add({
      'goal': goalText,
      'subgoals': [],
      'expanded': false,
      'completed': false,
    });
    notifyListeners();
  }

  void addSubgoal(int goalIndex, String subgoalText) {
    if (goalIndex >= 0 && goalIndex < _goals.length) {
      _goals[goalIndex]['subgoals'].add({
        'subgoal': subgoalText,
        'done': false,
      });
      notifyListeners();
    }
  }

  void toggleSubgoalDone(int goalIndex, int subgoalIndex) {
    if (goalIndex >= 0 && goalIndex < _goals.length) {
      var subgoal = _goals[goalIndex]['subgoals'][subgoalIndex];
      subgoal['done'] = !(subgoal['done'] ?? false);
      bool allDone =
          _goals[goalIndex]['subgoals'].every((s) => s['done'] == true);
      _goals[goalIndex]['completed'] = allDone;
      notifyListeners();
    }
  }

  void toggleGoalExpansion(int goalIndex) {
    if (goalIndex >= 0 && goalIndex < _goals.length) {
      _goals[goalIndex]['expanded'] = !_goals[goalIndex]['expanded'];
      notifyListeners();
    }
  }
}
