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

import 'package:amphitheatre/src/command/commands.dart';
import 'package:amphitheatre/src/internal/components/widget_view.dart';
import 'package:amphitheatre/src/play/models/play.dart';

import '../views/logs.dart';
import '../views/inspect.dart';
import '../views/stats.dart';
import '../views/title_toggle_button.dart';

import 'cast.dart';

class PlayDetailPage extends StatefulWidget {
  static GlobalKey<ScaffoldState> scaffoldStateKey = GlobalKey();

  final Play play;

  const PlayDetailPage({Key? key, required this.play}) : super(key: key);

  @override
  State<PlayDetailPage> createState() => _PlayDetailPageState();
}

class _PlayDetailPageState extends State<PlayDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late WhyFarther _selection; // Create a key

  List<Tab> tabs = const <Tab>[
    Tab(text: 'Logs'),
    Tab(text: 'Inspect'),
    Tab(text: 'Stats'),
  ];

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

  void openMenu() => PlayDetailPage.scaffoldStateKey.currentState?.openDrawer();

  @override
  Widget build(BuildContext context) => _PlayDetailPageView(this);

  void handleTerminalPressed() async {
    await OpenTerminalCommand(context).execute(widget.play);
  }

  void handlePlayPressed() async {
    await PlayPlayCommand(context).execute(widget.play);
  }

  void handleStopPressed() async {
    await StopPlayCommand(context).execute(widget.play);
  }

  void handleRefreshPressed() async {
    await RefreshPlayCommand(context).execute(widget.play);
  }

  void handleCancelPressed() async {
    await CancelPlayCommand(context).execute(widget.play);
  }

  void onWhyFartherSelected(WhyFarther result) {
    setState(() {
      _selection = result;
    });
  }
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class _PlayDetailPageView
    extends WidgetView<PlayDetailPage, _PlayDetailPageState> {
  const _PlayDetailPageView(_PlayDetailPageState state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: PlayDetailPage.scaffoldStateKey,
      appBar: buildAppBar(context),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TabBar(
                controller: state.tabController,
                tabs: state.tabs,
                isScrollable: false),
            Expanded(
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: state.tabController,
                  children: const <Widget>[
                    LogsView(),
                    InspectView(),
                    StatsView(),
                  ]),
            )
          ]),
      drawer: const PlayCastDrawer(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: TitleToggleButton(onPressed: state.openMenu),
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
        onPressed: state.handleTerminalPressed,
      ),
      IconButton(
        icon: const Icon(Icons.play_circle_outlined, color: Colors.blue),
        tooltip: 'Play',
        onPressed: state.handlePlayPressed,
      ),
      IconButton(
        icon: const Icon(Icons.stop_circle_outlined, color: Colors.blue),
        tooltip: 'Stop',
        onPressed: state.handleStopPressed,
      ),
      IconButton(
        icon: const Icon(Icons.refresh_outlined, color: Colors.blue),
        tooltip: 'Refresh',
        onPressed: state.handleRefreshPressed,
      ),
      IconButton(
        icon: const Icon(Icons.cancel_outlined, color: Colors.blue),
        tooltip: 'Cancel',
        onPressed: state.handleCancelPressed,
      ),
      buildPopupMenuButton()
    ];
  }

  PopupMenuButton<WhyFarther> buildPopupMenuButton() {
    return PopupMenuButton<WhyFarther>(
      icon: Icon(Icons.adaptive.more, color: Colors.blue),
      onSelected: (WhyFarther result) => state.onWhyFartherSelected(result),
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
