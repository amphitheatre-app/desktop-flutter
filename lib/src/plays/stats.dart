import 'package:flutter/material.dart';

class StatsView extends StatefulWidget {
  const StatsView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StatsViewState();
}

class _StatsViewState extends State<StatsView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              buildStateTile("1.98%", "CPU USAGE", Theme.of(context).textTheme.headline3),
              const VerticalDivider(indent: 10),
              buildStateTile("65.8MB", "MEMORY USAGE", Theme.of(context).textTheme.headline3),
            ],
          ),
        ),
        const Divider(height: 0, indent: 10, endIndent: 10,),
        Expanded(
          child: Row(
            children: [
              buildStateTile("5.3MB / 43.7 MB", "DISK READ/WRITE", Theme.of(context).textTheme.headline4),
              const VerticalDivider(endIndent: 10),
              buildStateTile("5.7 kB / 3 kB", "NETWORK I/O", Theme.of(context).textTheme.headline4),
            ],
          ),
        )
      ],
    );
  }

  Widget buildStateTile(String title, String description, TextStyle? style) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(title, style: style),
          ),
          Text(description),
        ],
      ),
    );
  }
}
