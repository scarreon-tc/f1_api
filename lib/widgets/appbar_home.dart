import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      //height: 200,
      width: 120,
      child: Image(
        image: AssetImage('assets/logo-F1.png'),
      ),
    );
  }
}