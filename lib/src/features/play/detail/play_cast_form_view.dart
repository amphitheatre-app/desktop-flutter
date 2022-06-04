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

import 'play_cast_form_item_view.dart';

class PlayCastFormView extends StatefulWidget {
  final List<Player> cast;
  const PlayCastFormView({Key? key, required this.cast}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlayCastFormViewState();
}

class _PlayCastFormViewState extends State<PlayCastFormView> {
  void handleItemTaped(BuildContext context, Player player) {
    context.read<PlayModel>().selectedPlayer = player;
    context.router.pushNamed('/plays/detail');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: widget.cast.length,
        padding: const EdgeInsets.all(8),
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 1),
        itemBuilder: (BuildContext context, int index) {
          Player player = widget.cast[index];
          return InkWell(
            child: PlayCastFormItemView(cast: player),
            onTap: () => handleItemTaped(context, player),
          );
        });
  }
}
