import 'package:fai_kul/feature/camera/face_detection_camera.dart';
import 'package:fai_kul/main/component/bottom_nar/bottom_nar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';
import '../main_drawer.dart';

class AttendancePage extends StatelessWidget {
  static const String routeName = '/AttendancePage';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: NavigationDrawer(),
        body: FaceDetectionFromLiveCamera());
  }
}