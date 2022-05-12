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

import '../models/cast.dart';

class CastView extends StatefulWidget {
  const CastView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CastViewState();
}

class _CastViewState extends State<CastView> {
  final List<Cast> cast = <Cast>[
    const Cast(1, "Clean code linters",
        "Make sure your code matches your style guide with these essential code linters."),
    const Cast(2, "Open journalism",
        "See how publications and data-driven journalists use open source to power their newsroom and ensure information is reported fairly and accurately."),
    const Cast(2, "Design essentials",
        "This collection of design libraries are the best on the web, and will complete your toolset for designing stunning products."),
    const Cast(2, "Music",
        "Drop the code bass with these musically themed repositories."),
    const Cast(2, "Government apps",
        "Sites, apps, and tools built by governments across the world to make government work better, together. Read more at https://government.github.com"),
    const Cast(2, "DevOps tools",
        "These tools help you manage servers and deploy happier and more often with more confidence."),
    const Cast(2, "Front-end JavaScript frameworks",
        "While the number of ways to organize JavaScript is almost infinite, here are some tools that help you build single-page applications."),
    const Cast(2, "GitHub Browser Extensions",
        "Some useful and fun browser extensions to personalize your GitHub browser experience."),
    const Cast(2, "GitHub Pages examples",
        "Fine examples of projects using GitHub Pages (https://pages.github.com)."),
    const Cast(2, "Hacking Minecraft",
        "Minecraft is a game about building blocks, but it doesn’t end there. Take Minecraft further with some of the projects below, or dive into the code mines and hammer your own!"),
    const Cast(2, "JavaScript Game Engines",
        "Learn or level up your 1337 gamedev skills and build amazing games together for web, desktop, or mobile using these HTML5 / JavaScript game engines."),
    const Cast(2, "Learn to Code", "Resources to help people learn to code"),
    const Cast(2, "Getting started with machine learning",
        "Today, machine learning—the study of algorithms that make data-based predictions—has found a new audience and a new set of possibilities."),
    const Cast(2, "Made in Africa",
        "Developers in Africa use open source technology to solve some of the world's most intractable problems and grow their business ecosystems. Here's a snapshot of local projects across the continent."),
    const Cast(2, "Net neutrality",
        "Software, research, and organizations protecting the free and open internet."),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: cast.length,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return CastItemView(cast: cast[index]);
        });
  }
}

class CastItemView extends StatelessWidget {
  const CastItemView({Key? key, required this.cast}) : super(key: key);

  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
    ]);
  }
}
