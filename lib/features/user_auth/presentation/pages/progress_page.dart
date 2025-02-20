import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'progress_provider.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  void _addGoal(BuildContext context) {
    TextEditingController goalController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enter your goal'),
        content: TextField(
          controller: goalController,
          decoration: InputDecoration(
            hintText: 'E.g., Lose 5 kg',
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              if (goalController.text.isNotEmpty) {
                Provider.of<ProgressProvider>(context, listen: false)
                    .addGoal(goalController.text);
              }
              Navigator.pop(context);
            },
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  void _addSubgoal(BuildContext context, int goalIndex) {
    TextEditingController subgoalController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enter a subgoal'),
        content: TextField(
          controller: subgoalController,
          decoration: InputDecoration(
            hintText: 'E.g., Do 10 push-ups daily',
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              if (subgoalController.text.isNotEmpty) {
                Provider.of<ProgressProvider>(context, listen: false)
                    .addSubgoal(goalIndex, subgoalController.text);
              }
              Navigator.pop(context);
            },
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final progressProvider = Provider.of<ProgressProvider>(context);
    final goals = progressProvider.goals;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GOALS',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF42525),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => _addGoal(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF42525),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  SizedBox(width: 3),
                  Text(
                    'Start a Goal',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: goals.isEmpty
                  ? const Center(
                      child: Text('No goals yet. Start by adding one!'),
                    )
                  : ListView.builder(
                      itemCount: goals.length,
                      itemBuilder: (context, goalIndex) {
                        final goal = goals[goalIndex];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: goal['expanded']
                                      ? const Color(0xFFF42525)
                                      : Colors.white,
                                ),
                                child: ListTile(
                                  title: Text(
                                    goal['goal'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: goal['expanded']
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  subtitle: goal['completed']
                                      ? Text(
                                          'Completed',
                                          style: TextStyle(
                                            color: goal['expanded']
                                                ? Colors.white
                                                : Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : null,
                                  trailing: Icon(
                                    goal['expanded']
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: goal['expanded']
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  onTap: () {
                                    progressProvider
                                        .toggleGoalExpansion(goalIndex);
                                  },
                                ),
                              ),
                              if (goal['expanded'])
                                Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: goal['subgoals'].length,
                                        itemBuilder: (context, subgoalIndex) {
                                          final subgoal =
                                              goal['subgoals'][subgoalIndex];
                                          return ListTile(
                                            leading: Checkbox(
                                              value: subgoal['done'] ?? false,
                                              onChanged: (value) =>
                                                  progressProvider
                                                      .toggleSubgoalDone(
                                                          goalIndex,
                                                          subgoalIndex),
                                              activeColor:
                                                  const Color(0xFFF42525),
                                            ),
                                            title: Text(subgoal['subgoal']),
                                          );
                                        },
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            _addSubgoal(context, goalIndex),
                                        child: const Text(
                                          'Add Subgoal',
                                          style: TextStyle(
                                              color: Color(0xFFF42525)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
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
