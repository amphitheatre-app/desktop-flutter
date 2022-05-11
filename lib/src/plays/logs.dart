import 'package:flutter/material.dart';

class LogsView extends StatefulWidget {
  const LogsView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LogsViewState();
}

class _LogsViewState extends State<LogsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(itemCount: 100, itemBuilder: itemBuilder),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return const Text(
      "2022-05-11 14:37:31 21526 [Warning] Access denied for user 'root'@'127.0.0.1' (using password: NO)",
      style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.4),
      softWrap: true,
    );
  }
}
