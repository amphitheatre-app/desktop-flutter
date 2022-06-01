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
import 'package:google_fonts/google_fonts.dart';

class PlayLogsView extends StatefulWidget {
  const PlayLogsView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlayLogsViewState();
}

final List<String> logs = <String>[
  "[2022-05-12 06:05:38.283] [info] { level: 'info', from: 'AssetCache', type: 'checkingForAppUpdate' }",
  "[2022-05-12 06:05:39.162] [info] Websocket listening on 64655...",
  "[2022-05-12 06:05:39.169] [info] Set up server listeners with auth (5ef784b2a1c5c1d4eb37e5ca1a4bf77df78b56bc)...",
  "[2022-05-13 05:24:48.874] [info] Responding to SIGTERM and shutting down...",
  "[2022-05-27 21:53:31.400] [info] { level: 'info', from: 'AssetCache', type: 'checkingForAppUpdate' }",
  "[2022-05-27 21:53:32.062] [info] Websocket listening on 58745...",
  "[2022-05-27 21:53:32.064] [info] Set up server listeners with auth (da0f93b71527e09b129a5afda2f2abc063674913)...",
  "[2022-05-27 23:47:03.698] [info] Responding to SIGTERM and shutting down...",
  "[2022-05-12 06:05:38.283] [info] { level: 'info', from: 'AssetCache', type: 'checkingForAppUpdate' }",
  "[2022-05-12 06:05:39.162] [info] Websocket listening on 64655...",
  "[2022-05-12 06:05:39.169] [info] Set up server listeners with auth (5ef784b2a1c5c1d4eb37e5ca1a4bf77df78b56bc)...",
  "[2022-05-13 05:24:48.874] [info] Responding to SIGTERM and shutting down...",
  "[2022-05-27 21:53:31.400] [info] { level: 'info', from: 'AssetCache', type: 'checkingForAppUpdate' }",
  "[2022-05-27 21:53:32.062] [info] Websocket listening on 58745...",
  "[2022-05-27 21:53:32.064] [info] Set up server listeners with auth (da0f93b71527e09b129a5afda2f2abc063674913)...",
  "[2022-05-27 23:47:03.698] [info] Responding to SIGTERM and shutting down...",
  "[2022-05-12 06:05:38.283] [info] { level: 'info', from: 'AssetCache', type: 'checkingForAppUpdate' }",
  "[2022-05-12 06:05:39.162] [info] Websocket listening on 64655...",
  "[2022-05-12 06:05:39.169] [info] Set up server listeners with auth (5ef784b2a1c5c1d4eb37e5ca1a4bf77df78b56bc)...",
  "[2022-05-13 05:24:48.874] [info] Responding to SIGTERM and shutting down...",
  "[2022-05-27 21:53:31.400] [info] { level: 'info', from: 'AssetCache', type: 'checkingForAppUpdate' }",
  "[2022-05-27 21:53:32.062] [info] Websocket listening on 58745...",
  "[2022-05-27 21:53:32.064] [info] Set up server listeners with auth (da0f93b71527e09b129a5afda2f2abc063674913)...",
  "[2022-05-27 23:47:03.698] [info] Responding to SIGTERM and shutting down...",
];

class _PlayLogsViewState extends State<PlayLogsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      padding: const EdgeInsets.all(8.0),
      child: ListView(children: logs.map(((e) => text(e))).toList()),
    );
  }

  Widget text(String text) {
    return Text(
      text,
      style: GoogleFonts.courierPrime(
          color: Colors.white70, fontSize: 13, height: 1.4),
      softWrap: true,
    );
  }
}
