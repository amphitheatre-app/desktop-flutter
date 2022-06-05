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

import 'package:amphitheatre/src/commands/play/cancel_play_command.dart';
import 'package:amphitheatre/src/commands/play/play_play_command.dart';
import 'package:amphitheatre/src/commands/play/refresh_play_command.dart';
import 'package:amphitheatre/src/commands/play/stop_play_command.dart';

import 'package:amphitheatre/src/components/placeholder.dart';
import 'package:amphitheatre/src/components/styled_list_view.dart';
import 'package:amphitheatre/src/components/widget_view.dart';

import 'package:amphitheatre/src/models/play_model.dart';
import 'package:amphitheatre/src/entities/play/play.dart';
import 'package:amphitheatre/src/entities/play/player.dart';

import '../components/cast.dart';
import '../components/heading.dart';
import '../screen.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    var play = context.select<PlayModel, Play?>((value) => value.selectedPlay);
    return ContentPlaceholder(
      hasContent: () => play != null,
      content: _OverviewView(this),
      placeholder: const Scaffold(
        body: Center(
          child: Text("No selected play"),
        ),
      ),
    );
  }

  void handlePlayPressed() async {
    var play = context.read<PlayModel>().selectedPlay;
    await PlayPlayCommand(context).execute(play!);
  }

  void handleStopPressed() async {
    var play = context.read<PlayModel>().selectedPlay;
    await StopPlayCommand(context).execute(play!);
  }

  void handleRefreshPressed() async {
    var play = context.read<PlayModel>().selectedPlay;
    await RefreshPlayCommand(context).execute(play!);
  }

  void handleCancelPressed() async {
    var play = context.read<PlayModel>().selectedPlay;
    await CancelPlayCommand(context).execute(play!);
  }

  void onPlayerSelected(Player player) {
    context.read<PlayModel>().selectedPlayer = player;
    context.read<PlayScreenState>().goto(PAGE.detail);
  }

  void onWhyFartherSelected(WhyFarther result) {
    //
  }
}

class _OverviewView extends WidgetView<Overview, _OverviewState> {
  const _OverviewView(_OverviewState state) : super(state);

  @override
  Widget build(BuildContext context) {
    var play = context.select<PlayModel, Play?>((value) => value.selectedPlay);

    return Scaffold(
      appBar: buildAppBar(context),
      body: StyledListView<Player>(
        items: play!.cast,
        itemBuilder: (player, index) {
          return CastFormView(
            player: player,
            onTap: () => state.onPlayerSelected(player),
          );
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    var play = context.select<PlayModel, Play?>((value) => value.selectedPlay);

    return AppBar(
      title: Heading(
        title: play!.title,
        status: play.status,
      ),
      centerTitle: false,
      actions: buildActions(),
      titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
      automaticallyImplyLeading: false,
      elevation: 0.0,
    );
  }

  List<Widget> buildActions() {
    return <Widget>[
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
