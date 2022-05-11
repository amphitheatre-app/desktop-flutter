import 'package:flutter/material.dart';

class StatsView extends StatefulWidget {
  const StatsView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StatsViewState();
}

class _StatsViewState extends State<StatsView>{
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Stats"));
  }
}