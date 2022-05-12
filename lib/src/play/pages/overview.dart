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

import '../views/cast.dart';
import '../views/environments.dart';
import '../views/list.dart';
import '../views/logs.dart';
import '../views/resources.dart';
import '../views/stats.dart';
import '../views/settings.dart';

class PlaysOverview extends StatefulWidget {
  const PlaysOverview({Key? key}) : super(key: key);

  @override
  State<PlaysOverview> createState() => _PlaysOverviewState();
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class _PlaysOverviewState extends State<PlaysOverview>
    with SingleTickerProviderStateMixin {
  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Cast'),
    Tab(text: 'Logs'),
    Tab(text: 'Resources'),
    Tab(text: 'Environment'),
    Tab(text: 'Stats'),
    Tab(text: 'Settings'),
  ];

  late TabController tabController;
  late WhyFarther _selection;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        vsync: this, length: tabs.length, animationDuration: Duration.zero);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildPlaysSidebar(),
        const VerticalDivider(thickness: 1, width: 1),
        buildPlayDetail()
      ],
    );
  }

  Widget buildPlaysSidebar() {
    return SizedBox(
      width: 280,
      child: Column(
        children: [
          AppBar(
            title: const Text("Plays"),
            centerTitle: false,
            elevation: 0.6,
            //shadowColor: Colors.black,
            actions: [
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
            ],
            titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: PlaysListView(),
          ),
        ],
      ),
    );
  }

  Widget buildPlayDetail() {
    return Expanded(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppBar(
              elevation: 0.0,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Clean code linters"),
                  Text("Running",
                      style: Theme.of(context)
                          .textTheme
                          .overline!
                          .copyWith(color: Colors.green)),
                ],
              ),
              centerTitle: false,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.terminal_outlined, color: Colors.blue),
                  tooltip: 'Terminal',
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.play_circle_outlined,
                      color: Colors.blue),
                  tooltip: 'Play',
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.stop_circle_outlined,
                      color: Colors.blue),
                  tooltip: 'Stop',
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.refresh_outlined, color: Colors.blue),
                  tooltip: 'Refresh',
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.cancel_outlined, color: Colors.blue),
                  tooltip: 'Cancel',
                  onPressed: () {},
                ),
                PopupMenuButton<WhyFarther>(
                  icon: Icon(Icons.adaptive.more, color: Colors.blue),
                  onSelected: (WhyFarther result) {
                    setState(() {
                      _selection = result;
                    });
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<WhyFarther>>[
                    const PopupMenuItem<WhyFarther>(
                      value: WhyFarther.harder,
                      child: Text('Working a lot harder'),
                    ),
                    const PopupMenuItem<WhyFarther>(
                      value: WhyFarther.smarter,
                      child: Text('Being a lot smarter'),
                    ),
                    const PopupMenuItem<WhyFarther>(
                      value: WhyFarther.selfStarter,
                      child: Text('Being a self-starter'),
                    ),
                    const PopupMenuItem<WhyFarther>(
                      value: WhyFarther.tradingCharter,
                      child: Text('Placed in charge of trading charter'),
                    ),
                  ],
                )
              ],
              titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TabBar(controller: tabController, tabs: tabs, isScrollable: false),
            Expanded(
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: const <Widget>[
                    CastView(),
                    LogsView(),
                    ResourcesView(),
                    EnvironmentsView(),
                    StatsView(),
                    SettingsView()
                  ]),
            )
          ]),
    );
  }
}
