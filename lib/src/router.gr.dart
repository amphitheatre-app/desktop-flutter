// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    PlaysScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PlaysScreen());
    },
    PlaysOverviewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PlaysOverview());
    },
    PlayDetailRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PlayDetail());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/plays', fullMatch: true),
        RouteConfig(PlaysScreenRoute.name, path: '/plays', children: [
          RouteConfig(PlaysOverviewRoute.name,
              path: ':id', parent: PlaysScreenRoute.name),
          RouteConfig(PlayDetailRoute.name,
              path: ':id/:pid', parent: PlaysScreenRoute.name)
        ])
      ];
}

/// generated route for
/// [PlaysScreen]
class PlaysScreenRoute extends PageRouteInfo<void> {
  const PlaysScreenRoute({List<PageRouteInfo>? children})
      : super(PlaysScreenRoute.name, path: '/plays', initialChildren: children);

  static const String name = 'PlaysScreenRoute';
}

/// generated route for
/// [PlaysOverview]
class PlaysOverviewRoute extends PageRouteInfo<void> {
  const PlaysOverviewRoute() : super(PlaysOverviewRoute.name, path: ':id');

  static const String name = 'PlaysOverviewRoute';
}

/// generated route for
/// [PlayDetail]
class PlayDetailRoute extends PageRouteInfo<void> {
  const PlayDetailRoute() : super(PlayDetailRoute.name, path: ':id/:pid');

  static const String name = 'PlayDetailRoute';
}
