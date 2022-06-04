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

import 'package:amphitheatre/src/entities/play/player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';

import 'package:amphitheatre/src/commands/commands.dart';
import 'package:amphitheatre/src/components/dialogs/modal.dart';
import 'package:amphitheatre/src/components/widget_view.dart';

import 'package:amphitheatre/src/models/play_model.dart';
import 'package:amphitheatre/src/entities/play/play.dart';
import 'package:empty_widget/empty_widget.dart';
import '../compose/play_submit_form_view.dart';
import 'play_list_view.dart';

class PlayListSidebar extends StatefulWidget {
  static GlobalKey<FormState> formStateKey = GlobalKey<FormState>();

  const PlayListSidebar({Key? key}) : super(key: key);

  @override
  State<PlayListSidebar> createState() => PlayListSidebarState();
}

/// Handles all button handlers and business logic functions for the _PlayListSidebarView
/// Also contains any local view state.
class PlayListSidebarState extends State<PlayListSidebar> {
  @override
  void initState() {
    super.initState();
    RefreshPlaysCommand(context).execute();
  }

  @override
  Widget build(BuildContext context) =>
      Provider.value(value: this, child: _PlayListSidebarView(this));

  void handleSubmitPressed() async {
    await CreatePlayCommand(context).execute();
  }

  Future<dynamic> showCreateDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Modal(
              title: "New play",
              body: const PlaySubmitFormView(),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (PlayListSidebar.formStateKey.currentState!.validate()) {
                      // Process data.
                    }
                  },
                  child: const Text('Submit'),
                )
              ]);
        });
  }

  void trySetSelectedPlay(Play play) {
    context.read<PlayModel>().selectedPlay = play;
    context.router.pushNamed('/plays/overview');
  }
}

class _PlayListSidebarView
    extends WidgetView<PlayListSidebar, PlayListSidebarState> {
  const _PlayListSidebarView(PlayListSidebarState state) : super(state);

  @override
  Widget build(BuildContext context) {
    var entries =
        context.select<PlayModel, List<Play>>((value) => value.entries);

    return Scaffold(
      appBar: buildAppBar(context),
      body: entries.isNotEmpty
          ? PlayListView(plays: entries)
          : buildEmptyWidget(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text("Amphitheatre"),
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
        onPressed: () {
          state.showCreateDialog(context);
        },
      ),
    ];
  }

  Widget buildEmptyWidget(BuildContext context) {
    return Column(
      children: [
        EmptyWidget(
          image: null,
          packageImage: PackageImage.Image_1,
          title: "You don't have any environments",
          subTitle:
              "An environment is a set of variables that allows you to switch the context of your requests.",
          titleTextStyle: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          subtitleTextStyle: const TextStyle(
            fontSize: 12,
            color: Colors.white54,
          ),
          hideBackgroundAnimation: true,
        ),
        TextButton(
            onPressed: () {
              state.showCreateDialog(context);
            },
            child: const Text("Create Environment"))
      ],
    );
  }
}
