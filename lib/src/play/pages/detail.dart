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

import '../views/environments.dart';
import '../views/logs.dart';
import '../views/resources.dart';
import '../views/stats.dart';
import '../views/settings.dart';
import '../views/title_toggle_button.dart';

import 'cast.dart';

class PlayDetail extends StatefulWidget {
  const PlayDetail({Key? key}) : super(key: key);

  @override
  State<PlayDetail> createState() => _PlayDetailState();
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class _PlayDetailState extends State<PlayDetail>
    with SingleTickerProviderStateMixin {
  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Logs'),
    Tab(text: 'Resources'),
    Tab(text: 'Environment'),
    Tab(text: 'Stats'),
    Tab(text: 'Settings'),
  ];

  late TabController tabController;
  late WhyFarther _selection;

  final GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey(); // Create a key

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
    return Scaffold(
      key: _scaffoldStateKey,
      appBar: buildAppBar(context),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TabBar(controller: tabController, tabs: tabs, isScrollable: false),
            Expanded(
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: const <Widget>[
                    LogsView(),
                    ResourcesView(),
                    EnvironmentsView(),
                    StatsView(),
                    SettingsView()
                  ]),
            )
          ]),
          drawer: const PlayCastDrawer(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: TitleToggleButton(onPressed: () {
         _scaffoldStateKey.currentState!.openDrawer();
      }),
      centerTitle: false,
      actions: buildActions(),
      titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
      automaticallyImplyLeading: false,
    );
  }

  List<Widget> buildActions() {
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.terminal_outlined, color: Colors.blue),
        tooltip: 'Terminal',
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.play_circle_outlined, color: Colors.blue),
        tooltip: 'Play',
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.stop_circle_outlined, color: Colors.blue),
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
      buildPopupMenuButton()
    ];
  }

  PopupMenuButton<WhyFarther> buildPopupMenuButton() {
    return PopupMenuButton<WhyFarther>(
      icon: Icon(Icons.adaptive.more, color: Colors.blue),
      onSelected: (WhyFarther result) {
        setState(() {
          _selection = result;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
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
    );
  }
}
