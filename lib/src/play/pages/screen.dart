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

import 'detail.dart';
import 'list.dart';
//import 'overview.dart';

class PlaysScreen extends StatefulWidget {
  const PlaysScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlaysScreenState();
}

class _PlaysScreenState extends State<PlaysScreen> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          SizedBox(child: PlayListSidebar(), width: 280),
          const VerticalDivider(width: 1),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: pageItemBuilder)
            )
        ],
      ),
    );
  }

  Widget pageItemBuilder(BuildContext context, int index) {
    //return const PlaysOverview();
    return const PlayDetail();
  }
}
