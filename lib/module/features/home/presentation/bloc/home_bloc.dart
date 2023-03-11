import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/core/utils/enums.dart';

import 'package:equatable/equatable.dart';
import '../../domain/entities/home.dart';
import '../../domain/usecases/home_usecase.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUsecase getHomeDataUseCase;
  HomeBloc(
    this.getHomeDataUseCase,
  ) : super(const HomeState()) {
    on<HomeEvent>((event, emit) {});
    on<GetHomeDateEvent>((event, emit) {
      return _getHomeData();
    });
  }

  void _getHomeData() async {
    emit(state.copyWith(state: RequestState.loading));

    final result = await getHomeDataUseCase(NoParam());

    emit(
      result.fold(
        (failure) {
          log(failure.toString());
          return state.copyWith(
            state: RequestState.error,
            errorMessage: failure.message.toString(),
          );
        },
        (home) {
          log(home.toString());

          return state.copyWith(state: RequestState.loaded, data: home);
        },
      ),
    );
  }
}