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

import 'package:empty_widget/empty_widget.dart';

import '../views/list.dart';
import '../models/play.dart';

class PlayListSidebar extends StatelessWidget {
  PlayListSidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = <Play>[];

    return Scaffold(
      appBar: buildAppBar(context),
      body: data.isNotEmpty
          ? PlayListView(plays: data)
          : buildEmptyWidget(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text("Amphitheatre"),
      centerTitle: false,
      elevation: 0.0,
      //shadowColor: Colors.black,
      actions: buildActions(context),
      titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        color: Colors.grey,
        icon: const Icon(Icons.filter_list),
        tooltip: "Filter",
        onPressed: () {
          // handle the press
        },
      ),
      IconButton(
        color: Colors.blue,
        icon: const Icon(Icons.add_circle_outlined),
        tooltip: "New",
        onPressed: () {
          showCreateDialog(context);
        },
      ),
    ];
  }

  Future<dynamic> showCreateDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Modal(title: "New play", body: buildForm(), actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: const Text('Submit'),
            )
          ]);
        });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget buildForm() {
    return Form(
      key: _formKey,
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

  Widget buildEmptyWidget(BuildContext context) {
    return Column(
      children: [
        EmptyWidget(
          image: null,
          packageImage: PackageImage.Image_1,
          title: "You don't have any environments",
          subTitle:
              "An environment is a set of variables that allows you to switch the context of your requests.",
          titleTextStyle: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          subtitleTextStyle: const TextStyle(
            fontSize: 12,
            color: Colors.white54,
          ),
          hideBackgroundAnimation: true,
        ),
        TextButton(
            onPressed: () {
              showCreateDialog(context);
            },
            child: const Text("Create Environment"))
      ],
    );
  }
}

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
