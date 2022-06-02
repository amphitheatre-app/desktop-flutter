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

import 'cast.dart';

class Play {
  Play(this.id, this.title, this.description);

  final int id;
  final String title;
  final String description;
  final List<Cast> _cast = testCastData;

  List<Cast> get cast => _cast;
}

final List<Play> testPlaysData = <Play>[
  Play(1, "Clean code linters",
      "Make sure your code matches your style guide with these essential code linters."),
  Play(2, "Open journalism",
      "See how publications and data-driven journalists use open source to power their newsroom and ensure information is reported fairly and accurately."),
  Play(3, "Design essentials",
      "This collection of design libraries are the best on the web, and will complete your toolset for designing stunning products."),
  Play(4, "Music",
      "Drop the code bass with these musically themed repositories."),
  Play(5, "Government apps",
      "Sites, apps, and tools built by governments across the world to make government work better, together. Read more at https://government.github.com"),
  Play(6, "DevOps tools",
      "These tools help you manage servers and deploy happier and more often with more confidence."),
  Play(7, "Front-end JavaScript frameworks",
      "While the number of ways to organize JavaScript is almost infinite, here are some tools that help you build single-page applications."),
  Play(8, "GitHub Browser Extensions",
      "Some useful and fun browser extensions to personalize your GitHub browser experience."),
  Play(9, "GitHub Pages examples",
      "Fine examples of projects using GitHub Pages (https://pages.github.com)."),
  Play(10, "Hacking Minecraft",
      "Minecraft is a game about building blocks, but it doesn’t end there. Take Minecraft further with some of the projects below, or dive into the code mines and hammer your own!"),
  Play(11, "JavaScript Game Engines",
      "Learn or level up your 1337 gamedev skills and build amazing games together for web, desktop, or mobile using these HTML5 / JavaScript game engines."),
  Play(12, "Learn to Code", "Resources to help people learn to code"),
  Play(13, "Getting started with machine learning",
      "Today, machine learning—the study of algorithms that make data-based predictions—has found a new audience and a new set of possibilities."),
  Play(14, "Made in Africa",
      "Developers in Africa use open source technology to solve some of the world's most intractable problems and grow their business ecosystems. Here's a snapshot of local projects across the continent."),
  Play(15, "Net neutrality",
      "Software, research, and organizations protecting the free and open internet."),
];
