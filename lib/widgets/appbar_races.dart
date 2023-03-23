import 'package:flutter/material.dart';

class AppBarRaces extends StatelessWidget {
  const AppBarRaces({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('RACES', style: 
      TextStyle(
        fontFamily: 'F1',
        color: Colors.white,
        fontSize: 17
      ),
    );
  }
}