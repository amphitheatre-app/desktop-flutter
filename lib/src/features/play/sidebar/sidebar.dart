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

import 'package:amphitheatre/src/commands/play/create_play_command.dart';
import 'package:amphitheatre/src/commands/play/refresh_plays_command.dart';

import 'package:amphitheatre/src/components/avatar.dart';
import 'package:amphitheatre/src/components/empty.dart';
import 'package:amphitheatre/src/components/styled_list_view.dart';
import 'package:amphitheatre/src/components/widget_view.dart';
import 'package:amphitheatre/src/components/placeholder.dart';

import 'package:amphitheatre/src/models/play_model.dart';
import 'package:amphitheatre/src/entities/play/play.dart';

import '../screen.dart';


class Sidebar extends StatefulWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  State<Sidebar> createState() => SidebarState();
}

/// Handles all button handlers and business logic functions for the _PlayListSidebarView
/// Also contains any local view state.
class SidebarState extends State<Sidebar> {
  @override
  void initState() {
    super.initState();
    RefreshPlaysCommand(context).execute();
  }

  @override
  Widget build(BuildContext context) =>
      Provider.value(value: this, child: _SidebarView(this));

  void handleSubmitPressed(BuildContext context) async {
    await CreatePlayCommand(context).execute(context);
  }

  void onPlaySelected(Play play) {
    context.read<PlayModel>().selectedPlay = play;
    context.read<PlayScreenState>().goto(PAGE.overview);
  }
}

class _SidebarView extends WidgetView<Sidebar, SidebarState> {
  const _SidebarView(SidebarState state) : super(state);

  @override
  Widget build(BuildContext context) {
    var entries =
        context.select<PlayModel, List<Play>>((value) => value.entries);

    return Scaffold(
      appBar: buildAppBar(context),
      body: ContentPlaceholder(
        hasContent: () => entries.isNotEmpty,
        content: StyledListView<Play>(
          items: entries,
          itemBuilder: (play, _) {
            return ListTile(
              contentPadding: const EdgeInsets.all(8.0),
              leading: Avatar(text: play.title),
              title: Text(play.title),
              subtitle: Text(
                play.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => state.onPlaySelected(play),
            );
          },
        ),
        placeholder: Empty(
          title: "You don't have any environments",
          subtitle: "An environment is a set of variables that allows "
              "you to switch the context of your requests.",
          hasButton: true,
          buttonText: "Create Environment",
          onPressed: () => state.handleSubmitPressed(context),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text("Amphitheatre", style: TextStyle(fontSize: 16)),
      centerTitle: false,
      elevation: 0.0,
      actions: buildActions(context),
      titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  List<Widget> buildActions(BuildContext context) {
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
        onPressed: () => state.handleSubmitPressed(context),
      ),
    ];
  }
}
