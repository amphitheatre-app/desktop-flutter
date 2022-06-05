import 'package:flutter/material.dart';

class StyledListView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T item, int index) itemBuilder;

  const StyledListView({
    Key? key,
    required this.items,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        return itemBuilder(items[index], index);
      },
    );
  }
}
