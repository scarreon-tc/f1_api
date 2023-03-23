import 'package:flutter/material.dart';

class AppBarDrivers extends StatelessWidget {
  const AppBarDrivers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('DRIVERS', style: 
      TextStyle(
        fontFamily: 'F1',
        color: Colors.white,
        fontSize: 17
      ),
    );
  }
}