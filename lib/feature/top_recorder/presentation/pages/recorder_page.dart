import 'package:fai_kul/feature/top_recorder/presentation/manager/top_recoder/top_recoder_bloc.dart';
import 'package:fai_kul/feature/top_recorder/presentation/widgets/recorder_body.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:fai_kul/main/nar_drawer/main_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class RecorderPage extends StatefulWidget {
  static const String routeName = "RecorderPage";
  @override
  _RecorderPageState createState() => _RecorderPageState();
}

class _RecorderPageState extends State<RecorderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Sổ đầu bài'),
        //   leading: new IconButton(
        //     icon: new Icon(Icons.arrow_back),
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) => HomePage(key: textGlobalKey,)),
        //       );
        //     },
        //   ),
        // ),
        drawer: NavigationDrawer(),
        body: SingleChildScrollView(
          child: buildBody(context),
        ));
  }

  BlocProvider<TopRecoderBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TopRecoderBloc>(),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                RecorderBody(state: 0,),
              ],
            ),
          )
        ],
      ),

    );
  }
}