import 'package:flutter_firebase/features/user_auth/presentation/pages/workout_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:provider/provider.dart';

class WorkoutPage extends StatelessWidget {
  WorkoutPage({super.key});

  final List<Map<String, dynamic>> workouts = [
    {
      'name': 'Push-ups',
      'description': 'A great exercise to build upper body strength.',
      'detailedTitle': 'Push-ups: Upper Body Strength Builder',
      'detailedDescription':
          'Push-ups are a fundamental exercise to improve upper body strength, focusing on the chest, shoulders, and triceps. It helps increase muscular endurance and stability.',
      'stepByStep': [
        'Start in a high plank position with your hands slightly wider than shoulder-width apart.',
        'Lower your body until your chest almost touches the ground, keeping your elbows at a 45-degree angle.',
        'Push back up to the starting position, fully extending your arms.',
      ],
      'image': 'assets/images/pushup.png',
    },
    {
      'name': 'Squats',
      'description': 'Strengthens legs and glutes.',
      'detailedTitle': 'Squats: Lower Body Strength and Mobility',
      'detailedDescription':
          'Squats are a lower-body exercise that primarily targets the quads, hamstrings, and glutes, building leg strength and improving mobility.',
      'stepByStep': [
        'Stand with your feet shoulder-width apart, toes slightly pointed outward.',
        'Lower your hips down and back as if sitting into a chair, keeping your chest up.',
        'Push through your heels to return to the starting position.',
      ],
      'image': 'assets/images/squat.png',
    },
    {
      'name': 'Burpees',
      'description': 'A full-body workout to increase stamina.',
      'detailedTitle': 'Burpees: Full-Body Fitness Boost',
      'detailedDescription':
          'Burpees are a full-body exercise that boosts cardiovascular fitness while engaging multiple muscle groups, helping to build strength and improve conditioning.',
      'stepByStep': [
        'Start in a standing position, then drop into a squat and place your hands on the floor.',
        'Jump your feet back into a plank position, perform a push-up, then jump your feet forward.',
        'Explode upward into a jump, clapping your hands overhead before returning to the starting position.',
      ],
      'image': 'assets/images/burpees.png',
    },
    {
      'name': 'Plank',
      'description': 'Core strength and stability exercise.',
      'detailedTitle': 'Plank: Isometric Core Strengthening',
      'detailedDescription':
          'The plank is an isometric core exercise that strengthens the abdominal muscles, lower back, and shoulders. It helps improve stability and posture.',
      'stepByStep': [
        'Start in a forearm plank position with elbows directly under your shoulders.',
        'Keep your body in a straight line from head to heels, engaging your core and glutes.',
        'Hold the position for the desired amount of time while maintaining proper form.',
      ],
      'image': 'assets/images/plank.png',
    },
    {
      'name': 'Lunges',
      'description': 'Improves balance and strengthens lower body.',
      'detailedTitle': 'Lunges: Leg Strength and Balance',
      'detailedDescription':
          'Lunges target the quads, hamstrings, and glutes, helping to improve leg strength, balance, and coordination.',
      'stepByStep': [
        'Stand tall with your feet together, then take a large step forward with one leg.',
        'Lower your hips until both knees are bent at 90-degree angles, keeping your chest up.',
        'Push off your front foot to return to the starting position, then alternate legs.',
      ],
      'image': 'assets/images/lunges.png',
    },
    {
      'name': 'Jumping Jacks',
      'description': 'A cardio workout to boost your heart rate.',
      'detailedTitle': 'Jumping Jacks: Full-Body Cardiovascular Exercise',
      'detailedDescription':
          'Jumping jacks are a simple cardiovascular exercise that works the entire body, improving endurance, coordination, and heart health.',
      'stepByStep': [
        'Stand with your feet together and arms at your sides.',
        'Jump your feet out to the sides while raising your arms above your head.',
        'Jump back to the starting position, bringing your arms back down to your sides. Repeat.',
      ],
      'image': 'assets/images/jumping jacks.png',
    },
    {
      'name': 'Bicycle Crunches',
      'description': 'Targets abs and obliques for core strength.',
      'detailedTitle': 'Bicycle Crunches: Oblique and Core Strength',
      'detailedDescription':
          'Bicycle crunches engage the core, specifically the obliques and rectus abdominis.',
      'stepByStep': [
        'Lie on your back with your hands behind your head and knees bent.',
        'Bring one knee toward your chest while twisting your torso to bring the opposite elbow toward that knee.',
        'Alternate sides, as if pedaling a bicycle, while engaging your core.',
      ],
      'image': 'assets/images/bicyclecrunches.png',
    },
    {
      'name': 'Kettlebell Swings',
      'description': 'A full-body workout to build strength and endurance.',
      'detailedTitle': 'Kettlebell Swings: Full-Body Strength and Endurance',
      'detailedDescription':
          'Kettlebell swings target the glutes, hamstrings, and core.',
      'stepByStep': [
        'Stand with feet shoulder-width apart, holding a kettlebell with both hands in front of you.',
        'Hinge at your hips to swing the kettlebell back between your legs.',
        'Drive your hips forward to swing the kettlebell to chest height, then control the swing back down.',
      ],
      'image': 'assets/images/kettleballswings.png',
    },
    {
      'name': 'Wall Sit',
      'description': 'A lower body exercise for endurance and leg strength.',
      'detailedTitle': 'Wall Sit: Endurance and Leg Strength',
      'detailedDescription':
          'A wall sit strengthens the quads, glutes, and calves.',
      'stepByStep': [
        'Stand with your back against a wall, then slide down until your thighs are parallel to the floor.',
        'Keep your knees at 90 degrees and hold the position for as long as possible.',
        'Focus on keeping your core tight and back flat against the wall.',
      ],
      'image': 'assets/images/wallsit.png',
    },
    {
      'name': 'Pull-ups',
      'description':
          'Upper body exercise that works arms, shoulders, and back.',
      'detailedTitle': 'Pull-ups: Upper Body Strength',
      'detailedDescription':
          'Pull-ups work the back, shoulders, and arms, focusing on building upper body strength.',
      'stepByStep': [
        'Grip the pull-up bar with your hands slightly wider than shoulder-width apart.',
        'Hang from the bar with your arms fully extended.',
        'Pull your body upward until your chin is above the bar, then lower back down with control.',
      ],
      'image': 'assets/images/pullups.png',
    },
    {
      'name': 'Flutter Kicks',
      'description': 'Great for strengthening the lower abs and core.',
      'detailedTitle': 'Flutter Kicks: Core Strength and Stability',
      'detailedDescription':
          'Flutter kicks are an effective core exercise that targets the lower abs.',
      'stepByStep': [
        'Lie on your back with your legs extended and arms at your sides.',
        'Lift your legs slightly off the floor, keeping them straight.',
        'Alternate kicking your legs up and down in a fluttering motion while keeping your core engaged.',
      ],
      'image': 'assets/images/flutterkicks.png',
    },
    {
      'name': 'Jump Rope',
      'description':
          'Cardio workout that also improves coordination and endurance.',
      'detailedTitle': 'Jump Rope: Cardiovascular and Coordination Boost',
      'detailedDescription':
          'Jump rope is a fun, full-body workout that improves cardiovascular health, agility, and coordination.',
      'stepByStep': [
        'Stand with a rope in both hands, holding it behind you.',
        'Swing the rope over your head and jump as it comes down.',
        'Continue jumping at a steady pace, aiming for rhythm and consistency.',
      ],
      'image': 'assets/images/jumprope.png',
    },
    {
      'name': 'High Plank to Low Plank',
      'description': 'Core exercise to build strength and stability.',
      'detailedTitle': 'High Plank to Low Plank: Core and Shoulder Stability',
      'detailedDescription':
          'This core and shoulder exercise improves stability and strength.',
      'stepByStep': [
        'Start in a high plank position, with your hands directly under your shoulders.',
        'Lower one arm at a time to a forearm plank position.',
        'Push back up into the high plank position one arm at a time. Repeat.',
      ],
      'image': 'assets/images/highplanktolowplank.png',
    },
    {
      'name': 'Supermans',
      'description': 'Targets the back and core for stability and strength.',
      'detailedTitle': 'Supermans: Back and Core Strength',
      'detailedDescription':
          'Supermans are a great bodyweight exercise for strengthening the lower back and glutes.',
      'stepByStep': [
        'Lie face down with your arms extended in front of you and legs straight.',
        'Simultaneously lift your arms, chest, and legs off the floor, squeezing your glutes and lower back muscles.',
        'Hold briefly at the top, then lower back down.',
      ],
      'image': 'assets/images/supermans.png',
    },
    {
      'name': 'Dumbbell Deadlifts',
      'description': 'Strengthens hamstrings, glutes, lower back, and core.',
      'detailedTitle': 'Dumbbell Deadlifts: Lower Body and Core Strength',
      'detailedDescription':
          'Dumbbell deadlifts strengthen the hamstrings, glutes, and lower back.',
      'stepByStep': [
        'Hold a dumbbell in each hand, arms fully extended in front of your thighs, with feet hip-width apart.',
        'Hinge at the hips, lowering the dumbbells close to your legs while keeping your back straight.',
        'Lower until the dumbbells reach mid-shin or just below your knees, then squeeze your glutes to return to standing.',
      ],
      'image': 'assets/images/dumbbelldeadlifts.png',
    },
    {
      'name': 'Battle Rope Waves',
      'description':
          'A high-intensity exercise that improves cardiovascular fitness and works the shoulders, arms, and core.',
      'detailedTitle': 'Battle Rope Waves: High-Intensity Full-Body Exercise',
      'detailedDescription':
          'Battle rope waves are a great full-body exercise to improve endurance and upper body strength.',
      'stepByStep': [
        'Grip the ends of the battle ropes in each hand, with your feet shoulder-width apart.',
        'Bend your knees slightly and keep your back straight.',
        'Rapidly alternate raising and lowering each arm to create waves in the ropes.',
      ],
      'image': 'assets/images/battleropewaves.png',
    },
    {
      'name': 'Dumbbell Incline Press',
      'description': 'Targets the upper chest, shoulders, and triceps.',
      'detailedTitle': 'Dumbbell Incline Press: Upper Chest Strength',
      'detailedDescription':
          'This exercise primarily targets the upper chest, shoulders, and triceps, helping to build strength and size in the upper body.',
      'stepByStep': [
        'Set an adjustable bench to a 30-45 degree incline and sit down with a dumbbell in each hand resting on your thighs.',
        'Lie back on the bench, bringing the dumbbells up to shoulder level with your palms facing forward.',
        'Press the dumbbells upward until your arms are fully extended, keeping the weights steady.',
      ],
      'image': 'assets/images/dumbbellinclinepress.png',
    },
    {
      'name': 'Bench Press',
      'description': 'Targets chest, shoulders, and triceps.',
      'detailedTitle': 'Bench Press: Upper Body Strength',
      'detailedDescription':
          'The bench press is a classic strength-training exercise that builds the chest, shoulders, and triceps.',
      'stepByStep': [
        'Lie flat on a bench with a barbell positioned on the rack above you. Place your feet firmly on the ground.',
        'Grip the barbell slightly wider than shoulder-width apart, ensuring your wrists stay straight and in line with your forearms.',
        'Lower the barbell slowly to your chest, keeping your elbows at a 45-degree angle to your body.',
      ],
      'image': 'assets/images/benchpress.png',
    },
    {
      'name': 'Leg Press',
      'description': 'Strengthens the legs, including quadriceps and glutes.',
      'detailedTitle': 'Leg Press: Lower Body Strength',
      'detailedDescription':
          'The leg press targets the quads, hamstrings, and glutes. It’s a great exercise for building lower-body strength.',
      'stepByStep': [
        'Sit on the leg press machine with your back flat against the pad and feet shoulder-width apart on the platform.',
        'Push the platform away from you by straightening your legs, but don’t lock your knees at the top.',
        'Slowly lower the platform back down to the starting position.',
      ],
      'image': 'assets/images/legpress.png',
    },
    {
      'name': 'Leg Extensions',
      'description': 'Focuses on quadriceps for leg strength.',
      'detailedTitle': 'Leg Extensions: Quad Strengthening',
      'detailedDescription':
          'This isolation exercise primarily targets the quadriceps, helping to strengthen and define the front of your thighs.',
      'stepByStep': [
        'Sit on the leg extension machine, making sure your knees are aligned with the machine’s pivot point.',
        'Place your shins under the padded bar, with your feet pointing forward.',
        'Extend your legs upward until they are fully straight, but don’t lock your knees.',
      ],
      'image': 'assets/images/legextension.png',
    },
    {
      'name': 'Leg Curls (Seated or Lying)',
      'description': 'Targets hamstrings for lower body strength.',
      'detailedTitle': 'Leg Curls: Hamstring Strengthening',
      'detailedDescription':
          'This exercise isolates the hamstrings, which are crucial for knee flexion and overall leg strength.',
      'stepByStep': [
        'Lie face down on the leg curl machine with your ankles under the padded bar.',
        'Grip the handles and ensure your body stays flat against the bench.',
        'Curl your legs upward, bringing the padded bar as close to your glutes as possible.',
      ],
      'image': 'assets/images/legcurl.png',
    },
    {
      'name': 'Russian Twists',
      'description':
          'An effective core exercise for building oblique strength.',
      'detailedTitle': 'Russian Twists: Oblique and Core Strength',
      'detailedDescription':
          'Russian twists work the obliques and help strengthen the core.',
      'stepByStep': [
        'Sit on the floor with your knees bent and feet flat, leaning back slightly while maintaining a straight back.',
        'Hold your hands together in front of your chest or grab a weight (such as a dumbbell or medicine ball).',
        'Rotate your torso to the right, bringing the weight (or your hands) toward the floor beside your hip.',
      ],
      'image': 'assets/images/russiantwists.png',
    },
    {
      'name': 'Tricep Dips',
      'description': 'Targets the triceps and upper arms.',
      'detailedTitle': 'Tricep Dips: Upper Arm Strength',
      'detailedDescription':
          'Tricep dips target the triceps and engage the shoulders and chest.',
      'stepByStep': [
        'Sit on the edge of a bench, chair, or sturdy surface with your hands resting on the edge, fingers pointing forward.',
        'Lower your body by bending your elbows to about a 90-degree angle.',
        'Push through your palms to extend your arms and return to the starting position.',
      ],
      'image': 'assets/images/tricepdips.png',
    },
    {
      'name': 'Reverse Crunches',
      'description': 'Focuses on the lower abs for core strength.',
      'detailedTitle': 'Reverse Crunches: Lower Abs Strength',
      'detailedDescription':
          'Reverse crunches are effective for targeting the lower abs.',
      'stepByStep': [
        'Lie on your back with your knees bent and your legs lifted.',
        'Use your lower abs to lift your hips off the ground, bringing your knees toward your chest.',
        'Slowly lower your hips back down with control.',
      ],
      'image': 'assets/images/reversecrunches.png',
    },
    {
      'name': 'Diamond Push up',
      'description': 'A variation of push-ups that targets the triceps.',
      'detailedTitle': 'Diamond Push-ups: Triceps Focus',
      'detailedDescription':
          'Diamond push-ups focus on the triceps and inner chest.',
      'stepByStep': [
        'Start in a standard push-up position, but place your hands together underneath your chest, forming a diamond shape.',
        'Lower your chest toward your hands, keeping your elbows close to your body.',
        'Push back up to the starting position, fully extending your arms.',
      ],
      'image': 'assets/images/diamondpushup.png',
    },
    {
      'name': 'Hollow Body Crunch',
      'description':
          'Core strengthening exercise focusing on the abs and stability.',
      'detailedTitle': 'Hollow Body Crunch: Core Engagement',
      'detailedDescription':
          'The hollow body crunch focuses on the abs and engages the lower core muscles.',
      'stepByStep': [
        'Lie flat on your back with your arms extended overhead and legs straight.',
        'Lift your legs and upper back off the floor, engaging your core to create a hollow position.',
        'Crunch by bringing your knees toward your chest, then slowly return to the starting position.',
      ],
      'image': 'assets/images/hollowbodycrunch.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WORKOUT LIST',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        backgroundColor: Color(0xFFF42525),
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomizeWorkoutScreen(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xFFF42525)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Customize",
                    style: TextStyle(
                      color: Color(0xFFF42525),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          return WorkoutItem(
            workoutName: workouts[index]['name']!,
            workoutDescription: workouts[index]['description']!,
            detailedTitle: workouts[index]['detailedTitle'] ?? 'No Title',
            detailedDescription:
                workouts[index]['detailedDescription'] ?? 'No Description',
            stepByStep: List<String>.from(workouts[index]['stepByStep'] ?? []),
            image: workouts[index]['image'] ?? 'assets/default_image.png',
          );
        },
      ),
    );
  }
}

class WorkoutItem extends StatefulWidget {
  final String workoutName;
  final String workoutDescription;
  final String detailedTitle;
  final String detailedDescription;
  final List<String> stepByStep;
  final String image;

  const WorkoutItem({
    required this.workoutName,
    required this.workoutDescription,
    required this.detailedTitle,
    required this.detailedDescription,
    required this.stepByStep,
    required this.image,
    super.key,
  });

  @override
  _WorkoutItemState createState() => _WorkoutItemState();
}

class _WorkoutItemState extends State<WorkoutItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: isExpanded ? Color(0xFFF42525) : Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.fitness_center,
                    color: isExpanded ? Colors.white : Colors.black,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.workoutName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isExpanded ? Colors.white : Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: isExpanded ? Colors.white : Colors.black,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.workoutDescription,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WorkoutDetails(
                                workoutName: widget.workoutName,
                                workoutDescription: widget.workoutDescription,
                                detailedTitle: widget.detailedTitle,
                                detailedDescription: widget.detailedDescription,
                                stepByStep: widget.stepByStep,
                                image: widget.image,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          children: const [
                            Text(
                              'Learn More',
                              style: TextStyle(
                                color: Color(0xFFF42525),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Color(0xFFF42525),
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class WorkoutDetails extends StatelessWidget {
  final String workoutName;
  final String workoutDescription;
  final String detailedTitle;
  final String detailedDescription;
  final List<String> stepByStep;
  final String image;

  const WorkoutDetails({
    required this.workoutName,
    required this.workoutDescription,
    required this.detailedTitle,
    required this.detailedDescription,
    required this.stepByStep,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Color(0xFFF42525),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detailedTitle,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF42525),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  detailedDescription,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Step-by-Step Guide:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF42525)),
                ),
                const SizedBox(height: 10),
                ...stepByStep.asMap().entries.map((entry) {
                  int index = entry.key + 1;
                  String step = entry.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      '$index. $step',
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  );
                }),
                const SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class CustomizeWorkoutScreen extends StatefulWidget {
  const CustomizeWorkoutScreen({super.key});

  @override
  State<CustomizeWorkoutScreen> createState() => _CustomizeWorkoutScreenState();
}

class _CustomizeWorkoutScreenState extends State<CustomizeWorkoutScreen> {
  final _formKey = GlobalKey<FormState>();

  final Gemini gemini = Gemini.instance;

  bool _isLoading = false;

  // Form fields
  String? _selectedGender;
  String? _selectedAgeBracket;
  String? _selectedIllness;
  String? _selectedLifestyle;
  String? _selectedHealthGoal;
  String? _selectedOccupation;

  final List<String> _illnessOptions = [
    "None",
    "Chronic Health Conditions",
    "Mental Health Conditions",
    "Pain-related Issues",
    "Metabolic and Endocrine Disorders",
    "Other Health Concerns"
  ];
  final List<String> _lifestyleOptions = [
    "Very Active",
    "Active",
    "Moderately Active",
    "Sedentary",
    "Very Sedentary"
  ];
  final List<String> _healthGoals = [
    "Weight Management",
    "Strength and Muscle Building",
    "Endurance and Stamina",
    "Overall Fitness and Wellness",
    "Health Maintenance"
  ];
  final List<String> _ageBrackets = [
    "Under 18",
    "18-29",
    "30-39",
    "40-49",
    "50-64",
    "65 and above"
  ];
  final List<String> _occupations = [
    "Student",
    "Desk Job",
    "Field Work",
    "Manual Labor",
    "Retired",
    "Other"
  ];
  List<String> _suggestedWorkouts = [];

  // ignore: unused_element
  void _generateWorkout() {
    setState(() {
      _suggestedWorkouts = [];

      if (_selectedGender == "Male") {
      } else if (_selectedGender == "Female") {
      } else {}
      if (_selectedAgeBracket == "Under 18") {
        _suggestedWorkouts.addAll(
            ["Push-ups", "Burpees", "Plank", "Jumping Jacks", "Squats"]);
      } else if (_selectedAgeBracket == "18-29") {
        _suggestedWorkouts.addAll([
          "Jump Rope",
          "Squats",
          "Lunges",
          "Dumbbell Deadlifts",
          "Tricep Dips"
        ]);
      } else if (_selectedAgeBracket == "30-39") {
        _suggestedWorkouts.addAll([
          "Jogging",
          "Plank",
          "Lunges",
          "Battle Rope Waves",
          "Russian Twists"
        ]);
      } else if (_selectedAgeBracket == "40-49") {
        _suggestedWorkouts.addAll(
            ["Walking", "Plank", "Leg Curls", "Bicycle Crunches", "Wall Sit"]);
      } else if (_selectedAgeBracket == "50-64") {
        _suggestedWorkouts.addAll([
          "Light Yoga",
          "Walking",
          "Plank",
          "Chair Squats",
          "Reverse Crunches"
        ]);
      } else if (_selectedAgeBracket == "65 and above") {
        _suggestedWorkouts.addAll(
            ["Chair Yoga", "Walking", "Water Aerobics", "Stretching", "Plank"]);
      }
      if (_selectedIllness == "None") {
        if (_selectedHealthGoal == "Weight Management") {
          _suggestedWorkouts.addAll([
            "Burpees",
            "Jump Rope",
            "Bicycle Crunches",
            "Plank",
            "Jumping Jacks"
          ]);
        } else if (_selectedHealthGoal == "Strength and Muscle Building") {
          _suggestedWorkouts.addAll([
            "Push-ups",
            "Squats",
            "Dumbbell Deadlifts",
            "Bench Press",
            "Tricep Dips"
          ]);
        } else if (_selectedHealthGoal == "Endurance and Stamina") {
          _suggestedWorkouts.addAll([
            "Running",
            "Burpees",
            "Jump Rope",
            "High Plank to Low Plank",
            "Jumping Jacks"
          ]);
        } else if (_selectedHealthGoal == "Overall Fitness and Wellness") {
          _suggestedWorkouts.addAll(
              ["Squats", "Plank", "Lunges", "Russian Twists", "Leg Curls"]);
        } else if (_selectedHealthGoal == "Health Maintenance") {
          _suggestedWorkouts.addAll([
            "Walking",
            "Swimming",
            "Stretching",
            "Chair Yoga",
            "Light Yoga"
          ]);
        }
      } else if (_selectedIllness == "Chronic Health Conditions") {
        _suggestedWorkouts = [
          "Walking",
          "Light Yoga",
          "Plank",
          "Chair Squats",
          "Bicycle Crunches"
        ];
      } else if (_selectedIllness == "Mental Health Conditions") {
        _suggestedWorkouts = [
          "Gentle Yoga",
          "Walking",
          "Breathing Exercises",
          "Plank",
          "Stretching"
        ];
      } else if (_selectedIllness == "Pain-related Issues") {
        _suggestedWorkouts = [
          "Swimming",
          "Stretching",
          "Chair Yoga",
          "Plank",
          "Leg Curls"
        ];
      } else if (_selectedIllness == "Metabolic and Endocrine Disorders") {
        _suggestedWorkouts = [
          "Walking",
          "Light Jogging",
          "Yoga",
          "Plank",
          "Leg Extensions"
        ];
      } else if (_selectedIllness == "Other Health Concerns") {
        _suggestedWorkouts = [
          "Walking",
          "Stretching",
          "Yoga",
          "Chair Squats",
          "Plank"
        ];
      }
      if (_selectedLifestyle == "Very Active") {
        _suggestedWorkouts.addAll([
          "Burpees",
          "Kettlebell Swings",
          "Dumbbell Deadlifts",
          "Battle Rope Waves",
          "Jump Rope"
        ]);
      } else if (_selectedLifestyle == "Active") {
        _suggestedWorkouts
            .addAll(["Jumping Jacks", "Squats", "Push-ups", "Lunges", "Plank"]);
      } else if (_selectedLifestyle == "Moderately Active") {
        _suggestedWorkouts
            .addAll(["Wall Sit", "Walking", "Chair Squats", "Plank", "Lunges"]);
      } else if (_selectedLifestyle == "Sedentary") {
        _suggestedWorkouts.addAll(
            ["Chair Yoga", "Walking", "Leg Curls", "Plank", "Stretching"]);
      } else if (_selectedLifestyle == "Very Sedentary") {
        _suggestedWorkouts.addAll([
          "Gentle Yoga",
          "Stretching",
          "Walking",
          "Chair Squats",
          "Water Aerobics"
        ]);
      }
      if (_selectedOccupation == "Student") {
        _suggestedWorkouts.addAll([
          "Plank",
          "Jumping Jacks",
          "Push-ups",
          "Squats",
          "Bicycle Crunches"
        ]);
      } else if (_selectedOccupation == "Desk Job") {
        _suggestedWorkouts.addAll([
          "Chair Yoga",
          "Wall Sit",
          "Stretching",
          "Plank",
          "Reverse Crunches"
        ]);
      } else if (_selectedOccupation == "Field Work") {
        _suggestedWorkouts.addAll(
            ["Squats", "Lunges", "Pull-ups", "Bicycle Crunches", "Supermans"]);
      } else if (_selectedOccupation == "Manual Labor") {
        _suggestedWorkouts.addAll([
          "Kettlebell Swings",
          "Dumbbell Deadlifts",
          "Tricep Dips",
          "Squats",
          "Plank"
        ]);
      } else if (_selectedOccupation == "Retired") {
        _suggestedWorkouts.addAll([
          "Chair Yoga",
          "Walking",
          "Leg Extensions",
          "Reverse Crunches",
          "Stretching"
        ]);
      } else {
        _suggestedWorkouts.addAll(
            ["Bicycle Crunches", "Squats", "Push-ups", "Lunges", "Plank"]);
      }
      if (_suggestedWorkouts.length > 5) {
        _suggestedWorkouts = _suggestedWorkouts.take(5).toList();
      }
    });
  }

  void _sendWorkoutRequest() {
    setState(() {
      _isLoading = true;
    });

    String question =
        "Create a workout plan with minimal details, just make it look like a notes they can review for $_selectedGender individual with aged $_selectedAgeBracket, with $_selectedLifestyle activity level, a goal of $_selectedHealthGoal, Have a illness of $_selectedIllness, and a occupation of $_selectedOccupation. Dont bold any characters, keep it concise, just give the day, the workouts under it should be numbered, the reps and sets required. Also give advices and tips keep the words short to avoid breaklines when copying and pasting this from your respond.";

    _sendMessageToGemini(question);
  }

  void _sendMessageToGemini(String question) {
    StringBuffer responseBuffer = StringBuffer();

    gemini.streamGenerateContent(question).listen((event) {
      String response = event.content?.parts?.fold("", (previous, current) {
            if (current is TextPart) {
              return "$previous ${current.text}";
            }
            return previous;
          }) ??
          "";

      responseBuffer.write(response);
    }).onDone(() {
      String finalResponse = responseBuffer.toString().trim();

      setState(() {
        _suggestedWorkouts = finalResponse.split(", ");

        Map<String, dynamic> workoutMap = {
          'exercise': finalResponse,
        };

        Provider.of<WorkoutProvider>(context, listen: false)
            .setWorkouts([workoutMap]);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GeminiPage(),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Customize Your Workout",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFF42525),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select Sex",
                style: TextStyle(
                  color: Color(0xFFF42525),
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF42525), width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                hint: const Text("Select Sex"),
                items: ["Male", "Female"]
                    .map((gender) =>
                        DropdownMenuItem(value: gender, child: Text(gender)))
                    .toList(),
                onChanged: (value) => setState(() => _selectedGender = value),
                validator: (value) =>
                    value == null ? "Please select your gender" : null,
              ),
              const SizedBox(height: 20),
              const Text(
                "Select Age Bracket",
                style: TextStyle(
                  color: Color(0xFFF42525),
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButtonFormField<String>(
                value: _selectedAgeBracket,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF42525), width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                hint: const Text("Select Age Bracket"),
                items: _ageBrackets
                    .map(
                        (age) => DropdownMenuItem(value: age, child: Text(age)))
                    .toList(),
                onChanged: (value) =>
                    setState(() => _selectedAgeBracket = value),
                validator: (value) =>
                    value == null ? "Please select your age bracket" : null,
              ),
              const SizedBox(height: 20),
              const Text(
                "Do you have any existing illnesses?",
                style: TextStyle(
                  color: Color(0xFFF42525),
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButtonFormField<String>(
                value: _selectedIllness,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF42525), width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                hint: const Text("Select Illness"),
                items: _illnessOptions
                    .map((illness) =>
                        DropdownMenuItem(value: illness, child: Text(illness)))
                    .toList(),
                onChanged: (value) => setState(() => _selectedIllness = value),
                validator: (value) =>
                    value == null ? "Please select an option" : null,
              ),
              const SizedBox(height: 20),
              const Text(
                "Select Your Lifestyle",
                style: TextStyle(
                  color: Color(0xFFF42525),
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButtonFormField<String>(
                value: _selectedLifestyle,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF42525), width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                hint: const Text("Select Lifestyle"),
                items: _lifestyleOptions
                    .map((lifestyle) => DropdownMenuItem(
                        value: lifestyle, child: Text(lifestyle)))
                    .toList(),
                onChanged: (value) =>
                    setState(() => _selectedLifestyle = value),
                validator: (value) =>
                    value == null ? "Please select your lifestyle" : null,
              ),
              const SizedBox(height: 20),
              const Text(
                "Select Your Health Goal",
                style: TextStyle(
                  color: Color(0xFFF42525),
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButtonFormField<String>(
                value: _selectedHealthGoal,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF42525), width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                hint: const Text("Select Health Goal"),
                items: _healthGoals
                    .map((goal) =>
                        DropdownMenuItem(value: goal, child: Text(goal)))
                    .toList(),
                onChanged: (value) =>
                    setState(() => _selectedHealthGoal = value),
                validator: (value) =>
                    value == null ? "Please select your health goal" : null,
              ),
              const SizedBox(height: 20),
              const Text(
                "Select Your Occupation",
                style: TextStyle(
                  color: Color(0xFFF42525),
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButtonFormField<String>(
                value: _selectedOccupation,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF42525), width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                hint: const Text("Select Occupation"),
                items: _occupations
                    .map((occupation) => DropdownMenuItem(
                        value: occupation, child: Text(occupation)))
                    .toList(),
                onChanged: (value) =>
                    setState(() => _selectedOccupation = value),
                validator: (value) =>
                    value == null ? "Please select your occupation" : null,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _sendWorkoutRequest();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Color(0xFFF42525),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xFFF42525)),
                    ),
                    child: Center(
                      child: _isLoading
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                CircularProgressIndicator(color: Colors.white),
                                SizedBox(width: 10),
                                Text(
                                  "Processing... results should appear below.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          : Text(
                              "Generate Workout",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              if (_suggestedWorkouts.isNotEmpty) ...[
                const SizedBox(height: 20),
                const Text(
                  "Suggested Workout Plan:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _suggestedWorkouts
                        .map((workout) => Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    text: workout,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black87),
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class GeminiPage extends StatefulWidget {
  const GeminiPage({super.key});

  @override
  State<GeminiPage> createState() => _GeminiPageState();
}

class _GeminiPageState extends State<GeminiPage> {
  @override
  Widget build(BuildContext context) {
    final workouts = Provider.of<WorkoutProvider>(context).workouts;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gemini Chat Result"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: workouts.length,
          itemBuilder: (context, index) {
            final workout = workouts[index];
            return ListTile(
              title: Text(workout['exercise'].toString()),
              subtitle: Text('Day: ${workout['day'].toString()}'),
            );
          },
        ),
      ),
    );
  }
}
