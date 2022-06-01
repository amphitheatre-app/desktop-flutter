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

import 'package:amphitheatre/src/entities/play/cast.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';

class PlayCastListView extends StatefulWidget {
  final List<Cast> cast;
  const PlayCastListView({Key? key, required this.cast}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlayCastListViewState();
}

class _PlayCastListViewState extends State<PlayCastListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: widget.cast.length,
        scrollDirection: Axis.vertical,
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 1),
        itemBuilder: (BuildContext context, int index) {
          return PlayCastListItemView(cast: testCastData[index]);
        });
  }
}

class PlayCastListItemView extends StatelessWidget {
  const PlayCastListItemView({Key? key, required this.cast}) : super(key: key);

  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8.0),
      leading: TextAvatar(
        shape: Shape.Circular,
        size: 32,
        numberLetters: 2,
        upperCase: true,
        text: cast.title,
        backgroundColor: Colors.blueGrey,
      ),
      title: Text(cast.title),
      trailing: Text(cast.status,
          style: Theme.of(context)
              .textTheme
              .overline!
              .copyWith(color: Colors.green)),
      onTap: () {
        context.router.pushNamed('/plays/1/1');
      },
    );
  }
}
