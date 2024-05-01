import 'package:flutter/material.dart';
import 'screens/chore_page.dart';
import 'theme/app_theme.dart';

const appName = 'chore.tl';

void main() {
  runApp(const ChoreApp());
}

class ChoreApp extends StatelessWidget {
  const ChoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: buildAppTheme(),
      home: const ChorePage(title: appName),
    );
  }
}
