// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:dartz/dartz.dart';

import 'package:e_commerce/module/features/auth/data/datasources/auth_remote_data_sourse.dart';
import 'package:e_commerce/module/features/auth/domain/entities/login.dart';
import 'package:e_commerce/module/features/auth/domain/entities/register.dart';
import 'package:e_commerce/module/features/auth/domain/repositories/auth_repository.dart';

import '../../../../../core/error/failure.dart';

import '../../../../../core/networks/network_informatiom.dart';

class AuthrepositoryImp extends Authrepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInformation networkInformation;

  AuthrepositoryImp(
    this.remoteDataSource,
    this.networkInformation,
  );

  @override
  Future<Either<Failure, Login>> loginInWithEmailAndPassword(
      LoginParam loginParam) async {
    if ( await networkInformation.isConnected) {
      try {
        final result =
            await remoteDataSource.loginWithEmailAndPassword(loginParam);
        if (result.status == true) {
          return Right(result);
        } else {
          return Left(Failure(result.message.toString()));
        }
      } catch (e) {
        return Left(Failure(e.toString()));
      }
    }
    return const Left(Failure('No internet connection'));
  }

  @override
  Future<Either<Failure, Register>> registerInWithEmailAndPassword(
     
      RegisterParam registerParam) async {
        bool isconnected= await networkInformation.isConnected;
        print (isconnected);
    if ( isconnected) {
      try {
        final result = await remoteDataSource
            .registerInWithEmailAndPassword(registerParam);
        if (result.status == true) {
          return Right(result);
        } else {
          return Left(Failure(result.message.toString()));
        }
      } catch (e) {
        return Left(Failure(e.toString()));
      }
    }
    return const Left(Failure('No internet connection'));
  }
}
