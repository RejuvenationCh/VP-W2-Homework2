import 'package:flutter/material.dart';

enum MediaCategory { video, screenRecording, screenshot, photo, duplicate }

class MediaItem {
  final String id;
  final String name;
  final MediaCategory category;
  final int sizeBytes;
  final DateTime date;

  const MediaItem({
    required this.id,
    required this.name,
    required this.category,
    required this.sizeBytes,
    required this.date,
  });
}

String categoryLabel(MediaCategory c) {
  switch (c) {
    case MediaCategory.video:
      return 'Videos';
    case MediaCategory.screenRecording:
      return 'Screen recordings';
    case MediaCategory.screenshot:
      return 'Screenshots';
    case MediaCategory.photo:
      return 'Photos';
    case MediaCategory.duplicate:
      return 'Duplicates';
  }
}

IconData categoryIcon(MediaCategory c) {
  switch (c) {
    case MediaCategory.video:
      return Icons.videocam;
    case MediaCategory.screenRecording:
      return Icons.screen_share;
    case MediaCategory.screenshot:
      return Icons.screenshot;
    case MediaCategory.photo:
      return Icons.photo;
    case MediaCategory.duplicate:
      return Icons.copy;
  }
}

// 1 GB and up shows one decimal, anything smaller is rounded into MB
String formatSize(int bytes) {
  int mb = 1024 * 1024;
  int gb = 1024 * mb;
  if (bytes >= gb) {
    return '${(bytes / gb).toStringAsFixed(1)} GB';
  }
  return '${(bytes / mb).round()} MB';
}
