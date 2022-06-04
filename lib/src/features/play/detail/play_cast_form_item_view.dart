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
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:amphitheatre/src/entities/play/player.dart';

class PlayCastFormItemView extends StatelessWidget {
  const PlayCastFormItemView({Key? key, required this.cast}) : super(key: key);

  final Player cast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextAvatar(
            shape: Shape.Circular,
            size: 48,
            numberLetters: 2,
            upperCase: true,
            text: cast.title,
          ),
        ),
        Expanded(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(cast.title,
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                Text(cast.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey))
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    onPressed: () => {}, child: const Text("Versions")),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("03687956d", style: TextStyle(color: Colors.grey)),
              )
            ],
          ),
        )
      ]),
    );
  }
}
