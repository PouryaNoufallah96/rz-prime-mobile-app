part of 'preferences_bloc.dart';

@JsonSerializable()
final class PreferencesState extends Equatable {
  const PreferencesState({
    this.isDark = true,
    this.isOnBoardingPass = false,
  });

  factory PreferencesState.fromJson(Map<String, dynamic> json) =>
      _$PreferencesStateFromJson(json);

  final bool isOnBoardingPass;
  final bool isDark;

  PreferencesState copyWith({
    bool? isOnBoardingPass,
    bool? isDark,
  }) {
    return PreferencesState(
      isDark: isDark ?? this.isDark,
      isOnBoardingPass: isOnBoardingPass ?? this.isOnBoardingPass,
    );
  }

  @override
  List<Object> get props => [isDark, isOnBoardingPass];

  Map<String, dynamic> toJson() => _$PreferencesStateToJson(this);
}
