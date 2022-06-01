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

import 'package:auto_route/auto_route.dart';
import 'package:amphitheatre/src/entities/play/cast.dart';

import 'play_cast_form_item_view.dart';

class PlayCastFormView extends StatefulWidget {
  final List<Cast> cast;
  const PlayCastFormView({Key? key, required this.cast}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlayCastFormViewState();
}

class _PlayCastFormViewState extends State<PlayCastFormView> {
  void onItemTaped(BuildContext context, Cast cast) {
    context.router.pushNamed('/plays/1/1');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: widget.cast.length,
        padding: const EdgeInsets.all(8),
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 1),
        itemBuilder: (BuildContext context, int index) {
          Cast cast = widget.cast[index];
          return InkWell(
            child: PlayCastFormItemView(cast: cast),
            onTap: () => onItemTaped(context, cast),
          );
        });
  }
}
