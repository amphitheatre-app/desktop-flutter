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

import 'package:flutter/widgets.dart';
import 'package:time/time.dart';

import '../commands.dart';
import 'refresh_plays_command.dart';

class PollPlaysCommand extends AbstractCommand with CancelableCommandMixin {
  PollPlaysCommand(BuildContext c) : super(c);

  Future<void> execute([bool repeat = false, double wait = 15]) async {
    await RefreshPlaysCommand(context).execute();

    if (repeat) {
      Future.delayed(wait.minutes).then((value) {
        if (isCancelled) return;
        execute(true);
      });
    }
  }
}
