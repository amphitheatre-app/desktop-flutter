import 'package:flutter/material.dart';

class ResourcesView extends StatefulWidget {
  const ResourcesView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ResourcesViewState();
}

class _ResourcesViewState extends State<ResourcesView>{
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Resources"));
  }
}