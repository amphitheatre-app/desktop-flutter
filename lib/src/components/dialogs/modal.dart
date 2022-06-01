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

class Modal extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;

  const Modal({
    Key? key,
    required this.title,
    required this.body,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
          child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).dialogBackgroundColor,
              ),
              constraints: const BoxConstraints(
                  minWidth: 300, maxWidth: 600, minHeight: 200, maxHeight: 400),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(children: [
                    Expanded(child: Text(title, maxLines: 1)),
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.close,
                          size: 16,
                        ))
                  ]),
                  Expanded(child: SingleChildScrollView(child: body)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: actions != null ? actions! : [],
                  )
                ],
              ))),
    );
  }
}
