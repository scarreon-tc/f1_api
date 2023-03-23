import 'package:flutter/material.dart';

class AppBarTeams extends StatelessWidget {
  const AppBarTeams({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('TEAMS', style: 
      TextStyle(
        fontFamily: 'F1',
        color: Colors.white,
        fontSize: 17
      ),
    );
  }
}