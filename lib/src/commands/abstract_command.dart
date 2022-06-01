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

abstract class AbstractCommand {
  static BuildContext? _lastKnownRoot;

  /// Provide all commands access to the global context
  late BuildContext context;

  AbstractCommand(BuildContext c) {
    /// Get root context
    /// If we're passed a context that is known to be root, skip the lookup,
    /// it will throw an error otherwise.
    context = (c == _lastKnownRoot) ? c : Provider.of(c, listen: false);
    _lastKnownRoot = context;
  }

  T getProvided<T>() => Provider.of<T>(context, listen: false);
}

/// MIX-INX

mixin CancelableCommandMixin on AbstractCommand {
  bool isCancelled = false;

  bool cancel() => isCancelled = true;
}
