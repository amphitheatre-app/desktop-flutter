// Copyright 2022 The Amphitheatre Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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
