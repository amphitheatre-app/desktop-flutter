import 'package:amphitheatre_desktop/src/plays/cast.dart';
import 'package:amphitheatre_desktop/src/plays/environments.dart';
import 'package:amphitheatre_desktop/src/plays/logs.dart';
import 'package:amphitheatre_desktop/src/plays/resources.dart';
import 'package:amphitheatre_desktop/src/plays/stats.dart';
import 'package:amphitheatre_desktop/src/plays/settings.dart';
import 'package:flutter/material.dart';
import 'play.dart';

class PlaysView extends StatefulWidget {
  const PlaysView({Key? key}) : super(key: key);

  @override
  State<PlaysView> createState() => _PlaysViewState();
}

class _PlaysViewState extends State<PlaysView>
    with SingleTickerProviderStateMixin {
  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Cast'),
    Tab(text: 'Logs'),
    Tab(text: 'Resources'),
    Tab(text: 'Environment'),
    Tab(text: 'Stats'),
    Tab(text: 'Settings'),
  ];

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildPlaysSidebar(),
        const VerticalDivider(thickness: 1, width: 1),
        buildPlayDetail()
      ],
    );
  }

  static List<Play> plays = <Play>[
    const Play(1, "frontend", "The frontend ui based on VueJs"),
    const Play(2, "backend", "The backend api server"),
    const Play(2, "backend", "The backend api server"),
    const Play(2, "backend", "The backend api server"),
    const Play(2, "backend", "The backend api server"),
    const Play(2, "backend", "The backend api server"),
    const Play(2, "backend", "The backend api server"),
    const Play(2, "backend", "The backend api server"),
    const Play(2, "backend", "The backend api server"),
    const Play(2, "backend", "The backend api server"),
    const Play(2, "backend", "The backend api server"),
    const Play(2, "backend", "The backend api server"),
    const Play(2, "backend", "The backend api server"),
    const Play(2, "backend", "The backend api server"),
    const Play(2, "backend", "The backend api server"),
  ];

  Widget buildPlaysSidebar() {
    return SizedBox(
      width: 280,
      child: Column(
        children: [
          AppBar(
            title: const Text("Plays"),
            centerTitle: false,
            elevation: 0.6,
            //shadowColor: Colors.black,
            actions: [
              IconButton(
                color: Colors.grey,
                icon: const Icon(Icons.filter_list),
                tooltip: "Filter",
                onPressed: () {
                  // handle the press
                },
              ),
              IconButton(
                color: Colors.blue,
                icon: const Icon(Icons.add_circle_outlined),
                tooltip: "New",
                onPressed: () {
                  // handle the press
                },
              ),
            ],
            titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView(
              children: [
                ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: plays.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(plays[index].title),
                        subtitle: Text(plays[index].description),
                      );
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPlayDetail() {
    return Expanded(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppBar(
              elevation: 0.6,
              title: const Text("Play Detail Page"),
              centerTitle: false,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.play_arrow_rounded),
                  tooltip: 'Play',
                  onPressed: () {
                    // handle the press
                  },
                ),
              ],
              titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TabBar(controller: tabController, tabs: tabs, isScrollable: true),
            Expanded(
              child: TabBarView(
                controller: tabController, 
                children: const <Widget>[
                  CastView(),
                  LogsView(),
                  ResourcesView(),
                  EnvironmentsView(),
                  StatsView(),
                  SettingsView()
              ]),
            )
          ]),
    );
  }
}
