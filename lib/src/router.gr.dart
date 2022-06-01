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
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PlayOverviewPageRouteArgs>(
          orElse: () =>
              PlayOverviewPageRouteArgs(id: pathParams.optString('id')));
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: PlayOverviewPage(key: args.key, id: args.id));
    },
    PlayDetailPageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PlayDetailPageRouteArgs>(
          orElse: () => PlayDetailPageRouteArgs(
              id: pathParams.optString('id'),
              pid: pathParams.optString('pid')));
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: PlayDetailPage(key: args.key, id: args.id, pid: args.pid));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/plays', fullMatch: true),
        RouteConfig(PlaysPageRoute.name, path: '/plays', children: [
          RouteConfig(PlayOverviewPageRoute.name,
              path: ':id', parent: PlaysPageRoute.name),
          RouteConfig(PlayDetailPageRoute.name,
              path: ':id/:pid', parent: PlaysPageRoute.name)
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
class PlayOverviewPageRoute extends PageRouteInfo<PlayOverviewPageRouteArgs> {
  PlayOverviewPageRoute({Key? key, String? id})
      : super(PlayOverviewPageRoute.name,
            path: ':id',
            args: PlayOverviewPageRouteArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'PlayOverviewPageRoute';
}

class PlayOverviewPageRouteArgs {
  const PlayOverviewPageRouteArgs({this.key, this.id});

  final Key? key;

  final String? id;

  @override
  String toString() {
    return 'PlayOverviewPageRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [PlayDetailPage]
class PlayDetailPageRoute extends PageRouteInfo<PlayDetailPageRouteArgs> {
  PlayDetailPageRoute({Key? key, String? id, String? pid})
      : super(PlayDetailPageRoute.name,
            path: ':id/:pid',
            args: PlayDetailPageRouteArgs(key: key, id: id, pid: pid),
            rawPathParams: {'id': id, 'pid': pid});

  static const String name = 'PlayDetailPageRoute';
}

class PlayDetailPageRouteArgs {
  const PlayDetailPageRouteArgs({this.key, this.id, this.pid});

  final Key? key;

  final String? id;

  final String? pid;

  @override
  String toString() {
    return 'PlayDetailPageRouteArgs{key: $key, id: $id, pid: $pid}';
  }
}
