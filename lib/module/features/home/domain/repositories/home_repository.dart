import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';


import '../entities/home.dart';

abstract class HomeRepository{

Future<Either<Failure, Home>>getHomeData();

}