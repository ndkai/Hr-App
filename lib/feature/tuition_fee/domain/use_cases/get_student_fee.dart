import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/usecase/usecase.dart';
import 'package:fai_kul/feature/tuition_fee/domain/entities/FeeSwagger.dart';
import 'package:fai_kul/feature/tuition_fee/domain/repositories/fee_repository.dart';

class GetStudentFee extends UseCase<FeeSwagger, NoParams>{
  final FeeRepository repository;

  GetStudentFee(this.repository);
  @override
  Future<Either<Failure, FeeSwagger>> call(NoParams params) async {
   return await repository.getStudentFee();
  }

}