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
    PlaysPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PlaysPage());
    },
    PlayOverviewPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PlayOverviewPage());
    },
    PlayDetailPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PlayDetailPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/plays', fullMatch: true),
        RouteConfig(PlaysPageRoute.name, path: '/plays', children: [
          RouteConfig(PlayOverviewPageRoute.name,
              path: 'overview', parent: PlaysPageRoute.name),
          RouteConfig(PlayDetailPageRoute.name,
              path: 'detail', parent: PlaysPageRoute.name)
        ])
      ];
}

/// generated route for
/// [PlaysPage]
class PlaysPageRoute extends PageRouteInfo<void> {
  const PlaysPageRoute({List<PageRouteInfo>? children})
      : super(PlaysPageRoute.name, path: '/plays', initialChildren: children);

  static const String name = 'PlaysPageRoute';
}

/// generated route for
/// [PlayOverviewPage]
class PlayOverviewPageRoute extends PageRouteInfo<void> {
  const PlayOverviewPageRoute()
      : super(PlayOverviewPageRoute.name, path: 'overview');

  static const String name = 'PlayOverviewPageRoute';
}

/// generated route for
/// [PlayDetailPage]
class PlayDetailPageRoute extends PageRouteInfo<void> {
  const PlayDetailPageRoute() : super(PlayDetailPageRoute.name, path: 'detail');

  static const String name = 'PlayDetailPageRoute';
}
