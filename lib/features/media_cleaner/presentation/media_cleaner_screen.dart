import 'package:flutter/material.dart';

class MediaCleanerScreen extends StatefulWidget {
  const MediaCleanerScreen({super.key});

  @override
  State<MediaCleanerScreen> createState() => _MediaCleanerScreenState();
}

class _MediaCleanerScreenState extends State<MediaCleanerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Media Cleaner')),
      // TODO: show the mock media list here
      body: Center(child: Text('No media yet')),
    );
  }
}
