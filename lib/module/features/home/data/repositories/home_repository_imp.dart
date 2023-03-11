import 'dart:developer';

import 'package:e_commerce/core/error/exceptions.dart';
import 'package:e_commerce/module/features/home/domain/entities/home.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/module/features/home/domain/repositories/home_repository.dart';

import '../../../../../core/networks/network_informatiom.dart';
import '../datasources/home_remore_data_source.dart';

class HomerepositoruImpelmentation extends HomeRepository {
  final HomeRemoreDataSource homeRemoreDataSource;
  final NetworkInformation networkInformation;

  HomerepositoruImpelmentation(this.homeRemoreDataSource, this.networkInformation);
  @override
  Future<Either<Failure, Home>> getHomeData() async {
   
       try {
      final homeData = await homeRemoreDataSource.getHomeData();
      log(homeData.toString());
      return Right(homeData);
    } on ServerException catch (error) {
      log(error.toString());
      return Left(Failure(error.message.toString()));
    } catch (error) {
      log(error.toString());
      return Left(Failure(error.toString()));
    }
   
   
  }
}
