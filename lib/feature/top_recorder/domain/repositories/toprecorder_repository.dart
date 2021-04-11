import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/feature/attendance_his/data/models/attendance_history_swagger.dart';
import 'package:fai_kul/feature/attendance_his/data/models/data.dart';
import 'package:fai_kul/feature/top_recorder/domain/entities/toprecorder_swagger.dart';

abstract class TopRecorderRepo{
  Future<Either<Failure, TopRecorderSwagger>> getTopRecorder();
}