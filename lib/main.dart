import 'package:f1_api/api/dio.dart';
import 'package:f1_api/providers/f1_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'router/app_routes.dart';
import 'themes/app_themes.dart';

void main() => {
     Api.configureDio(),
      runApp(const AppState())
    };

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => F1Provider(), lazy: false,)
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'F1 API',
        //home: const CardScreen(),
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.getAppRoutes(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        theme: AppTheme.lightTheme);
  }
}
