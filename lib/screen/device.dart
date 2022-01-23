///
/// screen/device.dart
///
import 'package:flutter/material.dart';
import 'skill.dart';
import 'experience.dart';
import 'education.dart';
import 'info.dart';
import 'profil.dart';

/// La classe de l'écran, qui va instancier un état
// ignore: must_be_immutable
class DeviceScreen extends StatefulWidget {
  @override
  _DeviceScreenState createState() => _DeviceScreenState();
}

/// La classe de l'état
class _DeviceScreenState extends State<DeviceScreen> {
  /// écran par défaut
  int _currentScreen = 0;

  /// liste des écrans
  final List<Widget> _screenList = [
    ProfilScreen(),
    ExperienceScreen(),
    EducationScreen(),
    SkillScreen(),
    InfosScreen(),
  ];

  /// construction de l'écran principal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Maxime Rouget"),
      ),
      //
      body: _screenList[_currentScreen],
      //
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        //
        onTap: onTabTapped,

        backgroundColor: Colors.blue,
        fixedColor: Colors.black,
        unselectedItemColor: Colors.white,
        //
        currentIndex: _currentScreen,
        //
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_ind_outlined),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.engineering_outlined),
            label: 'Expériences',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            label: 'Formations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up_outlined),
            label: 'Compétences',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge_outlined),
            label: 'Infos',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentScreen = index;
    });
  }
}
