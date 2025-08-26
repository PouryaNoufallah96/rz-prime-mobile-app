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
  String get tokenAddress => throw _privateConstructorUsedError;
  String get tokenName => throw _privateConstructorUsedError;
  String get tokenNetwork => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double get liquidityUsd => throw _privateConstructorUsedError;
  double get volume24hUsd => throw _privateConstructorUsedError;
  double get reserveBaseUsd => throw _privateConstructorUsedError;
  double get reserveQuoteUsd => throw _privateConstructorUsedError;
  double get quoteTokenPriceUsd => throw _privateConstructorUsedError;
  String get fakeAddress => throw _privateConstructorUsedError;
  String get lastUpdated => throw _privateConstructorUsedError;

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
      {String tokenAddress,
      String tokenName,
      String tokenNetwork,
      double price,
      double quantity,
      double liquidityUsd,
      double volume24hUsd,
      double reserveBaseUsd,
      double reserveQuoteUsd,
      double quoteTokenPriceUsd,
      String fakeAddress,
      String lastUpdated});
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
    Object? tokenAddress = null,
    Object? tokenName = null,
    Object? tokenNetwork = null,
    Object? price = null,
    Object? quantity = null,
    Object? liquidityUsd = null,
    Object? volume24hUsd = null,
    Object? reserveBaseUsd = null,
    Object? reserveQuoteUsd = null,
    Object? quoteTokenPriceUsd = null,
    Object? fakeAddress = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      tokenAddress: null == tokenAddress
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String,
      tokenName: null == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String,
      tokenNetwork: null == tokenNetwork
          ? _value.tokenNetwork
          : tokenNetwork // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      liquidityUsd: null == liquidityUsd
          ? _value.liquidityUsd
          : liquidityUsd // ignore: cast_nullable_to_non_nullable
              as double,
      volume24hUsd: null == volume24hUsd
          ? _value.volume24hUsd
          : volume24hUsd // ignore: cast_nullable_to_non_nullable
              as double,
      reserveBaseUsd: null == reserveBaseUsd
          ? _value.reserveBaseUsd
          : reserveBaseUsd // ignore: cast_nullable_to_non_nullable
              as double,
      reserveQuoteUsd: null == reserveQuoteUsd
          ? _value.reserveQuoteUsd
          : reserveQuoteUsd // ignore: cast_nullable_to_non_nullable
              as double,
      quoteTokenPriceUsd: null == quoteTokenPriceUsd
          ? _value.quoteTokenPriceUsd
          : quoteTokenPriceUsd // ignore: cast_nullable_to_non_nullable
              as double,
      fakeAddress: null == fakeAddress
          ? _value.fakeAddress
          : fakeAddress // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
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
      {String tokenAddress,
      String tokenName,
      String tokenNetwork,
      double price,
      double quantity,
      double liquidityUsd,
      double volume24hUsd,
      double reserveBaseUsd,
      double reserveQuoteUsd,
      double quoteTokenPriceUsd,
      String fakeAddress,
      String lastUpdated});
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
    Object? tokenAddress = null,
    Object? tokenName = null,
    Object? tokenNetwork = null,
    Object? price = null,
    Object? quantity = null,
    Object? liquidityUsd = null,
    Object? volume24hUsd = null,
    Object? reserveBaseUsd = null,
    Object? reserveQuoteUsd = null,
    Object? quoteTokenPriceUsd = null,
    Object? fakeAddress = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$InventoryModelImpl(
      tokenAddress: null == tokenAddress
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String,
      tokenName: null == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String,
      tokenNetwork: null == tokenNetwork
          ? _value.tokenNetwork
          : tokenNetwork // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      liquidityUsd: null == liquidityUsd
          ? _value.liquidityUsd
          : liquidityUsd // ignore: cast_nullable_to_non_nullable
              as double,
      volume24hUsd: null == volume24hUsd
          ? _value.volume24hUsd
          : volume24hUsd // ignore: cast_nullable_to_non_nullable
              as double,
      reserveBaseUsd: null == reserveBaseUsd
          ? _value.reserveBaseUsd
          : reserveBaseUsd // ignore: cast_nullable_to_non_nullable
              as double,
      reserveQuoteUsd: null == reserveQuoteUsd
          ? _value.reserveQuoteUsd
          : reserveQuoteUsd // ignore: cast_nullable_to_non_nullable
              as double,
      quoteTokenPriceUsd: null == quoteTokenPriceUsd
          ? _value.quoteTokenPriceUsd
          : quoteTokenPriceUsd // ignore: cast_nullable_to_non_nullable
              as double,
      fakeAddress: null == fakeAddress
          ? _value.fakeAddress
          : fakeAddress // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryModelImpl implements _InventoryModel {
  const _$InventoryModelImpl(
      {required this.tokenAddress,
      required this.tokenName,
      required this.tokenNetwork,
      required this.price,
      required this.quantity,
      required this.liquidityUsd,
      required this.volume24hUsd,
      required this.reserveBaseUsd,
      required this.reserveQuoteUsd,
      required this.quoteTokenPriceUsd,
      required this.fakeAddress,
      required this.lastUpdated});

  factory _$InventoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryModelImplFromJson(json);

  @override
  final String tokenAddress;
  @override
  final String tokenName;
  @override
  final String tokenNetwork;
  @override
  final double price;
  @override
  final double quantity;
  @override
  final double liquidityUsd;
  @override
  final double volume24hUsd;
  @override
  final double reserveBaseUsd;
  @override
  final double reserveQuoteUsd;
  @override
  final double quoteTokenPriceUsd;
  @override
  final String fakeAddress;
  @override
  final String lastUpdated;

  @override
  String toString() {
    return 'InventoryModel(tokenAddress: $tokenAddress, tokenName: $tokenName, tokenNetwork: $tokenNetwork, price: $price, quantity: $quantity, liquidityUsd: $liquidityUsd, volume24hUsd: $volume24hUsd, reserveBaseUsd: $reserveBaseUsd, reserveQuoteUsd: $reserveQuoteUsd, quoteTokenPriceUsd: $quoteTokenPriceUsd, fakeAddress: $fakeAddress, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryModelImpl &&
            (identical(other.tokenAddress, tokenAddress) ||
                other.tokenAddress == tokenAddress) &&
            (identical(other.tokenName, tokenName) ||
                other.tokenName == tokenName) &&
            (identical(other.tokenNetwork, tokenNetwork) ||
                other.tokenNetwork == tokenNetwork) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.liquidityUsd, liquidityUsd) ||
                other.liquidityUsd == liquidityUsd) &&
            (identical(other.volume24hUsd, volume24hUsd) ||
                other.volume24hUsd == volume24hUsd) &&
            (identical(other.reserveBaseUsd, reserveBaseUsd) ||
                other.reserveBaseUsd == reserveBaseUsd) &&
            (identical(other.reserveQuoteUsd, reserveQuoteUsd) ||
                other.reserveQuoteUsd == reserveQuoteUsd) &&
            (identical(other.quoteTokenPriceUsd, quoteTokenPriceUsd) ||
                other.quoteTokenPriceUsd == quoteTokenPriceUsd) &&
            (identical(other.fakeAddress, fakeAddress) ||
                other.fakeAddress == fakeAddress) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      tokenAddress,
      tokenName,
      tokenNetwork,
      price,
      quantity,
      liquidityUsd,
      volume24hUsd,
      reserveBaseUsd,
      reserveQuoteUsd,
      quoteTokenPriceUsd,
      fakeAddress,
      lastUpdated);

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
      {required final String tokenAddress,
      required final String tokenName,
      required final String tokenNetwork,
      required final double price,
      required final double quantity,
      required final double liquidityUsd,
      required final double volume24hUsd,
      required final double reserveBaseUsd,
      required final double reserveQuoteUsd,
      required final double quoteTokenPriceUsd,
      required final String fakeAddress,
      required final String lastUpdated}) = _$InventoryModelImpl;

  factory _InventoryModel.fromJson(Map<String, dynamic> json) =
      _$InventoryModelImpl.fromJson;

  @override
  String get tokenAddress;
  @override
  String get tokenName;
  @override
  String get tokenNetwork;
  @override
  double get price;
  @override
  double get quantity;
  @override
  double get liquidityUsd;
  @override
  double get volume24hUsd;
  @override
  double get reserveBaseUsd;
  @override
  double get reserveQuoteUsd;
  @override
  double get quoteTokenPriceUsd;
  @override
  String get fakeAddress;
  @override
  String get lastUpdated;

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
  UserStage get stage => throw _privateConstructorUsedError;
  double get mining => throw _privateConstructorUsedError;
  double get availableLoanAmount => throw _privateConstructorUsedError;
  double get sumOfMining => throw _privateConstructorUsedError;

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
      {UserStage stage,
      double mining,
      double availableLoanAmount,
      double sumOfMining});
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
    Object? stage = null,
    Object? mining = null,
    Object? availableLoanAmount = null,
    Object? sumOfMining = null,
  }) {
    return _then(_value.copyWith(
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as UserStage,
      mining: null == mining
          ? _value.mining
          : mining // ignore: cast_nullable_to_non_nullable
              as double,
      availableLoanAmount: null == availableLoanAmount
          ? _value.availableLoanAmount
          : availableLoanAmount // ignore: cast_nullable_to_non_nullable
              as double,
      sumOfMining: null == sumOfMining
          ? _value.sumOfMining
          : sumOfMining // ignore: cast_nullable_to_non_nullable
              as double,
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
      {UserStage stage,
      double mining,
      double availableLoanAmount,
      double sumOfMining});
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
    Object? stage = null,
    Object? mining = null,
    Object? availableLoanAmount = null,
    Object? sumOfMining = null,
  }) {
    return _then(_$UserStatsImpl(
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as UserStage,
      mining: null == mining
          ? _value.mining
          : mining // ignore: cast_nullable_to_non_nullable
              as double,
      availableLoanAmount: null == availableLoanAmount
          ? _value.availableLoanAmount
          : availableLoanAmount // ignore: cast_nullable_to_non_nullable
              as double,
      sumOfMining: null == sumOfMining
          ? _value.sumOfMining
          : sumOfMining // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStatsImpl implements _UserStats {
  const _$UserStatsImpl(
      {required this.stage,
      required this.mining,
      required this.availableLoanAmount,
      required this.sumOfMining});

  factory _$UserStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatsImplFromJson(json);

  @override
  final UserStage stage;
  @override
  final double mining;
  @override
  final double availableLoanAmount;
  @override
  final double sumOfMining;

  @override
  String toString() {
    return 'UserStats(stage: $stage, mining: $mining, availableLoanAmount: $availableLoanAmount, sumOfMining: $sumOfMining)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatsImpl &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.mining, mining) || other.mining == mining) &&
            (identical(other.availableLoanAmount, availableLoanAmount) ||
                other.availableLoanAmount == availableLoanAmount) &&
            (identical(other.sumOfMining, sumOfMining) ||
                other.sumOfMining == sumOfMining));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, stage, mining, availableLoanAmount, sumOfMining);

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
      {required final UserStage stage,
      required final double mining,
      required final double availableLoanAmount,
      required final double sumOfMining}) = _$UserStatsImpl;

  factory _UserStats.fromJson(Map<String, dynamic> json) =
      _$UserStatsImpl.fromJson;

  @override
  UserStage get stage;
  @override
  double get mining;
  @override
  double get availableLoanAmount;
  @override
  double get sumOfMining;

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStatsImplCopyWith<_$UserStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
