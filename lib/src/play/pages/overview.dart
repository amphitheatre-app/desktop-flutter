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

import '../views/cast/cast_form_views.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class PlaysOverview extends StatelessWidget {
  const PlaysOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const CastFormItemsView()
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: buildTitle(context),
      centerTitle: false,
      actions: buildActions(),
      titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
      automaticallyImplyLeading: false,
      elevation: 0.0,
    );
  }

  Column buildTitle(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Clean code linters"),
        Text("Running",
            style: Theme.of(context)
                .textTheme
                .overline!
                .copyWith(color: Colors.green)),
      ],
    );
  }

  List<Widget> buildActions() {
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.play_circle_outlined, color: Colors.blue),
        tooltip: 'Play',
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.stop_circle_outlined, color: Colors.blue),
        tooltip: 'Stop',
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.refresh_outlined, color: Colors.blue),
        tooltip: 'Refresh',
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.cancel_outlined, color: Colors.blue),
        tooltip: 'Cancel',
        onPressed: () {},
      ),
      buildPopupMenuButton()
    ];
  }

  PopupMenuButton<WhyFarther> buildPopupMenuButton() {
    return PopupMenuButton<WhyFarther>(
      icon: Icon(Icons.adaptive.more, color: Colors.blue),
      onSelected: (WhyFarther result) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.harder,
          child: Text('Working a lot harder'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.smarter,
          child: Text('Being a lot smarter'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.selfStarter,
          child: Text('Being a self-starter'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.tradingCharter,
          child: Text('Placed in charge of trading charter'),
        ),
      ],
    );
  }
}
