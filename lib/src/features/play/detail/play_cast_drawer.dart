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

import 'package:amphitheatre/src/components/title_toggle_button.dart';
import 'package:amphitheatre/src/entities/play/player.dart';

import 'play_cast_view.dart';

class PlayCastDrawer extends StatelessWidget {
  final List<Player> cast;

  const PlayCastDrawer({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var player =
        context.select<PlayModel, Player?>((value) => value.selectedPlayer);
    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: TitleToggleButton(
              title: player!.title,
              subtitle: player.status,
              onPressed: () {
                Navigator.pop(context);
              }),
          centerTitle: false,
          elevation: 0.0,
        ),
        body: PlayCastListView(cast: cast),
      ),
    );
  }
}
