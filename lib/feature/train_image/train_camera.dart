import 'package:fai_kul/main/component/bottom_nar/bottom_nar.dart';
import 'package:fai_kul/main/nar_drawer/main_drawer.dart';
import 'package:flutter/material.dart';

import 'face_detection_camera.dart';

class TrainCamera extends StatelessWidget {
  static const String routeName = '/TrainCamera';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      bottomNavigationBar: BottomNar(index: 0),
      body: FaceDetectionFromLiveCamera(key: trainGlobalKey,),
    );
  }
}
