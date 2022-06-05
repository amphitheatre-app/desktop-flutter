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

import 'package:amphitheatre/src/components/avatar.dart';
import 'package:amphitheatre/src/entities/play/player.dart';
import 'package:flutter/material.dart';

class CastListTile extends StatelessWidget {
  final Player player;
  final GestureTapCallback? onTap;

  const CastListTile({Key? key, required this.player, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8.0),
      leading: Avatar(text: player.title),
      title: Text(player.title),
      trailing: Text(player.status,
          style: Theme.of(context)
              .textTheme
              .overline!
              .copyWith(color: Colors.green)),
      onTap: onTap,
    );
  }
}

class CastFormView extends StatelessWidget {
  final Player player;
  final GestureTapCallback? onTap;

  const CastFormView({Key? key, required this.player, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Avatar(text: player.title),
          ),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(player.title,
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  Text(player.description,
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
                  child:
                      Text("03687956d", style: TextStyle(color: Colors.grey)),
                )
              ],
            ),
          )
        ]),
      ),
      onTap: onTap,
    );
  }
}
