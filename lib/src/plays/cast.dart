import 'package:flutter/material.dart';

class CastView extends StatefulWidget {
  const CastView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CastViewState();
}

class _CastViewState extends State<CastView>{
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Cast"));
  }
}