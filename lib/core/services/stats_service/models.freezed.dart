// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InventoryModel _$InventoryModelFromJson(Map<String, dynamic> json) {
  return _InventoryModel.fromJson(json);
}

/// @nodoc
mixin _$InventoryModel {
  String get assetAddress => throw _privateConstructorUsedError;
  String get assetName => throw _privateConstructorUsedError;
  double get assetPrice => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double get liquidityUsd => throw _privateConstructorUsedError;
  double get volume_24hUsd => throw _privateConstructorUsedError;
  double get poolFeeRate => throw _privateConstructorUsedError;
  double get reserveBaseUsd => throw _privateConstructorUsedError;
  double get reserveQuoteUsd => throw _privateConstructorUsedError;
  String get fakeAddress => throw _privateConstructorUsedError;
  String get lastUpdateDateTime => throw _privateConstructorUsedError;

  /// Serializes this InventoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InventoryModelCopyWith<InventoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryModelCopyWith<$Res> {
  factory $InventoryModelCopyWith(
          InventoryModel value, $Res Function(InventoryModel) then) =
      _$InventoryModelCopyWithImpl<$Res, InventoryModel>;
  @useResult
  $Res call(
      {String assetAddress,
      String assetName,
      double assetPrice,
      double quantity,
      double liquidityUsd,
      double volume_24hUsd,
      double poolFeeRate,
      double reserveBaseUsd,
      double reserveQuoteUsd,
      String fakeAddress,
      String lastUpdateDateTime});
}

/// @nodoc
class _$InventoryModelCopyWithImpl<$Res, $Val extends InventoryModel>
    implements $InventoryModelCopyWith<$Res> {
  _$InventoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetAddress = null,
    Object? assetName = null,
    Object? assetPrice = null,
    Object? quantity = null,
    Object? liquidityUsd = null,
    Object? volume_24hUsd = null,
    Object? poolFeeRate = null,
    Object? reserveBaseUsd = null,
    Object? reserveQuoteUsd = null,
    Object? fakeAddress = null,
    Object? lastUpdateDateTime = null,
  }) {
    return _then(_value.copyWith(
      assetAddress: null == assetAddress
          ? _value.assetAddress
          : assetAddress // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      assetPrice: null == assetPrice
          ? _value.assetPrice
          : assetPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      liquidityUsd: null == liquidityUsd
          ? _value.liquidityUsd
          : liquidityUsd // ignore: cast_nullable_to_non_nullable
              as double,
      volume_24hUsd: null == volume_24hUsd
          ? _value.volume_24hUsd
          : volume_24hUsd // ignore: cast_nullable_to_non_nullable
              as double,
      poolFeeRate: null == poolFeeRate
          ? _value.poolFeeRate
          : poolFeeRate // ignore: cast_nullable_to_non_nullable
              as double,
      reserveBaseUsd: null == reserveBaseUsd
          ? _value.reserveBaseUsd
          : reserveBaseUsd // ignore: cast_nullable_to_non_nullable
              as double,
      reserveQuoteUsd: null == reserveQuoteUsd
          ? _value.reserveQuoteUsd
          : reserveQuoteUsd // ignore: cast_nullable_to_non_nullable
              as double,
      fakeAddress: null == fakeAddress
          ? _value.fakeAddress
          : fakeAddress // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdateDateTime: null == lastUpdateDateTime
          ? _value.lastUpdateDateTime
          : lastUpdateDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryModelImplCopyWith<$Res>
    implements $InventoryModelCopyWith<$Res> {
  factory _$$InventoryModelImplCopyWith(_$InventoryModelImpl value,
          $Res Function(_$InventoryModelImpl) then) =
      __$$InventoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String assetAddress,
      String assetName,
      double assetPrice,
      double quantity,
      double liquidityUsd,
      double volume_24hUsd,
      double poolFeeRate,
      double reserveBaseUsd,
      double reserveQuoteUsd,
      String fakeAddress,
      String lastUpdateDateTime});
}

/// @nodoc
class __$$InventoryModelImplCopyWithImpl<$Res>
    extends _$InventoryModelCopyWithImpl<$Res, _$InventoryModelImpl>
    implements _$$InventoryModelImplCopyWith<$Res> {
  __$$InventoryModelImplCopyWithImpl(
      _$InventoryModelImpl _value, $Res Function(_$InventoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetAddress = null,
    Object? assetName = null,
    Object? assetPrice = null,
    Object? quantity = null,
    Object? liquidityUsd = null,
    Object? volume_24hUsd = null,
    Object? poolFeeRate = null,
    Object? reserveBaseUsd = null,
    Object? reserveQuoteUsd = null,
    Object? fakeAddress = null,
    Object? lastUpdateDateTime = null,
  }) {
    return _then(_$InventoryModelImpl(
      assetAddress: null == assetAddress
          ? _value.assetAddress
          : assetAddress // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      assetPrice: null == assetPrice
          ? _value.assetPrice
          : assetPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      liquidityUsd: null == liquidityUsd
          ? _value.liquidityUsd
          : liquidityUsd // ignore: cast_nullable_to_non_nullable
              as double,
      volume_24hUsd: null == volume_24hUsd
          ? _value.volume_24hUsd
          : volume_24hUsd // ignore: cast_nullable_to_non_nullable
              as double,
      poolFeeRate: null == poolFeeRate
          ? _value.poolFeeRate
          : poolFeeRate // ignore: cast_nullable_to_non_nullable
              as double,
      reserveBaseUsd: null == reserveBaseUsd
          ? _value.reserveBaseUsd
          : reserveBaseUsd // ignore: cast_nullable_to_non_nullable
              as double,
      reserveQuoteUsd: null == reserveQuoteUsd
          ? _value.reserveQuoteUsd
          : reserveQuoteUsd // ignore: cast_nullable_to_non_nullable
              as double,
      fakeAddress: null == fakeAddress
          ? _value.fakeAddress
          : fakeAddress // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdateDateTime: null == lastUpdateDateTime
          ? _value.lastUpdateDateTime
          : lastUpdateDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$InventoryModelImpl implements _InventoryModel {
  const _$InventoryModelImpl(
      {required this.assetAddress,
      required this.assetName,
      required this.assetPrice,
      required this.quantity,
      required this.liquidityUsd,
      required this.volume_24hUsd,
      required this.poolFeeRate,
      required this.reserveBaseUsd,
      required this.reserveQuoteUsd,
      required this.fakeAddress,
      required this.lastUpdateDateTime});

  factory _$InventoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryModelImplFromJson(json);

  @override
  final String assetAddress;
  @override
  final String assetName;
  @override
  final double assetPrice;
  @override
  final double quantity;
  @override
  final double liquidityUsd;
  @override
  final double volume_24hUsd;
  @override
  final double poolFeeRate;
  @override
  final double reserveBaseUsd;
  @override
  final double reserveQuoteUsd;
  @override
  final String fakeAddress;
  @override
  final String lastUpdateDateTime;

  @override
  String toString() {
    return 'InventoryModel(assetAddress: $assetAddress, assetName: $assetName, assetPrice: $assetPrice, quantity: $quantity, liquidityUsd: $liquidityUsd, volume_24hUsd: $volume_24hUsd, poolFeeRate: $poolFeeRate, reserveBaseUsd: $reserveBaseUsd, reserveQuoteUsd: $reserveQuoteUsd, fakeAddress: $fakeAddress, lastUpdateDateTime: $lastUpdateDateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryModelImpl &&
            (identical(other.assetAddress, assetAddress) ||
                other.assetAddress == assetAddress) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.assetPrice, assetPrice) ||
                other.assetPrice == assetPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.liquidityUsd, liquidityUsd) ||
                other.liquidityUsd == liquidityUsd) &&
            (identical(other.volume_24hUsd, volume_24hUsd) ||
                other.volume_24hUsd == volume_24hUsd) &&
            (identical(other.poolFeeRate, poolFeeRate) ||
                other.poolFeeRate == poolFeeRate) &&
            (identical(other.reserveBaseUsd, reserveBaseUsd) ||
                other.reserveBaseUsd == reserveBaseUsd) &&
            (identical(other.reserveQuoteUsd, reserveQuoteUsd) ||
                other.reserveQuoteUsd == reserveQuoteUsd) &&
            (identical(other.fakeAddress, fakeAddress) ||
                other.fakeAddress == fakeAddress) &&
            (identical(other.lastUpdateDateTime, lastUpdateDateTime) ||
                other.lastUpdateDateTime == lastUpdateDateTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      assetAddress,
      assetName,
      assetPrice,
      quantity,
      liquidityUsd,
      volume_24hUsd,
      poolFeeRate,
      reserveBaseUsd,
      reserveQuoteUsd,
      fakeAddress,
      lastUpdateDateTime);

  /// Create a copy of InventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryModelImplCopyWith<_$InventoryModelImpl> get copyWith =>
      __$$InventoryModelImplCopyWithImpl<_$InventoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryModelImplToJson(
      this,
    );
  }
}

abstract class _InventoryModel implements InventoryModel {
  const factory _InventoryModel(
      {required final String assetAddress,
      required final String assetName,
      required final double assetPrice,
      required final double quantity,
      required final double liquidityUsd,
      required final double volume_24hUsd,
      required final double poolFeeRate,
      required final double reserveBaseUsd,
      required final double reserveQuoteUsd,
      required final String fakeAddress,
      required final String lastUpdateDateTime}) = _$InventoryModelImpl;

  factory _InventoryModel.fromJson(Map<String, dynamic> json) =
      _$InventoryModelImpl.fromJson;

  @override
  String get assetAddress;
  @override
  String get assetName;
  @override
  double get assetPrice;
  @override
  double get quantity;
  @override
  double get liquidityUsd;
  @override
  double get volume_24hUsd;
  @override
  double get poolFeeRate;
  @override
  double get reserveBaseUsd;
  @override
  double get reserveQuoteUsd;
  @override
  String get fakeAddress;
  @override
  String get lastUpdateDateTime;

  /// Create a copy of InventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InventoryModelImplCopyWith<_$InventoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserStats _$UserStatsFromJson(Map<String, dynamic> json) {
  return _UserStats.fromJson(json);
}

/// @nodoc
mixin _$UserStats {
  double get customerCredit => throw _privateConstructorUsedError;
  double get sumOfMining => throw _privateConstructorUsedError;
  String get userLevel => throw _privateConstructorUsedError;
  List<String> get accessibleStages => throw _privateConstructorUsedError;

  /// Serializes this UserStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStatsCopyWith<UserStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatsCopyWith<$Res> {
  factory $UserStatsCopyWith(UserStats value, $Res Function(UserStats) then) =
      _$UserStatsCopyWithImpl<$Res, UserStats>;
  @useResult
  $Res call(
      {double customerCredit,
      double sumOfMining,
      String userLevel,
      List<String> accessibleStages});
}

/// @nodoc
class _$UserStatsCopyWithImpl<$Res, $Val extends UserStats>
    implements $UserStatsCopyWith<$Res> {
  _$UserStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCredit = null,
    Object? sumOfMining = null,
    Object? userLevel = null,
    Object? accessibleStages = null,
  }) {
    return _then(_value.copyWith(
      customerCredit: null == customerCredit
          ? _value.customerCredit
          : customerCredit // ignore: cast_nullable_to_non_nullable
              as double,
      sumOfMining: null == sumOfMining
          ? _value.sumOfMining
          : sumOfMining // ignore: cast_nullable_to_non_nullable
              as double,
      userLevel: null == userLevel
          ? _value.userLevel
          : userLevel // ignore: cast_nullable_to_non_nullable
              as String,
      accessibleStages: null == accessibleStages
          ? _value.accessibleStages
          : accessibleStages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStatsImplCopyWith<$Res>
    implements $UserStatsCopyWith<$Res> {
  factory _$$UserStatsImplCopyWith(
          _$UserStatsImpl value, $Res Function(_$UserStatsImpl) then) =
      __$$UserStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double customerCredit,
      double sumOfMining,
      String userLevel,
      List<String> accessibleStages});
}

/// @nodoc
class __$$UserStatsImplCopyWithImpl<$Res>
    extends _$UserStatsCopyWithImpl<$Res, _$UserStatsImpl>
    implements _$$UserStatsImplCopyWith<$Res> {
  __$$UserStatsImplCopyWithImpl(
      _$UserStatsImpl _value, $Res Function(_$UserStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCredit = null,
    Object? sumOfMining = null,
    Object? userLevel = null,
    Object? accessibleStages = null,
  }) {
    return _then(_$UserStatsImpl(
      customerCredit: null == customerCredit
          ? _value.customerCredit
          : customerCredit // ignore: cast_nullable_to_non_nullable
              as double,
      sumOfMining: null == sumOfMining
          ? _value.sumOfMining
          : sumOfMining // ignore: cast_nullable_to_non_nullable
              as double,
      userLevel: null == userLevel
          ? _value.userLevel
          : userLevel // ignore: cast_nullable_to_non_nullable
              as String,
      accessibleStages: null == accessibleStages
          ? _value._accessibleStages
          : accessibleStages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$UserStatsImpl implements _UserStats {
  const _$UserStatsImpl(
      {required this.customerCredit,
      required this.sumOfMining,
      required this.userLevel,
      required final List<String> accessibleStages})
      : _accessibleStages = accessibleStages;

  factory _$UserStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatsImplFromJson(json);

  @override
  final double customerCredit;
  @override
  final double sumOfMining;
  @override
  final String userLevel;
  final List<String> _accessibleStages;
  @override
  List<String> get accessibleStages {
    if (_accessibleStages is EqualUnmodifiableListView)
      return _accessibleStages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accessibleStages);
  }

  @override
  String toString() {
    return 'UserStats(customerCredit: $customerCredit, sumOfMining: $sumOfMining, userLevel: $userLevel, accessibleStages: $accessibleStages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatsImpl &&
            (identical(other.customerCredit, customerCredit) ||
                other.customerCredit == customerCredit) &&
            (identical(other.sumOfMining, sumOfMining) ||
                other.sumOfMining == sumOfMining) &&
            (identical(other.userLevel, userLevel) ||
                other.userLevel == userLevel) &&
            const DeepCollectionEquality()
                .equals(other._accessibleStages, _accessibleStages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, customerCredit, sumOfMining,
      userLevel, const DeepCollectionEquality().hash(_accessibleStages));

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatsImplCopyWith<_$UserStatsImpl> get copyWith =>
      __$$UserStatsImplCopyWithImpl<_$UserStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStatsImplToJson(
      this,
    );
  }
}

abstract class _UserStats implements UserStats {
  const factory _UserStats(
      {required final double customerCredit,
      required final double sumOfMining,
      required final String userLevel,
      required final List<String> accessibleStages}) = _$UserStatsImpl;

  factory _UserStats.fromJson(Map<String, dynamic> json) =
      _$UserStatsImpl.fromJson;

  @override
  double get customerCredit;
  @override
  double get sumOfMining;
  @override
  String get userLevel;
  @override
  List<String> get accessibleStages;

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStatsImplCopyWith<_$UserStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
