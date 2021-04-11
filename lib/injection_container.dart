import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:fai_kul/feature/attendance/attendance_method.dart';
import 'package:fai_kul/feature/attendance_his/data/repositories/history_attendance_repository_impl.dart';
import 'package:fai_kul/feature/login/domain/use_cases/get_current_user.dart';
import 'package:fai_kul/feature/top_recorder/data/data_sources/remote_recorder_datasource.dart';
import 'package:fai_kul/feature/top_recorder/data/repositories/recorder_repository_impl.dart';
import 'package:fai_kul/feature/top_recorder/domain/repositories/toprecorder_repository.dart';
import 'package:fai_kul/feature/top_recorder/domain/use_cases/get_top_recorder_data.dart';
import 'package:fai_kul/feature/top_recorder/presentation/manager/top_recoder/top_recoder_bloc.dart';
import 'package:fai_kul/feature/tuition_fee/data/data_sources/remote_student_fee.dart';
import 'package:fai_kul/feature/tuition_fee/data/repositories/fee_reposiroty_impl.dart';
import 'package:fai_kul/feature/tuition_fee/domain/repositories/fee_repository.dart';
import 'package:fai_kul/feature/tuition_fee/presentation/manager/fee/fee_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/utils/input_converter.dart';
import 'feature/attendance_his/data/data_sources/local_attendance_history_datasource.dart';
import 'feature/attendance_his/data/data_sources/remote_attendance_history_datasource.dart';
import 'feature/attendance_his/domain/repositories/history_attendance_repository.dart';
import 'feature/attendance_his/domain/use_cases/get_attendance_history_by_page.dart';
import 'feature/attendance_his/domain/use_cases/get_attendence_history.dart';
import 'feature/attendance_his/presentation/manager/attendance_his/attendance_his_bloc.dart';
import 'feature/login/data/data_sources/login_local_data_sourse.dart';
import 'feature/login/data/data_sources/login_response-data_source.dart';
import 'feature/login/data/repositories/login_repository_impl.dart';
import 'feature/login/domain/repositories/login_response_repository.dart';
import 'feature/login/domain/use_cases/login.dart';
import 'feature/login/presentation/manager/login/login_bloc.dart';
import 'feature/tuition_fee/domain/use_cases/get_student_fee.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => LoginBloc(
      lg: sl(),
      cu: sl(),
    ),
  );

  sl.registerFactory(
    () => AttendanceHisBloc(ah: sl(), ahbp: sl(), inputConverter: sl()),
  );

  sl.registerFactory(
        () => FeeBloc(getStudentFee: sl()),
  );

  sl.registerFactory(
        () => TopRecoderBloc(getTopRecorderUsecase: sl()),
  );
  //use case
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => GetCurrentUser(sl()));
  sl.registerLazySingleton(() => GetAttendanceHistoryByPage(sl()));
  sl.registerLazySingleton(() => GetAttendanceHistory(sl()));
  sl.registerLazySingleton(() => GetStudentFee(sl()));
  sl.registerLazySingleton(() => GetTopRecorderUsecase(sl()));
  // sl.registerLazySingleton(() => GetLO(sl()));
  // repo
  sl.registerLazySingleton<LoginResponseRepository>(() => LoginRepositoryImpl(
      loginResponseDataSource: sl(),
      networkInfo: sl(),
      localLoginDataSource: sl()));

  sl.registerLazySingleton<AttendanceHistoryRepository>(() =>
      AttendanceHistoryRepositoryImpl(
          networkInfo: sl(), remoteDataSource: sl(), localDataSource: sl()));

  sl.registerLazySingleton<FeeRepository>(
          () => FeeRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));

  sl.registerLazySingleton<TopRecorderRepo>(
          () => TopRecorderRepositoryImpl(networkInfo: sl(), recorderDataSource: sl()));
  //data sourse
  sl.registerLazySingleton<LoginResponseDataSource>(
    () => LoginResponseImpl(client: sl()),
  );

  sl.registerLazySingleton<RemoteAttendanceHistoryDataSource>(
      () => RemoteAttendanceHistoryDataSourceImpl(client: sl()));

  sl.registerLazySingleton<LocalLoginDataSource>(
      () => LocalLoginDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<LocalAttendanceHistoryDataSource>(
      () => LocalAttendanceHistoryDataSourceIml(sharedPreferences: sl()));

  sl.registerLazySingleton<RemoteFeeDataSource>(() => RemoteFeeDataSourceImpl(client: sl()));

  sl.registerLazySingleton<RemoteRecorderDataSource>(() => RemoteRecorderDataSourceImpl(client: sl()));

  // core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
