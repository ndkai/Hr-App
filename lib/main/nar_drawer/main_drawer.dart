
import 'package:fai_kul/main.dart';
import 'package:fai_kul/main/nar_drawer/page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foreground_service/foreground_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'body.dart';
import 'header_drawer.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("app xx ${appUser.idHocVien}");
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(
            icon: Icons.home,
            text: 'Trang chủ',
          ),
          appUser.idNhanVien != null?createDrawerBodyItem(
              icon: Icons.event_available_rounded,
              text: 'Điểm danh',
              onTap: () =>{
                Navigator.pop(context),
                Navigator.pushReplacementNamed(context, PageRoutes.attendance),
              }
          ):SizedBox(height: 0,),
          createDrawerBodyItem(
            icon: Icons.calendar_today_sharp,
            text: 'Thời khóa biểu',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.schedule),
          ),
          createDrawerBodyItem(
            icon: Icons.event_note,
            text: 'Thông tin điểm danh',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.attendanceHis),
          ),
          // createDrawerBodyItem(
          //   icon: Icons.insert_drive_file,
          //   text: 'Quản lý',
          //   onTap: () =>
          //       Navigator.pushReplacementNamed(context, PageRoutes.management),
          // ),

          appUser.idHocVien != null?createDrawerBodyItem(
              icon: Icons.menu_book_sharp,
              text: 'Khóa học',
              onTap: (){
                Navigator.pushReplacementNamed(context, PageRoutes.feePage);
              }

          ):SizedBox(height: 0,),
          appUser.idNhanVien != null?createDrawerBodyItem(
              icon: Icons.book_online,
              text: 'Sổ đầu bài',
              onTap: (){
                Navigator.pushReplacementNamed(context, PageRoutes.recorderTabs);
              }

          ):SizedBox(height: 0,),
          // createDrawerBodyItem(
          //     icon: Icons.location_on,
          //     text: 'Vị trí',
          //     onTap: (){
          //       Navigator.pushReplacementNamed(context, PageRoutes.location);
          //     }
          //
          // ),
          // Divider(),
          // createDrawerBodyItem(
          //   icon: Icons.notifications_active,
          //   text: 'Notifications',
          //   onTap: () =>
          //       Navigator.pushReplacementNamed(context, PageRoutes.notification),
          // ),
          createDrawerBodyItem(
            icon: Icons.change_history_rounded,
            text: 'Đổi mật khẩu',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.changePass),
          ),
          createDrawerBodyItem(
            icon: Icons.contact_phone,
            text: 'Thông tin liên lạc',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.info),
          ),
          createDrawerBodyItem(
            icon: Icons.exit_to_app,
            text: 'Đăng xuất',
            onTap: (){
              _toggleForegroundServiceOnOff;
              logout();
              Navigator.pushReplacementNamed(context, PageRoutes.login);
            }

          ),

          ListTile(
            title: Text('App version 1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
  static const SAVE_LOGIN_RESPONSE = 'SAVE_LOGIN_RESPONSE';
  void logout(){
    prefs.setString(SAVE_LOGIN_RESPONSE,'');

  }

  void _toggleForegroundServiceOnOff() async {
    final fgsIsRunning = await ForegroundService.foregroundServiceIsStarted();
    String appMessage;

    if (fgsIsRunning) {
      await ForegroundService.stopForegroundService();
    }

  }

}

