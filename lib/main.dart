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
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

import 'src/app.dart';
import 'src/models/play_model.dart';
import 'src/services/play_service.dart';

void main() async {

  // Set up the window options.
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  windowManager.waitUntilReadyToShow(
    const WindowOptions(size: Size(1100, 700), center: true),
    () async {
      await windowManager.show();
      await windowManager.focus();
    },
  );

  // Run the app
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: PlayModel()),
        Provider(create: (_) => PlayService()),

        /// ROOT CONTEXT, Allows Commands to retrieve a 'safe' context that is not
        /// tied to any one view. Allows them to work on async tasks without issues.
        Provider<BuildContext>(create: (c) => c),
      ],
      child: const App(),
    ),
  );
}
