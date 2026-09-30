import 'package:flutter/material.dart';

import '../../models/media_item.dart';
import 'size_badge.dart';

class MediaTile extends StatelessWidget {
  final MediaItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const MediaTile({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? colors.primary : Colors.transparent,
            width: 3,
          ),
        ),
        padding: const EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // check icon in the corner
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                isSelected ? Icons.check_circle : Icons.circle_outlined,
                size: 18,
                color: isSelected ? colors.primary : colors.outline,
              ),
            ),
            // placeholder instead of a real thumbnail
            Expanded(child: Center(child: Icon(categoryIcon(item.category), size: 32))),
            Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 2),
            SizeBadge(bytes: item.sizeBytes),
          ],
        ),
      ),
    );
  }
}
