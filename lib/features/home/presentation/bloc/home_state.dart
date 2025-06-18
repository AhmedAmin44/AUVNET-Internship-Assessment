import 'package:auvnet_internship_assessment/features/home/domain/entities/home_entity.dart';
class HomeState {
  final bool isLoading;
  final HomeEntity? data;
  final String? error;

  const HomeState({
    this.isLoading = false,
    this.data,
    this.error,
  });

  HomeState copyWith({
    bool? isLoading,
    HomeEntity? data,
    String? error,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error,
    );
  }
}
