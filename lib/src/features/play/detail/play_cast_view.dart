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

import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:amphitheatre/src/components/widget_view.dart';
import 'package:amphitheatre/src/entities/play/player.dart';

import 'play_detail_page.dart';

class PlayCastListView extends StatefulWidget {
  final List<Player> cast;
  const PlayCastListView({Key? key, required this.cast}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlayCastListViewState();
}

class _PlayCastListViewState extends State<PlayCastListView> {
  void _handleItemTaped(BuildContext context, Player player) {
    context.read<PlayDetailPageState>().trySetSelectedPlayer(player);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: widget.cast.length,
        scrollDirection: Axis.vertical,
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 1),
        itemBuilder: (BuildContext context, int index) {
          return PlayCastListItemView(this, player: widget.cast[index]);
        });
  }
}

class PlayCastListItemView
    extends WidgetView<PlayCastListView, _PlayCastListViewState> {
  // ignore: use_key_in_widget_constructors
  const PlayCastListItemView(_PlayCastListViewState state, {required this.player})
      : super(state);

  final Player player;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8.0),
      leading: TextAvatar(
        shape: Shape.Circular,
        size: 32,
        numberLetters: 2,
        upperCase: true,
        text: player.title,
        backgroundColor: Colors.blueGrey,
      ),
      title: Text(player.title),
      trailing: Text(player.status,
          style: Theme.of(context)
              .textTheme
              .overline!
              .copyWith(color: Colors.green)),
      onTap: () => state._handleItemTaped(context, player),
    );
  }
}
