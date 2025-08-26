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
    required this.selectedStage,
  });

  UserStats? findByStage() {
    return stats.firstWhereOrNull((e) => e.stage == selectedStage);
  }

  final List<UserStats> stats;
  final UserStage selectedStage;

  UserStatsSuccessState copyWith({
    List<UserStats>? stats,
    UserStage? selectedStage,
  }) {
    return UserStatsSuccessState(
      stats: stats ?? this.stats,
      selectedStage: selectedStage ?? this.selectedStage,
    );
  }

  @override
  List<Object?> get props => [stats, selectedStage];
}
