import 'package:flutter/material.dart';

class AppsOverview extends StatefulWidget {
  const AppsOverview({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppsOverviewState();
}

class _AppsOverviewState extends State<AppsOverview> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(80, 0, 80, 20),
        child: Column(children: [
          buildBannerView(),
          buildAppsGridView()
        ]),
      ),
    );
  }

  Widget buildBannerView() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text("Explore the World of Middlewares",
                    style: TextStyle(fontSize: 32, color: Colors.white)),
              ),
              Text(
                "Browse the largest network of middlewares, micro services, \nand collections by developers across te planet",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              )
            ],
          ),
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/apps-banner.png',
              alignment: Alignment.centerRight,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAppsGridView() {
    return GridView.builder(
        primary: false,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisExtent: 120.0,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemCount: 52,
        itemBuilder: itemBuilder);
  }

  Widget itemBuilder(BuildContext context, int index) {
    return const Card(
      child: ListTile(
        leading: Icon(Icons.facebook),
        title: Text("Facebook"),
        subtitle: Text("The Social network"),
      ),
    );
  }
}
