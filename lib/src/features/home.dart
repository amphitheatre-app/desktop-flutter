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
