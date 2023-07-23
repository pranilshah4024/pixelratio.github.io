import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:size_config/home_view.dart';
import 'package:size_config/utils/theme_provider/app_state_notifier.dart';
import 'package:size_config/utils/theme_provider/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(
      builder: (context, appState, child) {
        appState.setCurrentTheme();
        return MaterialApp(
          title: 'Pixel Ratio Calculation',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: appState.selectedTheme,
          home: const MyHomePage(title: 'Calculate Pixel Ratio'),
        );
      },
    );
  }
}
