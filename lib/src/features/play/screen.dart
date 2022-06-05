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
import 'package:provider/provider.dart';

import 'detail/detail.dart';
import 'detail/overview.dart';
import 'sidebar/sidebar.dart';


enum PAGE { overview, detail }

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  static const String uri = "/plays";

  @override
  State<StatefulWidget> createState() => PlayScreenState();
}

class PlayScreenState extends State<PlayScreen> {
  PageController pageController = PageController();

  void goto(PAGE page) {
    pageController.jumpToPage(page.index);
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: this,
      child: Expanded(
        child: Row(
          children: <Widget>[
            const SizedBox(child: Sidebar(), width: 280),
            const VerticalDivider(width: 1),
            Expanded(
              child: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  Overview(),
                  Detail(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
