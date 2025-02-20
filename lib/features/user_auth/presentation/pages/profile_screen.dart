import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calendar_provider.dart';
import 'user_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String _timeSpent = "0 hours";
  final String _favoriteWorkout = "None";
  final String _joinedDate = "2025-02-12";

  void _editName(BuildContext context, UserProvider userProvider) {
    TextEditingController nameController =
        TextEditingController(text: userProvider.name);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Edit Name",
          style: TextStyle(color: Colors.black),
        ),
        content: TextField(
          controller: nameController,
          decoration: InputDecoration(
            hintText: "Enter your name",
            hintStyle: const TextStyle(color: Color(0xFFF42525)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFF42525)),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFF42525)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              userProvider.updateName(nameController.text);
              Navigator.of(context).pop();
            },
            child:
                const Text("Save", style: TextStyle(color: Color(0xFFF42525))),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel",
                style: TextStyle(color: Color(0xFFF42525))),
          ),
        ],
      ),
    );
  }

  // Opens a dialog to select a title.
  void _selectTitle(BuildContext context, UserProvider userProvider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Select Title",
            style: TextStyle(color: Color(0xFFF42525))),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTitleOption(context, "The Gain Train", userProvider),
            _buildTitleOption(context, "The Power Pumper", userProvider),
            _buildTitleOption(context, "The Endurance Expert", userProvider),
            _buildTitleOption(context, "The Strength Seeker", userProvider),
            _buildTitleOption(
                context, "The Conditioning Champion", userProvider),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleOption(
      BuildContext context, String title, UserProvider userProvider) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Color(0xFFF42525))),
      onTap: () {
        userProvider.updateTitle(title);
        Navigator.of(context).pop();
      },
    );
  }

  void _selectAvatar(BuildContext context, UserProvider userProvider) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    userProvider.updateAvatar('assets/images/22.png');
                    Navigator.of(context).pop();
                  },
                  child: Image.asset('assets/images/22.png',
                      width: 80, height: 80),
                ),
                GestureDetector(
                  onTap: () {
                    userProvider.updateAvatar('assets/images/23.png');
                    Navigator.of(context).pop();
                  },
                  child: Image.asset('assets/images/23.png',
                      width: 80, height: 80),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final calendarProvider = Provider.of<CalendarProvider>(context);
    final recentWorkouts = calendarProvider.completedWorkouts.values
        .expand((workouts) => workouts)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Profile',
          style: TextStyle(
              color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF42525),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () => _selectAvatar(context, userProvider),
                child: CircleAvatar(
                  radius: 75,
                  backgroundColor: const Color(0xFFF42525),
                  child: CircleAvatar(
                    radius: 72,
                    backgroundColor: Colors.white,
                    backgroundImage: userProvider.avatar.isEmpty
                        ? null
                        : AssetImage(userProvider.avatar),
                    child: userProvider.avatar.isEmpty
                        ? const Icon(Icons.person,
                            size: 72, color: Color(0xFFF42525))
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () => _editName(context, userProvider),
                child: Center(
                  child: Text(userProvider.name,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () => _selectTitle(context, userProvider),
                child: Center(
                  child: Text(userProvider.title,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFF42525))),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.timer, color: Color(0xFFF42525)),
                      const SizedBox(height: 4),
                      Text("Time Spent\n$_timeSpent",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.star, color: Color(0xFFF42525)),
                      const SizedBox(height: 4),
                      Text("Favorite\n$_favoriteWorkout",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.calendar_today,
                          color: Color(0xFFF42525)),
                      const SizedBox(height: 4),
                      Text("Joined\n$_joinedDate",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recent Workouts',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 5),
              recentWorkouts.isEmpty
                  ? const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('No completed workouts yet.',
                          style: TextStyle(color: Color(0xFFF42525))),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: recentWorkouts.length,
                      itemBuilder: (context, index) {
                        final workout = recentWorkouts[index];
                        return ListTile(
                          title: Text(workout['workout'] ?? ''),
                          subtitle:
                              Text('Completed at: ${workout['time'] ?? ''}'),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
