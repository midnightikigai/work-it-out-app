import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_pages.dart';
import 'schedule_page.dart';
import 'progress_page.dart';
import 'workout_page.dart';
import 'profile_screen.dart';

class HomePage extends StatefulWidget {
  final String email;

  const HomePage({super.key, required this.email});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePageContent(),
    const SchedulePage(),
    WorkoutPage(),
    const ProgressPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.person, color: Color(0xFFF42525)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            );
          },
        ),
        title: Image.asset(
          'assets/images/red_logo.png',
          height: 50,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.settings, color: Color(0xFFF42525)),
            onSelected: (value) {
              if (value == 'sign_out') {
                _signOut();
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'sign_out',
                  child: Text(
                    'Sign Out',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'SCHEDULE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'WORKOUT',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'GOALS',
          ),
        ],
      ),
    );
  }

  void _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPages(title: ''),
        ),
      );
    } catch (e) {
      debugPrint("Error during sign-out: $e");
    }
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Trending workouts',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  WorkoutCard(
                    image: 'assets/images/3.png',
                    title: 'EASY HOME WORKOUTS FOR BEGINNERS',
                    duration: '15-25 minutes',
                    difficulty: 'Easy',
                    ageGroup: '16-40 years old',
                    description:
                        'A great workout for beginners to build stamina and strength at home.',
                    workoutDuration: 25,
                  ),
                  const SizedBox(width: 10),
                  SingleChildScrollView(
                    child: WorkoutCard(
                      image: 'assets/images/4.png',
                      title: 'SIMPLE EQUIPMENT WORKOUTS',
                      duration: '20-30 minutes',
                      difficulty: 'Easy',
                      ageGroup: '16-40 years old',
                      description:
                          'Simple equipment workouts for anyone looking to stay fit at home.',
                      workoutDuration: 30,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SingleChildScrollView(
                    child: WorkoutCard(
                      image: 'assets/images/1.png',
                      title: 'MODERATE DUMBBELL WORKOUTS',
                      duration: '30-45 minutes',
                      difficulty: 'Moderate',
                      ageGroup: '16-25 years old',
                      description:
                          'Moderate dumbbell workouts to strengthen and tone muscles.',
                      workoutDuration: 40,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'More Workouts for You',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SingleChildScrollView(
                    child: WorkoutCard(
                      image: 'assets/images/6.png',
                      title: 'BEGINNER CARDIO WORKOUT',
                      duration: '10-20 minutes',
                      difficulty: 'Easy',
                      ageGroup: '16-40 years old',
                      description:
                          'A cardio workout designed for beginners to get your heart pumping.',
                      workoutDuration: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SingleChildScrollView(
                    child: WorkoutCard(
                      image: 'assets/images/2.png',
                      title: 'BODYWEIGHT WORKOUT',
                      duration: '15-30 minutes',
                      difficulty: 'Moderate',
                      ageGroup: '16-40 years old',
                      description:
                          'Bodyweight exercises that can be done anywhere, no equipment needed.',
                      workoutDuration: 30,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SingleChildScrollView(
                    child: WorkoutCard(
                      image: 'assets/images/8.png',
                      title: 'FULL BODY DUMBBELL WORKOUT',
                      duration: '30-45 minutes',
                      difficulty: 'Moderate',
                      ageGroup: '16-40 years old',
                      description:
                          'A full-body workout using dumbbells for strength and toning.',
                      workoutDuration: 45,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Advanced Workouts for Experts',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SingleChildScrollView(
                    child: WorkoutCard(
                      image: 'assets/images/12.png',
                      title: 'ADVANCED CARDIO WORKOUT',
                      duration: '30-45 minutes',
                      difficulty: 'Advanced',
                      ageGroup: '20-40 years old',
                      description:
                          'A high-intensity cardio workout for advanced fitness levels.',
                      workoutDuration: 45,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SingleChildScrollView(
                    child: WorkoutCard(
                      image: 'assets/images/13.png',
                      title: 'MUSCLE TONING WORKOUT',
                      duration: '25-35 minutes',
                      difficulty: 'Advanced',
                      ageGroup: '20-40 years old',
                      description:
                          'Muscle toning workout using weights and bodyweight exercises.',
                      workoutDuration: 35,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SingleChildScrollView(
                    child: WorkoutCard(
                      image: 'assets/images/14.png',
                      title: 'EXPERT LEVEL STRENGTH TRAINING',
                      duration: '40-50 minutes',
                      difficulty: 'Advanced',
                      ageGroup: '20-40 years old',
                      description:
                          'Strength training with heavy weights for expert fitness levels.',
                      workoutDuration: 50,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final String image;
  final String title;
  final String duration;
  final String difficulty;
  final String ageGroup;
  final String description;
  final int workoutDuration;

  const WorkoutCard({
    super.key,
    required this.image,
    required this.title,
    required this.duration,
    required this.difficulty,
    required this.ageGroup,
    required this.description,
    required this.workoutDuration,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> workoutList = [];
    if (title == 'EASY HOME WORKOUTS FOR BEGINNERS') {
      workoutList = [
        {'name': 'Push-ups', 'sets': '3', 'reps': '10-15'},
        {'name': 'Squats', 'sets': '3', 'reps': '15-20'},
        {'name': 'Lunges', 'sets': '3', 'reps': '10-12'}
      ];
    } else if (title == 'MODERATE DUMBBELL WORKOUTS') {
      workoutList = [
        {'name': 'Dumbbell Squats', 'sets': '3', 'reps': '12-15'},
        {'name': 'Dumbbell Press', 'sets': '3', 'reps': '12-15'},
        {'name': 'Dumbbell Bicep Curl', 'sets': '3', 'reps': '12-15'},
      ];
    } else if (title == 'SIMPLE EQUIPMENT WORKOUTS') {
      workoutList = [
        {'name': 'Dumbbell Rows', 'sets': '3', 'reps': '12-15'},
        {'name': 'Dumbbell Press', 'sets': '3', 'reps': '12-15'},
        {'name': 'Treadmill', 'sets': '3', 'reps': '5 minutes'},
      ];
    } else if (title == 'BEGINNER CARDIO WORKOUT') {
      workoutList = [
        {'name': 'Lunges', 'sets': '3', 'reps': '12-15'},
        {'name': 'Mountain Climbers', 'sets': '3', 'reps': '12-15'},
        {'name': 'Squat Jump', 'sets': '3', 'reps': '5-8'},
      ];
    } else if (title == 'BODYWEIGHT WORKOUT') {
      workoutList = [
        {'name': 'Plank', 'sets': '3', 'reps': '1 minute'},
        {'name': 'Squats', 'sets': '3', 'reps': '12-15'},
        {'name': 'Pull-ups', 'sets': '3', 'reps': '12-15'},
      ];
    } else if (title == 'FULL BODY DUMBBELL WORKOUT') {
      workoutList = [
        {'name': 'Hammer Curls', 'sets': '3', 'reps': '12-15'},
        {'name': 'Dumbbell Squats', 'sets': '3', 'reps': '12-15'},
        {'name': 'Lateral Raises', 'sets': '2', 'reps': '12-15'},
      ];
    } else if (title == 'MUSCLE TONING WORKOUT') {
      workoutList = [
        {'name': 'Bell Shoulder Presses', 'sets': '5', 'reps': '12-15'},
        {'name': 'Push-ups', 'sets': '5', 'reps': '12-15'},
        {'name': 'Bicep Curls', 'sets': '5', 'reps': '12-15'},
      ];
    } else if (title == 'EXPERT LEVEL STRENGTH TRAINING') {
      workoutList = [
        {'name': 'Deadlifts', 'sets': '5', 'reps': '5'},
        {'name': 'Diamond Push-ups', 'sets': '5', 'reps': '20-30'},
        {'name': 'Overhead Press', 'sets': '5', 'reps': '12-15'},
      ];
    } else if (title == 'ADVANCED CARDIO WORKOUT') {
      workoutList = [
        {'name': 'Jump Rope', 'sets': '3', 'reps': '2 minutes'},
        {'name': 'High Plank to Low Plank', 'sets': '3', 'reps': '15'},
        {'name': 'Supermans', 'sets': '3', 'reps': '12-15'},
      ];
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WorkoutDetailView(
              workoutTitle: title,
              description: description,
              duration: workoutDuration,
              difficulty: difficulty,
              ageRange: ageGroup,
              imageUrl: image,
              workoutList: workoutList,
            ),
          ),
        );
      },
      child: Container(
        width: 150,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.0), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.white, size: 14),
                  const SizedBox(width: 5),
                  Text(
                    duration,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkoutDetailView extends StatelessWidget {
  final String workoutTitle;
  final String description;
  final int duration;
  final String difficulty;
  final String ageRange;
  final String imageUrl;
  final List<Map<String, String>> workoutList;

  const WorkoutDetailView({
    super.key,
    required this.workoutTitle,
    required this.description,
    required this.duration,
    required this.difficulty,
    required this.ageRange,
    required this.imageUrl,
    required this.workoutList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF42525),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(workoutTitle,
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(description,
              style: const TextStyle(fontSize: 16, color: Colors.black54)),
          const SizedBox(height: 20),
          Row(
            children: [
              const Icon(Icons.access_time, color: Color(0xFFF42525)),
              const SizedBox(width: 8),
              Text('$duration minutes', style: const TextStyle(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.bar_chart, color: Color(0xFFF42525)),
              const SizedBox(width: 8),
              Text('Difficulty: $difficulty',
                  style: const TextStyle(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.person, color: Color(0xFFF42525)),
              const SizedBox(width: 8),
              Text('Age range: $ageRange',
                  style: const TextStyle(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Recommended Workouts:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Column(
            children: workoutList.map((exercise) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 5),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.red, width: 2), // Red outline
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  title: Text(
                    exercise['name']!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  subtitle: Text(
                      'Sets: ${exercise['sets']} | Reps: ${exercise['reps']}'),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }
}
