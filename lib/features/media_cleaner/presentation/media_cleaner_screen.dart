import 'package:flutter/material.dart';

import '../data/mock_media.dart';
import '../models/media_item.dart';
import 'widgets/media_tile.dart';

class MediaCleanerScreen extends StatefulWidget {
  const MediaCleanerScreen({super.key});

  @override
  State<MediaCleanerScreen> createState() => _MediaCleanerScreenState();
}

class _MediaCleanerScreenState extends State<MediaCleanerScreen> {
  // copy of the mock list so deleting doesn't touch the original
  final List<MediaItem> _items = List.of(mockMedia);
  final Set<String> _selectedIds = {};

  void _toggleSelect(String id) {
    setState(() {
      // remove() returns false if it wasn't selected yet
      if (!_selectedIds.remove(id)) _selectedIds.add(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Media Cleaner')),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8),
        itemCount: _items.length,
        itemBuilder: (context, i) => MediaTile(
          item: _items[i],
          isSelected: _selectedIds.contains(_items[i].id),
          onTap: () => _toggleSelect(_items[i].id),
        ),
      ),
    );
  }
}
