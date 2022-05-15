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

class InspectView extends StatefulWidget {
  const InspectView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InspectViewState();
}

class _InspectViewState extends State<InspectView> {
  static final environments = {
    "K3S_TOKEN": "RdqNLMXRiRsHJhmxKurR",
    "K3S_KUBECONFIG_OUTPU": "/output/kubeconfig.yaml",
    "PATH":
        "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/bin/aux",
    "CRI_CONFIG_FILE": "/var/lib/rancher/k3s/agent/etc/crictl.yaml"
  };

  static final mounts = {
    "/VAR/LIB/CNI":
        "/var/lib/docker/volumes/00f49631b07ccd74de44d3047d5f889395ac871e05b622890b6dd788d34a59f4/_data",
    "/VAR/LIB/KUBELET":
        "/var/lib/docker/volumes/bc1b16d39a0e204841695de857122412cfdefd0f672af185b1fa43e635397848/_data",
    "/VAR/LIB/RANCHER/K3S":
        "/var/lib/docker/volumes/a78bcb9f7654701e0cfaef4447ef61ced4864e5b93dee7102ec639afb5cf2e1d/_data",
    "/VAR/LOG":
        "/var/lib/docker/volumes/f64c2f2cf81cfde89879f2a17924b31bd2f2e6a6a738f7df949bf6bd57102d25/_data"
  };

  static final port = {
    "6443/tcp": "0.0.0.0:42397",
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildPairList(context, "Environment", environments),
              buildPairList(context, "Mounts", mounts),
              buildPairList(context, "Port", port),
            ]),
      ),
    );
  }

  Widget buildPairList(
      BuildContext context, String header, Map<String, String> pair) {
    var labelWidth = MediaQuery.of(context).size.width * 0.3;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: Theme.of(context).textTheme.headline5,
        ),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(30),
            itemCount: pair.entries.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  ConstrainedBox(
                      constraints: BoxConstraints(minWidth: labelWidth),
                      child: Text(
                        pair.keys.elementAt(index),
                        style: const TextStyle(color: Colors.grey),
                      )),
                  Expanded(child: Text(pair.values.elementAt(index))),
                ],
              );
            }),
      ],
    );
  }
}
