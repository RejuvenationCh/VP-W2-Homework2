import 'package:flutter/material.dart';

import '../../models/media_item.dart';
import 'size_badge.dart';

class StorageSummaryHeader extends StatelessWidget {
  final int usedBytes;
  final int totalBytes;
  final int mediaBytes;

  const StorageSummaryHeader({
    super.key,
    required this.usedBytes,
    required this.totalBytes,
    required this.mediaBytes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${formatSize(usedBytes)} of ${formatSize(totalBytes)} used',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 8),
          LinearProgressIndicator(value: usedBytes / totalBytes),
          SizedBox(height: 8),
          Row(children: [Text('Media: '), SizeBadge(bytes: mediaBytes)]),
        ],
      ),
    );
  }
}
