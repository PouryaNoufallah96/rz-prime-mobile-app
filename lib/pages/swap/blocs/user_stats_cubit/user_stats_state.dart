part of 'user_stats_cubit.dart';

sealed class UserStatsState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class UserStatsInitialState extends UserStatsState {}

class UserStatsInProgressState extends UserStatsState {}

class UserStatsSuccessState extends UserStatsState {
  UserStatsSuccessState({
    required this.stats,
  });

  final UserStats? stats;

  @override
  List<Object?> get props => [stats];
}
