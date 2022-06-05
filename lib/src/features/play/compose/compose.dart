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

import 'package:amphitheatre/src/components/dialogs/modal.dart';

class Compose extends StatefulWidget {
  const Compose({Key? key}) : super(key: key);

  @override
  State<Compose> createState() => _ComposeState();
}

class _ComposeState extends State<Compose> {
  static GlobalKey<FormState> formStateKey = GlobalKey();

  void handleFormSubmitted() {
    if (formStateKey.currentState!.validate()) {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    return Modal(
      title: "New play",
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            FormGroup(
                label: 'Title',
                placeholder: 'Play Title',
                error: 'Please enter some text'),
            FormGroup(
                label: 'Description',
                placeholder: 'Add description...',
                maxLines: 3,
                error: 'Please enter some text'),
            FormGroup(
                label: 'Repository',
                placeholder: 'An SSH URL, like git@github.com:user/repo.git',
                error: 'Please enter some text'),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: handleFormSubmitted,
          child: const Text('Submit'),
        ),
      ],
    );
  }
}

class FormGroup extends StatelessWidget {
  final String label;
  final String? placeholder;
  final int? maxLines;
  final String error;

  const FormGroup({
    Key? key,
    required this.label,
    this.placeholder,
    this.maxLines = 1,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(label),
        ),
        TextFormField(
          maxLines: maxLines,
          decoration: InputDecoration(
              hintText: placeholder,
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.all(8)),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return error;
            }
            return null;
          },
        ),
      ],
    );
  }
}
