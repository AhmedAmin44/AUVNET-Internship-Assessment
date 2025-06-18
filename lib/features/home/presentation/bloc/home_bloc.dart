import 'package:auvnet_internship_assessment/features/home/domain/usecases/get_home_data_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDataUseCase useCase;

  HomeBloc(this.useCase) : super(const HomeState()) {
    on<HomeRequested>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: null));

      final result = await useCase();

      result.fold(
        (failure) => emit(state.copyWith(isLoading: false, error: failure.errMessage)),
        (data) => emit(state.copyWith(isLoading: false, data: data)),
      );
    });
  }
}
