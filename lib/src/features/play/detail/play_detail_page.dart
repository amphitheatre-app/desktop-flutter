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

import 'package:amphitheatre/src/models/play_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';

import 'package:amphitheatre/src/entities/play/player.dart';
import 'package:amphitheatre/src/entities/play/play.dart';
import 'package:amphitheatre/src/commands/commands.dart';
import 'package:amphitheatre/src/components/title_toggle_button.dart';
import 'package:amphitheatre/src/components/widget_view.dart';

import 'play_logs_view.dart';
import 'play_inspect_view.dart';
import 'play_stats_view.dart';
import 'play_cast_drawer.dart';

class PlayDetailPage extends StatefulWidget {
  static GlobalKey<ScaffoldState> scaffoldStateKey = GlobalKey();
  const PlayDetailPage({Key? key}) : super(key: key);

  @override
  State<PlayDetailPage> createState() => PlayDetailPageState();
}

class PlayDetailPageState extends State<PlayDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late WhyFarther _selection;

  late PlayModel playModel;
  late Play? play;
  late Player? player;

  List<Tab> tabs = const <Tab>[
    Tab(text: 'Logs'),
    Tab(text: 'Inspect'),
    Tab(text: 'Stats'),
  ];

  @override
  void initState() {
    tabController = TabController(
        vsync: this, length: tabs.length, animationDuration: Duration.zero);

    playModel = context.read();
    play = playModel.selectedPlay;
    player = playModel.selectedPlayer;

    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(value: this, child: _PlayDetailPageView(this));
  }

  void openMenu() => PlayDetailPage.scaffoldStateKey.currentState?.openDrawer();

  void handleTerminalPressed() async {
    await OpenTerminalCommand(context).execute(play!);
  }

  void handlePlayPressed() async {
    await PlayPlayCommand(context).execute(play!);
  }

  void handleStopPressed() async {
    await StopPlayCommand(context).execute(play!);
  }

  void handleRefreshPressed() async {
    await RefreshPlayCommand(context).execute(play!);
  }

  void handleCancelPressed() async {
    await CancelPlayCommand(context).execute(play!);
  }

  void onWhyFartherSelected(WhyFarther result) {
    setState(() {
      _selection = result;
    });
  }

  void trySetSelectedPlayer(Player player) {
    playModel.selectedPlayer = player;
    context.router.pushNamed('/plays/detail');
  }
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class _PlayDetailPageView
    extends WidgetView<PlayDetailPage, PlayDetailPageState> {
  const _PlayDetailPageView(PlayDetailPageState state) : super(state);

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
                    PlayLogsView(),
                    PlayInspectView(),
                    PlayStatsView(),
                  ]),
            )
          ]),
      drawer: PlayCastDrawer(cast: state.play!.cast),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    var player =
        context.select<PlayModel, Player?>((value) => value.selectedPlayer);
    return AppBar(
      elevation: 0.0,
      title: TitleToggleButton(
          title: player!.title,
          subtitle: player.status,
          onPressed: state.openMenu),
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
