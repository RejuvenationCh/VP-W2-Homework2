import 'package:flutter/material.dart';

import '../../models/media_item.dart';

class SizeBadge extends StatelessWidget {
  final int bytes;

  const SizeBadge({super.key, required this.bytes});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: colors.secondaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        formatSize(bytes),
        style: TextStyle(fontSize: 11, color: colors.onSecondaryContainer),
      ),
    );
  }
}
