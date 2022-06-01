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

class PlayStatsView extends StatefulWidget {
  const PlayStatsView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlayStatsViewState();
}

class _PlayStatsViewState extends State<PlayStatsView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              buildStateTile(
                  "1.98%", "CPU USAGE", Theme.of(context).textTheme.headline3),
              const VerticalDivider(indent: 10),
              buildStateTile("65.8MB", "MEMORY USAGE",
                  Theme.of(context).textTheme.headline3),
            ],
          ),
        ),
        const Divider(
          height: 0,
          indent: 10,
          endIndent: 10,
        ),
        Expanded(
          child: Row(
            children: [
              buildStateTile("5.3MB / 43.7 MB", "DISK READ/WRITE",
                  Theme.of(context).textTheme.headline4),
              const VerticalDivider(endIndent: 10),
              buildStateTile("5.7 kB / 3 kB", "NETWORK I/O",
                  Theme.of(context).textTheme.headline4),
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
