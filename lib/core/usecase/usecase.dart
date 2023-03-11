import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:equatable/equatable.dart';


abstract class Usecase<type,Param> {

  Future<Either<Failure, type>>call(Param param);

}

class NoParam extends Equatable {

  @override
 
  List<Object?> get props => [];

}
