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


import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:colorize_text_avatar/colorize_text_avatar.dart';

import '../models/play.dart';

class PlayListView extends StatelessWidget {
  final List<Play> plays;

  const PlayListView({Key? key, required this.plays}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        itemCount: plays.length,
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 1),
        itemBuilder: (BuildContext context, int index) {
          return ListItemView(play: plays[index]);
        });
  }
}

class ListItemView extends StatelessWidget {
  const ListItemView({Key? key, required this.play}) : super(key: key);

  final Play play;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        leading: TextAvatar(
          shape: Shape.Circular,
          size: 32,
          numberLetters: 2,
          upperCase: true,
          text: play.title,
          backgroundColor: Colors.blueGrey,
        ),
        title: Text(play.title),
        subtitle: Text(play.description,
            maxLines: 3, overflow: TextOverflow.ellipsis),
        onTap: () {
          context.router.pushNamed('/plays/1');
        });
  }
}
