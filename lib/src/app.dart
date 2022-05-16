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

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/pages/screen.dart';
//import 'play/pages/screen.dart';

// import 'sample_feature/sample_item_details_view.dart';
// import 'sample_feature/sample_item_list_view.dart';
import 'router.dart';
import 'settings/settings_controller.dart';
// import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
            // Providing a restorationScopeId allows the Navigator built by the
            // MaterialApp to restore the navigation stack when a user leaves and
            // returns to the app after it has been killed while running in the
            // background.
            restorationScopeId: 'app',

            // Provide the generated AppLocalizations to the MaterialApp. This
            // allows descendant Widgets to display the correct translations
            // depending on the user's locale.
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English, no country code
            ],

            // Use AppLocalizations to configure the correct application title
            // depending on the user's locale.
            //
            // The appTitle is defined in .arb files found in the localization
            // directory.
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,

            // Define a light and dark color theme. Then, read the user's
            // preferred ThemeMode (light, dark, or system default) from the
            // SettingsController to display the correct theme.
            theme: ThemeData(),
            darkTheme: ThemeData.dark(),
            themeMode: settingsController.themeMode,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            debugShowCheckedModeBanner: false);
      },
    );
  }
}

// class AppScreen extends StatefulWidget {
//   const AppScreen({Key? key}) : super(key: key);

//   @override
//   State<AppScreen> createState() => _AppScreenState();
// }

// class _AppScreenState extends State<AppScreen> {
//   PageController pageController = PageController();
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     final NavigationRailThemeData navigationRailTheme =
//         NavigationRailTheme.of(context);
//     final Color backgroundColor =
//         navigationRailTheme.backgroundColor ?? theme.colorScheme.surface;

//     return AutoTabsRouter(
//         routes: const [PlaysScreenRoute(), AppsScreenRoute()],
//         builder: (context, child, animation) {
//           final tabsRouter = AutoTabsRouter.of(context);
//           return Scaffold(
//             body: Row(
//               children: <Widget>[
//                 Container(
//                   color: backgroundColor,
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: NavigationRail(
//                           groupAlignment: -1.0,
//                           selectedIndex: tabsRouter.activeIndex,
//                           onDestinationSelected: (int index) {
//                             setState(() {
//                               tabsRouter.setActiveIndex(index);
//                             });
//                           },
//                           labelType: NavigationRailLabelType.all,
//                           leading: CircleAvatar(
//                             backgroundColor: Colors.blueGrey,
//                             radius: 20,
//                             child: IconButton(
//                               padding: EdgeInsets.zero,
//                               icon: const Icon(Icons.account_circle),
//                               color: Colors.white,
//                               onPressed: () {},
//                             ),
//                           ),
//                           destinations: const <NavigationRailDestination>[
//                             NavigationRailDestination(
//                               icon: Icon(Icons.rocket_launch),
//                               selectedIcon: Icon(Icons.rocket_launch),
//                               label: Text('Plays'),
//                             ),
//                             NavigationRailDestination(
//                               icon: Icon(Icons.apps_outlined),
//                               selectedIcon: Icon(Icons.apps),
//                               label: Text('Apps'),
//                             ),
//                             NavigationRailDestination(
//                               icon: Icon(Icons.extension_sharp),
//                               selectedIcon: Icon(Icons.extension),
//                               label: Text('Addons'),
//                             ),
//                           ],
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         icon: const Icon(Icons.help_outline_rounded,
//                             color: Colors.grey),
//                         padding: const EdgeInsets.only(bottom: 20),
//                       )
//                     ],
//                   ),
//                 ),
//                 const VerticalDivider(thickness: 1, width: 1),
//                 // This is the main content.
//                 // Expanded(
//                 //   child: PageView(
//                 //     physics: const NeverScrollableScrollPhysics(),
//                 //     controller: pageController,
//                 //     children: pages,
//                 //   ),
//                 // )
//                 Expanded(child: child)
//               ],
//             ),
//           );
//         });
//   }
// }
