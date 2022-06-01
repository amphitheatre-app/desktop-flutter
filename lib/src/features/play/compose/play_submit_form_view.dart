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
import '../list/play_list_sidebar.dart';

class PlaySubmitFormView extends StatelessWidget {
  const PlaySubmitFormView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: PlayListSidebar.formStateKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text("Title"),
          ),
          TextFormField(
            decoration: const InputDecoration(
                hintText: 'Play title',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(8)),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text("Description"),
          ),
          TextFormField(
            maxLines: 3,
            decoration: const InputDecoration(
                hintText: 'Add description...',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(8)),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text("Repository"),
          ),
          TextFormField(
            decoration: const InputDecoration(
                hintText: 'An SSH URL, like git@github.com:user/repo.git',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(8)),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          )
        ],
      ),
    );
  }
}
