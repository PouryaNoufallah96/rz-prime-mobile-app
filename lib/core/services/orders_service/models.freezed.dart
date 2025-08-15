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

HistoryOrder _$HistoryOrderFromJson(Map<String, dynamic> json) {
  return _HistoryOrder.fromJson(json);
}

/// @nodoc
mixin _$HistoryOrder {
  String get asset => throw _privateConstructorUsedError;
  String get assetAddress => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  double get loanAmount => throw _privateConstructorUsedError;
  double get numberOfMonths => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  String get payoffDate => throw _privateConstructorUsedError;
  double get profitRatePerMonth => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  String get stage => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String get walletAddress => throw _privateConstructorUsedError;
  double get assetPrice => throw _privateConstructorUsedError;
  double get finalAmount => throw _privateConstructorUsedError;
  String get registeredAmount => throw _privateConstructorUsedError;
  FinalizedOrder? get finalizedOrder => throw _privateConstructorUsedError;
  String? get transactionHash => throw _privateConstructorUsedError;

  /// Serializes this HistoryOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HistoryOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HistoryOrderCopyWith<HistoryOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryOrderCopyWith<$Res> {
  factory $HistoryOrderCopyWith(
          HistoryOrder value, $Res Function(HistoryOrder) then) =
      _$HistoryOrderCopyWithImpl<$Res, HistoryOrder>;
  @useResult
  $Res call(
      {String asset,
      String assetAddress,
      String date,
      double loanAmount,
      double numberOfMonths,
      String orderId,
      String payoffDate,
      double profitRatePerMonth,
      double quantity,
      String stage,
      String time,
      String walletAddress,
      double assetPrice,
      double finalAmount,
      String registeredAmount,
      FinalizedOrder? finalizedOrder,
      String? transactionHash});

  $FinalizedOrderCopyWith<$Res>? get finalizedOrder;
}

/// @nodoc
class _$HistoryOrderCopyWithImpl<$Res, $Val extends HistoryOrder>
    implements $HistoryOrderCopyWith<$Res> {
  _$HistoryOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? asset = null,
    Object? assetAddress = null,
    Object? date = null,
    Object? loanAmount = null,
    Object? numberOfMonths = null,
    Object? orderId = null,
    Object? payoffDate = null,
    Object? profitRatePerMonth = null,
    Object? quantity = null,
    Object? stage = null,
    Object? time = null,
    Object? walletAddress = null,
    Object? assetPrice = null,
    Object? finalAmount = null,
    Object? registeredAmount = null,
    Object? finalizedOrder = freezed,
    Object? transactionHash = freezed,
  }) {
    return _then(_value.copyWith(
      asset: null == asset
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as String,
      assetAddress: null == assetAddress
          ? _value.assetAddress
          : assetAddress // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      loanAmount: null == loanAmount
          ? _value.loanAmount
          : loanAmount // ignore: cast_nullable_to_non_nullable
              as double,
      numberOfMonths: null == numberOfMonths
          ? _value.numberOfMonths
          : numberOfMonths // ignore: cast_nullable_to_non_nullable
              as double,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      payoffDate: null == payoffDate
          ? _value.payoffDate
          : payoffDate // ignore: cast_nullable_to_non_nullable
              as String,
      profitRatePerMonth: null == profitRatePerMonth
          ? _value.profitRatePerMonth
          : profitRatePerMonth // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      assetPrice: null == assetPrice
          ? _value.assetPrice
          : assetPrice // ignore: cast_nullable_to_non_nullable
              as double,
      finalAmount: null == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      registeredAmount: null == registeredAmount
          ? _value.registeredAmount
          : registeredAmount // ignore: cast_nullable_to_non_nullable
              as String,
      finalizedOrder: freezed == finalizedOrder
          ? _value.finalizedOrder
          : finalizedOrder // ignore: cast_nullable_to_non_nullable
              as FinalizedOrder?,
      transactionHash: freezed == transactionHash
          ? _value.transactionHash
          : transactionHash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of HistoryOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FinalizedOrderCopyWith<$Res>? get finalizedOrder {
    if (_value.finalizedOrder == null) {
      return null;
    }

    return $FinalizedOrderCopyWith<$Res>(_value.finalizedOrder!, (value) {
      return _then(_value.copyWith(finalizedOrder: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HistoryOrderImplCopyWith<$Res>
    implements $HistoryOrderCopyWith<$Res> {
  factory _$$HistoryOrderImplCopyWith(
          _$HistoryOrderImpl value, $Res Function(_$HistoryOrderImpl) then) =
      __$$HistoryOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String asset,
      String assetAddress,
      String date,
      double loanAmount,
      double numberOfMonths,
      String orderId,
      String payoffDate,
      double profitRatePerMonth,
      double quantity,
      String stage,
      String time,
      String walletAddress,
      double assetPrice,
      double finalAmount,
      String registeredAmount,
      FinalizedOrder? finalizedOrder,
      String? transactionHash});

  @override
  $FinalizedOrderCopyWith<$Res>? get finalizedOrder;
}

/// @nodoc
class __$$HistoryOrderImplCopyWithImpl<$Res>
    extends _$HistoryOrderCopyWithImpl<$Res, _$HistoryOrderImpl>
    implements _$$HistoryOrderImplCopyWith<$Res> {
  __$$HistoryOrderImplCopyWithImpl(
      _$HistoryOrderImpl _value, $Res Function(_$HistoryOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoryOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? asset = null,
    Object? assetAddress = null,
    Object? date = null,
    Object? loanAmount = null,
    Object? numberOfMonths = null,
    Object? orderId = null,
    Object? payoffDate = null,
    Object? profitRatePerMonth = null,
    Object? quantity = null,
    Object? stage = null,
    Object? time = null,
    Object? walletAddress = null,
    Object? assetPrice = null,
    Object? finalAmount = null,
    Object? registeredAmount = null,
    Object? finalizedOrder = freezed,
    Object? transactionHash = freezed,
  }) {
    return _then(_$HistoryOrderImpl(
      asset: null == asset
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as String,
      assetAddress: null == assetAddress
          ? _value.assetAddress
          : assetAddress // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      loanAmount: null == loanAmount
          ? _value.loanAmount
          : loanAmount // ignore: cast_nullable_to_non_nullable
              as double,
      numberOfMonths: null == numberOfMonths
          ? _value.numberOfMonths
          : numberOfMonths // ignore: cast_nullable_to_non_nullable
              as double,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      payoffDate: null == payoffDate
          ? _value.payoffDate
          : payoffDate // ignore: cast_nullable_to_non_nullable
              as String,
      profitRatePerMonth: null == profitRatePerMonth
          ? _value.profitRatePerMonth
          : profitRatePerMonth // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      assetPrice: null == assetPrice
          ? _value.assetPrice
          : assetPrice // ignore: cast_nullable_to_non_nullable
              as double,
      finalAmount: null == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      registeredAmount: null == registeredAmount
          ? _value.registeredAmount
          : registeredAmount // ignore: cast_nullable_to_non_nullable
              as String,
      finalizedOrder: freezed == finalizedOrder
          ? _value.finalizedOrder
          : finalizedOrder // ignore: cast_nullable_to_non_nullable
              as FinalizedOrder?,
      transactionHash: freezed == transactionHash
          ? _value.transactionHash
          : transactionHash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$HistoryOrderImpl implements _HistoryOrder {
  const _$HistoryOrderImpl(
      {required this.asset,
      required this.assetAddress,
      required this.date,
      required this.loanAmount,
      required this.numberOfMonths,
      required this.orderId,
      required this.payoffDate,
      required this.profitRatePerMonth,
      required this.quantity,
      required this.stage,
      required this.time,
      required this.walletAddress,
      required this.assetPrice,
      required this.finalAmount,
      required this.registeredAmount,
      this.finalizedOrder,
      this.transactionHash});

  factory _$HistoryOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryOrderImplFromJson(json);

  @override
  final String asset;
  @override
  final String assetAddress;
  @override
  final String date;
  @override
  final double loanAmount;
  @override
  final double numberOfMonths;
  @override
  final String orderId;
  @override
  final String payoffDate;
  @override
  final double profitRatePerMonth;
  @override
  final double quantity;
  @override
  final String stage;
  @override
  final String time;
  @override
  final String walletAddress;
  @override
  final double assetPrice;
  @override
  final double finalAmount;
  @override
  final String registeredAmount;
  @override
  final FinalizedOrder? finalizedOrder;
  @override
  final String? transactionHash;

  @override
  String toString() {
    return 'HistoryOrder(asset: $asset, assetAddress: $assetAddress, date: $date, loanAmount: $loanAmount, numberOfMonths: $numberOfMonths, orderId: $orderId, payoffDate: $payoffDate, profitRatePerMonth: $profitRatePerMonth, quantity: $quantity, stage: $stage, time: $time, walletAddress: $walletAddress, assetPrice: $assetPrice, finalAmount: $finalAmount, registeredAmount: $registeredAmount, finalizedOrder: $finalizedOrder, transactionHash: $transactionHash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryOrderImpl &&
            (identical(other.asset, asset) || other.asset == asset) &&
            (identical(other.assetAddress, assetAddress) ||
                other.assetAddress == assetAddress) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.loanAmount, loanAmount) ||
                other.loanAmount == loanAmount) &&
            (identical(other.numberOfMonths, numberOfMonths) ||
                other.numberOfMonths == numberOfMonths) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.payoffDate, payoffDate) ||
                other.payoffDate == payoffDate) &&
            (identical(other.profitRatePerMonth, profitRatePerMonth) ||
                other.profitRatePerMonth == profitRatePerMonth) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.walletAddress, walletAddress) ||
                other.walletAddress == walletAddress) &&
            (identical(other.assetPrice, assetPrice) ||
                other.assetPrice == assetPrice) &&
            (identical(other.finalAmount, finalAmount) ||
                other.finalAmount == finalAmount) &&
            (identical(other.registeredAmount, registeredAmount) ||
                other.registeredAmount == registeredAmount) &&
            (identical(other.finalizedOrder, finalizedOrder) ||
                other.finalizedOrder == finalizedOrder) &&
            (identical(other.transactionHash, transactionHash) ||
                other.transactionHash == transactionHash));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      asset,
      assetAddress,
      date,
      loanAmount,
      numberOfMonths,
      orderId,
      payoffDate,
      profitRatePerMonth,
      quantity,
      stage,
      time,
      walletAddress,
      assetPrice,
      finalAmount,
      registeredAmount,
      finalizedOrder,
      transactionHash);

  /// Create a copy of HistoryOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryOrderImplCopyWith<_$HistoryOrderImpl> get copyWith =>
      __$$HistoryOrderImplCopyWithImpl<_$HistoryOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryOrderImplToJson(
      this,
    );
  }
}

abstract class _HistoryOrder implements HistoryOrder {
  const factory _HistoryOrder(
      {required final String asset,
      required final String assetAddress,
      required final String date,
      required final double loanAmount,
      required final double numberOfMonths,
      required final String orderId,
      required final String payoffDate,
      required final double profitRatePerMonth,
      required final double quantity,
      required final String stage,
      required final String time,
      required final String walletAddress,
      required final double assetPrice,
      required final double finalAmount,
      required final String registeredAmount,
      final FinalizedOrder? finalizedOrder,
      final String? transactionHash}) = _$HistoryOrderImpl;

  factory _HistoryOrder.fromJson(Map<String, dynamic> json) =
      _$HistoryOrderImpl.fromJson;

  @override
  String get asset;
  @override
  String get assetAddress;
  @override
  String get date;
  @override
  double get loanAmount;
  @override
  double get numberOfMonths;
  @override
  String get orderId;
  @override
  String get payoffDate;
  @override
  double get profitRatePerMonth;
  @override
  double get quantity;
  @override
  String get stage;
  @override
  String get time;
  @override
  String get walletAddress;
  @override
  double get assetPrice;
  @override
  double get finalAmount;
  @override
  String get registeredAmount;
  @override
  FinalizedOrder? get finalizedOrder;
  @override
  String? get transactionHash;

  /// Create a copy of HistoryOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryOrderImplCopyWith<_$HistoryOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FinalizedOrder _$FinalizedOrderFromJson(Map<String, dynamic> json) {
  return _FinalizedOrder.fromJson(json);
}

/// @nodoc
mixin _$FinalizedOrder {
  String get paymentStatus => throw _privateConstructorUsedError;
  double get finalizedAmount => throw _privateConstructorUsedError;
  String get finalizedDate => throw _privateConstructorUsedError;

  /// Serializes this FinalizedOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FinalizedOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinalizedOrderCopyWith<FinalizedOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinalizedOrderCopyWith<$Res> {
  factory $FinalizedOrderCopyWith(
          FinalizedOrder value, $Res Function(FinalizedOrder) then) =
      _$FinalizedOrderCopyWithImpl<$Res, FinalizedOrder>;
  @useResult
  $Res call(
      {String paymentStatus, double finalizedAmount, String finalizedDate});
}

/// @nodoc
class _$FinalizedOrderCopyWithImpl<$Res, $Val extends FinalizedOrder>
    implements $FinalizedOrderCopyWith<$Res> {
  _$FinalizedOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinalizedOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentStatus = null,
    Object? finalizedAmount = null,
    Object? finalizedDate = null,
  }) {
    return _then(_value.copyWith(
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      finalizedAmount: null == finalizedAmount
          ? _value.finalizedAmount
          : finalizedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      finalizedDate: null == finalizedDate
          ? _value.finalizedDate
          : finalizedDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FinalizedOrderImplCopyWith<$Res>
    implements $FinalizedOrderCopyWith<$Res> {
  factory _$$FinalizedOrderImplCopyWith(_$FinalizedOrderImpl value,
          $Res Function(_$FinalizedOrderImpl) then) =
      __$$FinalizedOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String paymentStatus, double finalizedAmount, String finalizedDate});
}

/// @nodoc
class __$$FinalizedOrderImplCopyWithImpl<$Res>
    extends _$FinalizedOrderCopyWithImpl<$Res, _$FinalizedOrderImpl>
    implements _$$FinalizedOrderImplCopyWith<$Res> {
  __$$FinalizedOrderImplCopyWithImpl(
      _$FinalizedOrderImpl _value, $Res Function(_$FinalizedOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinalizedOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentStatus = null,
    Object? finalizedAmount = null,
    Object? finalizedDate = null,
  }) {
    return _then(_$FinalizedOrderImpl(
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      finalizedAmount: null == finalizedAmount
          ? _value.finalizedAmount
          : finalizedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      finalizedDate: null == finalizedDate
          ? _value.finalizedDate
          : finalizedDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$FinalizedOrderImpl implements _FinalizedOrder {
  const _$FinalizedOrderImpl(
      {required this.paymentStatus,
      required this.finalizedAmount,
      required this.finalizedDate});

  factory _$FinalizedOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinalizedOrderImplFromJson(json);

  @override
  final String paymentStatus;
  @override
  final double finalizedAmount;
  @override
  final String finalizedDate;

  @override
  String toString() {
    return 'FinalizedOrder(paymentStatus: $paymentStatus, finalizedAmount: $finalizedAmount, finalizedDate: $finalizedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinalizedOrderImpl &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.finalizedAmount, finalizedAmount) ||
                other.finalizedAmount == finalizedAmount) &&
            (identical(other.finalizedDate, finalizedDate) ||
                other.finalizedDate == finalizedDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, paymentStatus, finalizedAmount, finalizedDate);

  /// Create a copy of FinalizedOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinalizedOrderImplCopyWith<_$FinalizedOrderImpl> get copyWith =>
      __$$FinalizedOrderImplCopyWithImpl<_$FinalizedOrderImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FinalizedOrderImplToJson(
      this,
    );
  }
}

abstract class _FinalizedOrder implements FinalizedOrder {
  const factory _FinalizedOrder(
      {required final String paymentStatus,
      required final double finalizedAmount,
      required final String finalizedDate}) = _$FinalizedOrderImpl;

  factory _FinalizedOrder.fromJson(Map<String, dynamic> json) =
      _$FinalizedOrderImpl.fromJson;

  @override
  String get paymentStatus;
  @override
  double get finalizedAmount;
  @override
  String get finalizedDate;

  /// Create a copy of FinalizedOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinalizedOrderImplCopyWith<_$FinalizedOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EffectivePriceModel _$EffectivePriceModelFromJson(Map<String, dynamic> json) {
  return _EffectivePriceModel.fromJson(json);
}

/// @nodoc
mixin _$EffectivePriceModel {
  double get effectiveRoughEstimationQuantity =>
      throw _privateConstructorUsedError;
  double get effectivePrice => throw _privateConstructorUsedError;

  /// Serializes this EffectivePriceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EffectivePriceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EffectivePriceModelCopyWith<EffectivePriceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EffectivePriceModelCopyWith<$Res> {
  factory $EffectivePriceModelCopyWith(
          EffectivePriceModel value, $Res Function(EffectivePriceModel) then) =
      _$EffectivePriceModelCopyWithImpl<$Res, EffectivePriceModel>;
  @useResult
  $Res call({double effectiveRoughEstimationQuantity, double effectivePrice});
}

/// @nodoc
class _$EffectivePriceModelCopyWithImpl<$Res, $Val extends EffectivePriceModel>
    implements $EffectivePriceModelCopyWith<$Res> {
  _$EffectivePriceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EffectivePriceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? effectiveRoughEstimationQuantity = null,
    Object? effectivePrice = null,
  }) {
    return _then(_value.copyWith(
      effectiveRoughEstimationQuantity: null == effectiveRoughEstimationQuantity
          ? _value.effectiveRoughEstimationQuantity
          : effectiveRoughEstimationQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      effectivePrice: null == effectivePrice
          ? _value.effectivePrice
          : effectivePrice // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EffectivePriceModelImplCopyWith<$Res>
    implements $EffectivePriceModelCopyWith<$Res> {
  factory _$$EffectivePriceModelImplCopyWith(_$EffectivePriceModelImpl value,
          $Res Function(_$EffectivePriceModelImpl) then) =
      __$$EffectivePriceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double effectiveRoughEstimationQuantity, double effectivePrice});
}

/// @nodoc
class __$$EffectivePriceModelImplCopyWithImpl<$Res>
    extends _$EffectivePriceModelCopyWithImpl<$Res, _$EffectivePriceModelImpl>
    implements _$$EffectivePriceModelImplCopyWith<$Res> {
  __$$EffectivePriceModelImplCopyWithImpl(_$EffectivePriceModelImpl _value,
      $Res Function(_$EffectivePriceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EffectivePriceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? effectiveRoughEstimationQuantity = null,
    Object? effectivePrice = null,
  }) {
    return _then(_$EffectivePriceModelImpl(
      effectiveRoughEstimationQuantity: null == effectiveRoughEstimationQuantity
          ? _value.effectiveRoughEstimationQuantity
          : effectiveRoughEstimationQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      effectivePrice: null == effectivePrice
          ? _value.effectivePrice
          : effectivePrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$EffectivePriceModelImpl implements _EffectivePriceModel {
  const _$EffectivePriceModelImpl(
      {required this.effectiveRoughEstimationQuantity,
      required this.effectivePrice});

  factory _$EffectivePriceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EffectivePriceModelImplFromJson(json);

  @override
  final double effectiveRoughEstimationQuantity;
  @override
  final double effectivePrice;

  @override
  String toString() {
    return 'EffectivePriceModel(effectiveRoughEstimationQuantity: $effectiveRoughEstimationQuantity, effectivePrice: $effectivePrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EffectivePriceModelImpl &&
            (identical(other.effectiveRoughEstimationQuantity,
                    effectiveRoughEstimationQuantity) ||
                other.effectiveRoughEstimationQuantity ==
                    effectiveRoughEstimationQuantity) &&
            (identical(other.effectivePrice, effectivePrice) ||
                other.effectivePrice == effectivePrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, effectiveRoughEstimationQuantity, effectivePrice);

  /// Create a copy of EffectivePriceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EffectivePriceModelImplCopyWith<_$EffectivePriceModelImpl> get copyWith =>
      __$$EffectivePriceModelImplCopyWithImpl<_$EffectivePriceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EffectivePriceModelImplToJson(
      this,
    );
  }
}

abstract class _EffectivePriceModel implements EffectivePriceModel {
  const factory _EffectivePriceModel(
      {required final double effectiveRoughEstimationQuantity,
      required final double effectivePrice}) = _$EffectivePriceModelImpl;

  factory _EffectivePriceModel.fromJson(Map<String, dynamic> json) =
      _$EffectivePriceModelImpl.fromJson;

  @override
  double get effectiveRoughEstimationQuantity;
  @override
  double get effectivePrice;

  /// Create a copy of EffectivePriceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EffectivePriceModelImplCopyWith<_$EffectivePriceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
