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

import 'package:auto_route/auto_route.dart';

import 'features/play/plays_page.dart';
import 'features/play/detail/play_overview_page.dart';
import 'features/play/detail/play_detail_page.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
    //replaceInRouteName: 'Page, Route',
    routes: <AutoRoute>[
      RedirectRoute(path: '/', redirectTo: '/plays'), 
      AutoRoute(path: '/plays', page: PlaysPage, children: [
        AutoRoute(path: 'overview', page: PlayOverviewPage),
        AutoRoute(path: 'detail', page: PlayDetailPage)
      ]),
    ])
class AppRouter extends _$AppRouter {}
