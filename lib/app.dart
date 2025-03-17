import 'package:alerto_emergency_response_app/providers.dart';
import 'package:flutter/material.dart';

import 'core/routes/go_routes.dart';
import 'core/themes/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return appProvider(
      child: MaterialApp.router(
        title: 'Alerto Emergency Response App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
