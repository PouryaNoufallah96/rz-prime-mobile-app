import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:gainx/core/services/stats_service/models.dart';
import 'package:gainx/core/services/stats_service/stats_service.dart';

part 'user_stats_state.dart';

class UserStatsCubit extends Cubit<UserStatsState> {
  UserStatsCubit({
    required StatsService statsService,
  })  : _statsService = statsService,
        super(UserStatsInitialState());

  final StatsService _statsService;

  Future<void> fetch({bool skipLoading = false}) async {
    if (!skipLoading) {
      emit(UserStatsInProgressState());
    }

    final stats = await _statsService.userStats();

    if (state is UserStatsSuccessState) {
      emit(
        (state as UserStatsSuccessState).copyWith(
          stats: stats,
        ),
      );
    } else {
      emit(
        UserStatsSuccessState(
          stats: stats,
          selectedStage: stats.first.stage,
        ),
      );
    }
  }

  Future<void> changeStage(UserStage stage) async {
    if (state is UserStatsSuccessState) {
      emit(
        (state as UserStatsSuccessState).copyWith(
          selectedStage: stage,
        ),
      );
    }
  }
}
