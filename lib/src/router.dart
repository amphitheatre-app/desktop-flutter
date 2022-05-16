import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import 'play/pages/screen.dart';
import 'play/pages/overview.dart';
import 'play/pages/detail.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
    //replaceInRouteName: 'Page, Route',
    routes: <AutoRoute>[
      RedirectRoute(path: '/', redirectTo: '/plays'), 
      AutoRoute(path: '/plays', page: PlaysScreen, children: [
        AutoRoute(path: ':id', page: PlaysOverview),
        AutoRoute(path: ':id/:pid', page: PlayDetail)
      ]),
    ])
class AppRouter extends _$AppRouter {}
