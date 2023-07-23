import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';
import 'package:size_config/app.dart';
import 'package:size_config/custom_text_field.dart';
import 'package:size_config/utils/size_config.dart';
import 'package:size_config/utils/theme_provider/app_state_notifier.dart';
import 'package:size_config/utils/theme_provider/app_theme.dart';
import 'package:size_config/utils/user_preference.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  await UserPreference.getInstance();

  runApp(
    ChangeNotifierProvider<AppStateNotifier>(
      create: (context) => AppStateNotifier(),
      builder: (context, child) => MyApp(),
    ),
  );
}



