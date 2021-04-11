import 'package:fai_kul/feature/attendance_his/presentation/pages/attendance_history_page.dart';
import 'package:fai_kul/feature/change_pass/presentation/change_pass_page.dart';
import 'package:fai_kul/feature/dayoff/dayoff_page.dart';
import 'package:fai_kul/feature/location/location_page.dart';
import 'package:fai_kul/feature/login/presentation/pages/loginpage.dart';
import 'package:fai_kul/feature/schedule/schedule_class.dart';
import 'package:fai_kul/feature/top_recorder/presentation/pages/comment_page.dart';
import 'package:fai_kul/feature/top_recorder/presentation/pages/recorder_page.dart';
import 'package:fai_kul/feature/top_recorder/presentation/pages/recorder_tabs.dart';
import 'package:fai_kul/feature/train_image/train_camera.dart';
import 'package:fai_kul/feature/tuition_fee/presentation/widgets/fee_page.dart';
import 'package:fai_kul/main/nar_drawer/drawer_pages/attendance_page.dart';
import 'package:fai_kul/main/nar_drawer/drawer_pages/info_page.dart';
import 'package:fai_kul/main/nar_drawer/drawer_pages/managermant_page.dart';
import 'package:fai_kul/main/nar_drawer/drawer_pages/notification_page.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';

class PageRoutes {
  static const String home = HomePage.routeName;
  static const String attendance = AttendancePage.routeName;
  static const String attendanceHis = AttendanceHisPage.routeName;
  static const String notification = NotificationPage.routeName;
  static const String login = LoginPage.routeName;
  static const String info = InfoPage.routeName;
  static const String management = ManagementPage.routeName;
  static const String location = LocationPage.routeName;
  static const String schedule = SchedulePage.routeName;
  static const String traincamera = TrainCamera.routeName;
  static const String feePage = FeePage.routeName;
  static const String recorderPage = RecorderPage.routeName;
  static const String commentPage = CommentPage.routeName;
  static const String recorderTabs = RecorderTabs.routeName;
  static const String changePass = ChangePassPage.routeName;
  static const String dateOffPage = DayOffPage.routeName;
}