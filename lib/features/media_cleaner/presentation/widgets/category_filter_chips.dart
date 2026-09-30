import 'package:flutter/material.dart';

import '../../models/media_item.dart';

class CategoryFilterChips extends StatelessWidget {
  final MediaCategory? selected;
  final ValueChanged<MediaCategory?> onSelected;

  const CategoryFilterChips({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> chips = [
      ChoiceChip(
        label: Text('All'),
        selected: selected == null,
        onSelected: (_) => onSelected(null),
      ),
    ];
    // one chip for every category
    for (final c in MediaCategory.values) {
      chips.add(ChoiceChip(
        label: Text(categoryLabel(c)),
        selected: selected == c,
        onSelected: (_) => onSelected(c),
      ));
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(spacing: 8, children: chips),
    );
  }
}
