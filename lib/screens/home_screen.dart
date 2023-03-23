import 'package:f1_api/themes/app_themes.dart';
import 'package:f1_api/views/drivers_view_provider.dart';
import 'package:flutter/material.dart';

import '../views/views.dart';
import '../widgets/widgets.dart';


class HomeScreen extends StatefulWidget {
   
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;
  int appBarIndex = 0;

  @override
  Widget build(BuildContext context) {

    final screens = [const HomeView(), const DriversViewP(), const TeamView(), const RacesView()];
    final appbars = [const AppBarHome(), const AppBarDrivers(), const AppBarTeams(), const AppBarRaces()];

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: appbars[appBarIndex],
        ),
      ),
      backgroundColor: Colors.grey.shade600,
      body: 
        IndexedStack(
          index: selectedIndex,
          children: screens,
        ),

      bottomNavigationBar: BottomNavigationBar(
        fixedColor: AppTheme.primaryColor,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
            appBarIndex = value;
          });
        },
        elevation: 0,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: Colors.black,),
            activeIcon: Icon(Icons.home, color: AppTheme.primaryColor,),
            label: 'Race', 
            backgroundColor: Colors.white,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_4_outlined, color: Colors.black,),
            activeIcon: Icon(Icons.person_4, color: AppTheme.primaryColor,),
            label: 'Drivers',
            backgroundColor: Colors.white
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.theater_comedy_outlined, color: Colors.black,),
            activeIcon: Icon(Icons.theater_comedy, color: AppTheme.primaryColor,),
            label: 'Teams',
            backgroundColor: Colors.white
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.flag_outlined, color: Colors.black,),
            activeIcon: Icon(Icons.flag, color: AppTheme.primaryColor,),
            label: 'Races', 
            backgroundColor: Colors.white
          ),
        ],
      ),
    );
  }
}