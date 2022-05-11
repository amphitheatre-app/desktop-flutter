import 'package:flutter/material.dart';

class EnvironmentsView extends StatefulWidget {
  const EnvironmentsView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EnvironmentsViewState();
}

class _EnvironmentsViewState extends State<EnvironmentsView>{
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Environments"));
  }
}