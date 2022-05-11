import 'package:amphitheatre_desktop/src/plays/cast.dart';
import 'package:amphitheatre_desktop/src/plays/environments.dart';
import 'package:amphitheatre_desktop/src/plays/logs.dart';
import 'package:amphitheatre_desktop/src/plays/resources.dart';
import 'package:amphitheatre_desktop/src/plays/stats.dart';
import 'package:amphitheatre_desktop/src/plays/settings.dart';
import 'package:flutter/material.dart';
import 'play.dart';

class PlaysOverview extends StatefulWidget {
  const PlaysOverview({Key? key}) : super(key: key);

  @override
  State<PlaysOverview> createState() => _PlaysOverviewState();
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class _PlaysOverviewState extends State<PlaysOverview>
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
  late WhyFarther _selection;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        vsync: this, length: tabs.length, animationDuration: Duration.zero);
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
    const Play(1, "Clean code linters",
        "Make sure your code matches your style guide with these essential code linters."),
    const Play(2, "Open journalism",
        "See how publications and data-driven journalists use open source to power their newsroom and ensure information is reported fairly and accurately."),
    const Play(2, "Design essentials",
        "This collection of design libraries are the best on the web, and will complete your toolset for designing stunning products."),
    const Play(2, "Music",
        "Drop the code bass with these musically themed repositories."),
    const Play(2, "Government apps",
        "Sites, apps, and tools built by governments across the world to make government work better, together. Read more at https://government.github.com"),
    const Play(2, "DevOps tools",
        "These tools help you manage servers and deploy happier and more often with more confidence."),
    const Play(2, "Front-end JavaScript frameworks",
        "While the number of ways to organize JavaScript is almost infinite, here are some tools that help you build single-page applications."),
    const Play(2, "GitHub Browser Extensions",
        "Some useful and fun browser extensions to personalize your GitHub browser experience."),
    const Play(2, "GitHub Pages examples",
        "Fine examples of projects using GitHub Pages (https://pages.github.com)."),
    const Play(2, "Hacking Minecraft",
        "Minecraft is a game about building blocks, but it doesn’t end there. Take Minecraft further with some of the projects below, or dive into the code mines and hammer your own!"),
    const Play(2, "JavaScript Game Engines",
        "Learn or level up your 1337 gamedev skills and build amazing games together for web, desktop, or mobile using these HTML5 / JavaScript game engines."),
    const Play(2, "Learn to Code", "Resources to help people learn to code"),
    const Play(2, "Getting started with machine learning",
        "Today, machine learning—the study of algorithms that make data-based predictions—has found a new audience and a new set of possibilities."),
    const Play(2, "Made in Africa",
        "Developers in Africa use open source technology to solve some of the world's most intractable problems and grow their business ecosystems. Here's a snapshot of local projects across the continent."),
    const Play(2, "Net neutrality",
        "Software, research, and organizations protecting the free and open internet."),
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
              padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                        leading: const Icon(Icons.facebook),
                        title: Text(plays[index].title),
                        subtitle: Text(plays[index].description,
                            maxLines: 3, overflow: TextOverflow.ellipsis),
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
              elevation: 0.0,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Clean code linters"),
                  Text("Running", style: Theme.of(context).textTheme.overline!.copyWith(color: Colors.green)),
                ],
              ),
              centerTitle: false,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.terminal_outlined, color: Colors.blue),
                  tooltip: 'Terminal',
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.play_circle_outlined,
                      color: Colors.blue),
                  tooltip: 'Play',
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.stop_circle_outlined,
                      color: Colors.blue),
                  tooltip: 'Stop',
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.refresh_outlined, color: Colors.blue),
                  tooltip: 'Refresh',
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.cancel_outlined, color: Colors.blue),
                  tooltip: 'Cancel',
                  onPressed: () {},
                ),
                PopupMenuButton<WhyFarther>(
                  icon: Icon(Icons.adaptive.more, color: Colors.blue),
                  onSelected: (WhyFarther result) {
                    setState(() {
                      _selection = result;
                    });
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<WhyFarther>>[
                    const PopupMenuItem<WhyFarther>(
                      value: WhyFarther.harder,
                      child: Text('Working a lot harder'),
                    ),
                    const PopupMenuItem<WhyFarther>(
                      value: WhyFarther.smarter,
                      child: Text('Being a lot smarter'),
                    ),
                    const PopupMenuItem<WhyFarther>(
                      value: WhyFarther.selfStarter,
                      child: Text('Being a self-starter'),
                    ),
                    const PopupMenuItem<WhyFarther>(
                      value: WhyFarther.tradingCharter,
                      child: Text('Placed in charge of trading charter'),
                    ),
                  ],
                )
              ],
              titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TabBar(controller: tabController, tabs: tabs, isScrollable: false),
            Expanded(
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
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
