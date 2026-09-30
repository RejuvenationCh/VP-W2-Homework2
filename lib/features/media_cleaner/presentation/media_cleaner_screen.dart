import 'package:flutter/material.dart';

import '../data/mock_media.dart';
import '../models/media_item.dart';
import 'widgets/category_filter_chips.dart';
import 'widgets/media_tile.dart';

class MediaCleanerScreen extends StatefulWidget {
  const MediaCleanerScreen({super.key});

  @override
  State<MediaCleanerScreen> createState() => _MediaCleanerScreenState();
}

class _MediaCleanerScreenState extends State<MediaCleanerScreen> {
  final List<MediaItem> _items = List.of(mockMedia);
  MediaCategory? _filter; // null = All
  bool _sortBySize = true;
  final Set<String> _selectedIds = {};

  // filter first, then sort (size = biggest first, date = newest first)
  List<MediaItem> get _visibleItems {
    final List<MediaItem> result = [];
    for (final item in _items) {
      if (_filter == null || item.category == _filter) result.add(item);
    }
    if (_sortBySize) {
      result.sort((a, b) => b.sizeBytes.compareTo(a.sizeBytes));
    } else {
      result.sort((a, b) => b.date.compareTo(a.date));
    }
    return result;
  }

  void _toggleSelect(String id) {
    setState(() {
      // remove() returns false if it wasn't selected yet
      if (!_selectedIds.remove(id)) _selectedIds.add(id);
    });
  }

  void _setFilter(MediaCategory? c) => setState(() => _filter = c);

  void _toggleSort() => setState(() => _sortBySize = !_sortBySize);

  @override
  Widget build(BuildContext context) {
    final visible = _visibleItems;
    return Scaffold(
      appBar: AppBar(
        title: Text('Media Cleaner'),
        actions: [
          IconButton(
            tooltip: _sortBySize ? 'Sorted by size' : 'Sorted by date',
            icon: Icon(_sortBySize ? Icons.sort : Icons.calendar_today),
            onPressed: _toggleSort,
          ),
        ],
      ),
      body: Column(
        children: [
          CategoryFilterChips(selected: _filter, onSelected: _setFilter),
          Expanded(
            child: visible.isEmpty
                ? Center(child: Text('No media'))
                : GridView.builder(
                    padding: EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: visible.length,
                    itemBuilder: (context, i) => MediaTile(
                      item: visible[i],
                      isSelected: _selectedIds.contains(visible[i].id),
                      onTap: () => _toggleSelect(visible[i].id),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
