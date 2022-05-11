import 'package:flutter/material.dart';

class LogsView extends StatefulWidget {
  const LogsView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LogsViewState();
}

class _LogsViewState extends State<LogsView>{
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Logs"));
  }
}