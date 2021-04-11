import 'package:fai_kul/feature/top_recorder/presentation/pages/al_recorder_page.dart';
import 'package:fai_kul/feature/top_recorder/presentation/pages/recorder_page.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecorderTabs extends StatefulWidget {
  static const routeName = "RecorderTabs";
  @override
  _RecorderTabsState createState() => _RecorderTabsState();
}

class _RecorderTabsState extends State<RecorderTabs> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sổ đầu bài"),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage(key: textGlobalKey,)),
              );
            },
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: "Chờ đánh giá"),
              Tab(text: "Đã đánh giá",),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            RecorderPage(),
            AlRecorderPage(),
          ],
        ),
      ),
    );
  }
}
