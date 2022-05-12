import 'package:flutter/material.dart';

import '../views/list.dart';

class PlaysSidebar extends StatelessWidget {
  const PlaysSidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: PlaysListView(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Plays"),
      centerTitle: false,
      elevation: 0.6,
      //shadowColor: Colors.black,
      actions: buildActions(),
      titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  List<Widget> buildActions() {
    return <Widget>[
      IconButton(
        color: Colors.grey,
        icon: const Icon(Icons.filter_list),
        tooltip: "Filter",
        onPressed: () {
          // handle the press
        },
      ),
      IconButton(
        color: Colors.blue,
        icon: const Icon(Icons.add_circle_outlined),
        tooltip: "New",
        onPressed: () {
          // handle the press
        },
      ),
    ];
  }
}
