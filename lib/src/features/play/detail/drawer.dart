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

import 'package:amphitheatre/src/components/styled_list_view.dart';

import 'package:amphitheatre/src/models/play_model.dart';
import 'package:amphitheatre/src/entities/play/player.dart';

import '../components/heading.dart';
import '../components/cast.dart';
import 'detail.dart';

class CastDrawer extends StatelessWidget {
  const CastDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var play = context.select((PlayModel value) => value.selectedPlay);
    var player = context.select((PlayModel value) => value.selectedPlayer);

    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Heading(
            icon: Icons.menu,
            title: player!.title,
            status: player.status,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: false,
          elevation: 0.0,
        ),
        body: StyledListView<Player>(
          items: play!.cast,
          itemBuilder: (player, index) {
            return CastListTile(
                player: player,
                onTap: () {
                  context.read<DetailState>().onPlayerSelected(player);
                  Navigator.pop(context);
                });
          },
        ),
      ),
    );
  }
}
