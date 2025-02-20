import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'calendar_provider.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  final List<String> _workoutList = [
    'Push-ups',
    'Squats',
    'Burpees',
    'Plank',
    'Lunges',
    'Jumping Jacks',
    'Bicycle Crunches',
    'Kettlebell Swings',
    'Wall Sit',
    'Pull-ups',
    'Flutter Kicks',
    'Jump Rope',
    'High Plank to Low Plank',
    'Supermans',
    'Dumbbell Deadlifts',
    'Battle Rope Waves',
    'Dumbbell Incline Press',
    'Bench Press',
    'Leg Press',
    'Leg Extensions',
    'Leg Curls (Seated or Lying)',
    'Russian Twists',
    'Tricep Dips',
    'Reverse Crunches',
    'Diamond Push-up',
    'Hollow Body Crunch',
  ];

  @override
  void initState() {
    super.initState();
  }

  void _addAppointment(String workout) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      String formattedTime = _formatTime(selectedTime);
      final calendarProvider =
          Provider.of<CalendarProvider>(context, listen: false);
      calendarProvider.addAppointment(_selectedDay, {
        'workout': workout,
        'time': formattedTime,
      });
      Navigator.of(context).pop();
    }
  }

  void _removeWorkout(Map<String, String> workout) {
    final calendarProvider =
        Provider.of<CalendarProvider>(context, listen: false);
    calendarProvider.removeAppointment(_selectedDay, workout);
  }

  void _editWorkoutTime(Map<String, String> workout) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(workout['time']!.split(":")[0]),
        minute: int.parse(workout['time']!.split(":")[1].split(" ")[0]),
      ),
    );

    if (selectedTime != null) {
      String formattedTime = _formatTime(selectedTime);
      final calendarProvider =
          Provider.of<CalendarProvider>(context, listen: false);
      calendarProvider.editAppointmentTime(
          _selectedDay, workout, formattedTime);
    }
  }

  void _completeWorkout(Map<String, String> appointment) {
    final calendarProvider =
        Provider.of<CalendarProvider>(context, listen: false);
    calendarProvider.completeAppointment(_selectedDay, appointment);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Workout marked as complete!')),
    );
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute;
    final amPm = time.period == DayPeriod.am ? 'AM' : 'PM';
    return "$hour:${minute < 10 ? '0$minute' : minute} $amPm";
  }

  @override
  Widget build(BuildContext context) {
    final calendarProvider = Provider.of<CalendarProvider>(context);
    final appointmentsForSelectedDay =
        calendarProvider.appointments[_selectedDay] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SCHEDULE',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF42525),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      child: TableCalendar(
                        firstDay: DateTime.utc(2020, 1, 1),
                        lastDay: DateTime.utc(2025, 12, 31),
                        focusedDay: _focusedDay,
                        selectedDayPredicate: (day) =>
                            isSameDay(_selectedDay, day),
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                          });
                        },
                        calendarStyle: CalendarStyle(
                          todayDecoration: BoxDecoration(
                            color: const Color(0xFFF42525),
                            shape: BoxShape.circle,
                          ),
                          selectedDecoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xFFF42525), width: 2),
                            shape: BoxShape.circle,
                          ),
                          selectedTextStyle:
                              const TextStyle(color: Color(0xFFF42525)),
                        ),
                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false,
                          titleTextStyle: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF42525),
                          ),
                          leftChevronIcon: Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xFFF42525),
                          ),
                          rightChevronIcon: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFF42525),
                          ),
                          headerPadding: EdgeInsets.symmetric(horizontal: 16.0),
                          leftChevronVisible: true,
                          rightChevronVisible: true,
                          titleCentered: true,
                        ),
                        calendarBuilders: CalendarBuilders(
                          defaultBuilder: (context, day, focusedDay) {
                            bool hasAppointment = (calendarProvider
                                    .appointments[day]?.isNotEmpty) ??
                                false;
                            return Container(
                              alignment: Alignment.center,
                              child: Text(
                                '${day.day}',
                                style: TextStyle(
                                  color: hasAppointment
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                  'Choose Workout',
                                  style: TextStyle(color: Colors.red),
                                ),
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: _workoutList.map((workout) {
                                      return ListTile(
                                        leading: const Icon(
                                          Icons.fitness_center,
                                          color: Colors.red,
                                        ),
                                        title: Text(workout),
                                        onTap: () => _addAppointment(workout),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF42525),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text(
                          'Schedule a workout',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Scheduled Workouts:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    appointmentsForSelectedDay.isEmpty
                        ? const Text(
                            'No workouts scheduled for this day.',
                            style: TextStyle(color: Color(0xFFF42525)),
                          )
                        : Column(
                            children:
                                appointmentsForSelectedDay.map((appointment) {
                              return Card(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: ListTile(
                                  leading: const Icon(
                                    Icons.fitness_center,
                                    color: Color(0xFFF42525),
                                  ),
                                  title: Text(
                                    "${appointment['workout']} - ${appointment['time']}",
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.access_time,
                                            color: Color(0xFFF42525)),
                                        onPressed: () =>
                                            _editWorkoutTime(appointment),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete,
                                            color: Color(0xFFF42525)),
                                        onPressed: () =>
                                            _removeWorkout(appointment),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.check,
                                            color: Color(0xFFF42525)),
                                        onPressed: () =>
                                            _completeWorkout(appointment),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
