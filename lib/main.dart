import 'package:flutter/material.dart';

import 'features/media_cleaner/presentation/media_cleaner_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Media Cleaner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const MediaCleanerScreen(),
    );
  }
}
