part of 'home_bloc.dart';

enum ScreenStatus {
  init,
  loading,
  categorySuccess,
  categoryFailure,
  brandsSuccess,
  brandsFailure,
  changeNavBar
}

class HomeState {
  final ScreenStatus? screenStatus;
  final CategoryEntity? categoryEntity;
  final CategoryEntity? brandsEntity;
  final Failures? failures;
  final int? index;

  HomeState(
      {this.screenStatus,
      this.categoryEntity,
      this.brandsEntity,
      this.failures,
      this.index});
  HomeState copyWith(
      {ScreenStatus? screenStatus,
      CategoryEntity? categoryEntity,
      CategoryEntity? brandsEntity,
      Failures? failures}) {
    return HomeState(
        screenStatus: screenStatus ?? this.screenStatus,
        categoryEntity: categoryEntity ?? this.categoryEntity,
        failures: failures ?? this.failures,
        brandsEntity: brandsEntity ?? this.brandsEntity);
  }
}

class HomeInitial extends HomeState {
  HomeInitial({required super.index})
      : super(
          screenStatus: ScreenStatus.init,
        );
}
