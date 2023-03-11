import 'package:e_commerce/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/module/features/home/domain/entities/home.dart';
import 'package:e_commerce/module/features/home/domain/repositories/home_repository.dart';

class HomeUsecase extends Usecase<Home,NoParam> {


  final HomeRepository homeRepository;

  HomeUsecase(this.homeRepository);
  @override
  Future<Either<Failure, Home>> call(NoParam param)async {

   return await homeRepository.getHomeData();
  }

}
