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

import 'abstract_model.dart';
import 'package:collection/collection.dart';
import 'package:amphitheatre/src/entities/play/play.dart';
import 'package:amphitheatre/src/entities/play/player.dart';

class PlayModel extends AbstractModel {
  List<Play> get entries => List.unmodifiable(_entries);
  List<Play> _entries = [];

  set entries(List<Play> value) {
    _entries = value;
    notifyListeners();
  }

  Play? get selectedPlay => _selectedPlay;
  set selectedPlay(Play? play) {
    _selectedPlay = play;
    notifyListeners();
  }

  Play? _selectedPlay;

  Player? get selectedPlayer => _selectedPlayer;
  set selectedPlayer(Player? player) {
    _selectedPlayer = player;
    notifyListeners();
  }

  Player? _selectedPlayer;

  Play? get(int id) => _entries.firstWhereOrNull((p) => p.id == id);

  bool exists(Play value) => _entries.any((x) => x.id == value.id);

  void add(Play value) {
    _entries.add(value);
    notifyListeners();
  }

  void swap(Play newValue) {
    final Play? oldValue = get(newValue.id);
    if (oldValue != null) {
      _entries[_entries.indexOf(oldValue)] = newValue;
      notifyListeners();
    }
  }
}
