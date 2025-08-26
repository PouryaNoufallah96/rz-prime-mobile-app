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
  String get orderId => throw _privateConstructorUsedError;
  String get createdMoment => throw _privateConstructorUsedError;
  String get userPublicKey => throw _privateConstructorUsedError;
  String get walletAddress => throw _privateConstructorUsedError;
  String get userStageId => throw _privateConstructorUsedError;
  String get stage => throw _privateConstructorUsedError;
  String get tokenName => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  String get tokenNetwork => throw _privateConstructorUsedError;
  String get tokenAddress => throw _privateConstructorUsedError;
  double get tokenEffectivePrice => throw _privateConstructorUsedError;
  double get loanAmount => throw _privateConstructorUsedError;
  double get loanInterestAmount => throw _privateConstructorUsedError;
  double get finalAmount => throw _privateConstructorUsedError;
  double get profitRatePerMonth => throw _privateConstructorUsedError;
  double get monthDuration => throw _privateConstructorUsedError;
  String get payOffDate => throw _privateConstructorUsedError;
  String get tokenAmountInWei => throw _privateConstructorUsedError;
  String get payAmountInWei => throw _privateConstructorUsedError;
  HistoryOrderState get state => throw _privateConstructorUsedError;
  List<TransactionMetaData> get transactionsMetaData =>
      throw _privateConstructorUsedError;

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
      {String orderId,
      String createdMoment,
      String userPublicKey,
      String walletAddress,
      String userStageId,
      String stage,
      String tokenName,
      double quantity,
      String tokenNetwork,
      String tokenAddress,
      double tokenEffectivePrice,
      double loanAmount,
      double loanInterestAmount,
      double finalAmount,
      double profitRatePerMonth,
      double monthDuration,
      String payOffDate,
      String tokenAmountInWei,
      String payAmountInWei,
      HistoryOrderState state,
      List<TransactionMetaData> transactionsMetaData});
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
    Object? orderId = null,
    Object? createdMoment = null,
    Object? userPublicKey = null,
    Object? walletAddress = null,
    Object? userStageId = null,
    Object? stage = null,
    Object? tokenName = null,
    Object? quantity = null,
    Object? tokenNetwork = null,
    Object? tokenAddress = null,
    Object? tokenEffectivePrice = null,
    Object? loanAmount = null,
    Object? loanInterestAmount = null,
    Object? finalAmount = null,
    Object? profitRatePerMonth = null,
    Object? monthDuration = null,
    Object? payOffDate = null,
    Object? tokenAmountInWei = null,
    Object? payAmountInWei = null,
    Object? state = null,
    Object? transactionsMetaData = null,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      createdMoment: null == createdMoment
          ? _value.createdMoment
          : createdMoment // ignore: cast_nullable_to_non_nullable
              as String,
      userPublicKey: null == userPublicKey
          ? _value.userPublicKey
          : userPublicKey // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      userStageId: null == userStageId
          ? _value.userStageId
          : userStageId // ignore: cast_nullable_to_non_nullable
              as String,
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as String,
      tokenName: null == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      tokenNetwork: null == tokenNetwork
          ? _value.tokenNetwork
          : tokenNetwork // ignore: cast_nullable_to_non_nullable
              as String,
      tokenAddress: null == tokenAddress
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String,
      tokenEffectivePrice: null == tokenEffectivePrice
          ? _value.tokenEffectivePrice
          : tokenEffectivePrice // ignore: cast_nullable_to_non_nullable
              as double,
      loanAmount: null == loanAmount
          ? _value.loanAmount
          : loanAmount // ignore: cast_nullable_to_non_nullable
              as double,
      loanInterestAmount: null == loanInterestAmount
          ? _value.loanInterestAmount
          : loanInterestAmount // ignore: cast_nullable_to_non_nullable
              as double,
      finalAmount: null == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      profitRatePerMonth: null == profitRatePerMonth
          ? _value.profitRatePerMonth
          : profitRatePerMonth // ignore: cast_nullable_to_non_nullable
              as double,
      monthDuration: null == monthDuration
          ? _value.monthDuration
          : monthDuration // ignore: cast_nullable_to_non_nullable
              as double,
      payOffDate: null == payOffDate
          ? _value.payOffDate
          : payOffDate // ignore: cast_nullable_to_non_nullable
              as String,
      tokenAmountInWei: null == tokenAmountInWei
          ? _value.tokenAmountInWei
          : tokenAmountInWei // ignore: cast_nullable_to_non_nullable
              as String,
      payAmountInWei: null == payAmountInWei
          ? _value.payAmountInWei
          : payAmountInWei // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as HistoryOrderState,
      transactionsMetaData: null == transactionsMetaData
          ? _value.transactionsMetaData
          : transactionsMetaData // ignore: cast_nullable_to_non_nullable
              as List<TransactionMetaData>,
    ) as $Val);
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
      {String orderId,
      String createdMoment,
      String userPublicKey,
      String walletAddress,
      String userStageId,
      String stage,
      String tokenName,
      double quantity,
      String tokenNetwork,
      String tokenAddress,
      double tokenEffectivePrice,
      double loanAmount,
      double loanInterestAmount,
      double finalAmount,
      double profitRatePerMonth,
      double monthDuration,
      String payOffDate,
      String tokenAmountInWei,
      String payAmountInWei,
      HistoryOrderState state,
      List<TransactionMetaData> transactionsMetaData});
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
    Object? orderId = null,
    Object? createdMoment = null,
    Object? userPublicKey = null,
    Object? walletAddress = null,
    Object? userStageId = null,
    Object? stage = null,
    Object? tokenName = null,
    Object? quantity = null,
    Object? tokenNetwork = null,
    Object? tokenAddress = null,
    Object? tokenEffectivePrice = null,
    Object? loanAmount = null,
    Object? loanInterestAmount = null,
    Object? finalAmount = null,
    Object? profitRatePerMonth = null,
    Object? monthDuration = null,
    Object? payOffDate = null,
    Object? tokenAmountInWei = null,
    Object? payAmountInWei = null,
    Object? state = null,
    Object? transactionsMetaData = null,
  }) {
    return _then(_$HistoryOrderImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      createdMoment: null == createdMoment
          ? _value.createdMoment
          : createdMoment // ignore: cast_nullable_to_non_nullable
              as String,
      userPublicKey: null == userPublicKey
          ? _value.userPublicKey
          : userPublicKey // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      userStageId: null == userStageId
          ? _value.userStageId
          : userStageId // ignore: cast_nullable_to_non_nullable
              as String,
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as String,
      tokenName: null == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      tokenNetwork: null == tokenNetwork
          ? _value.tokenNetwork
          : tokenNetwork // ignore: cast_nullable_to_non_nullable
              as String,
      tokenAddress: null == tokenAddress
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String,
      tokenEffectivePrice: null == tokenEffectivePrice
          ? _value.tokenEffectivePrice
          : tokenEffectivePrice // ignore: cast_nullable_to_non_nullable
              as double,
      loanAmount: null == loanAmount
          ? _value.loanAmount
          : loanAmount // ignore: cast_nullable_to_non_nullable
              as double,
      loanInterestAmount: null == loanInterestAmount
          ? _value.loanInterestAmount
          : loanInterestAmount // ignore: cast_nullable_to_non_nullable
              as double,
      finalAmount: null == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      profitRatePerMonth: null == profitRatePerMonth
          ? _value.profitRatePerMonth
          : profitRatePerMonth // ignore: cast_nullable_to_non_nullable
              as double,
      monthDuration: null == monthDuration
          ? _value.monthDuration
          : monthDuration // ignore: cast_nullable_to_non_nullable
              as double,
      payOffDate: null == payOffDate
          ? _value.payOffDate
          : payOffDate // ignore: cast_nullable_to_non_nullable
              as String,
      tokenAmountInWei: null == tokenAmountInWei
          ? _value.tokenAmountInWei
          : tokenAmountInWei // ignore: cast_nullable_to_non_nullable
              as String,
      payAmountInWei: null == payAmountInWei
          ? _value.payAmountInWei
          : payAmountInWei // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as HistoryOrderState,
      transactionsMetaData: null == transactionsMetaData
          ? _value._transactionsMetaData
          : transactionsMetaData // ignore: cast_nullable_to_non_nullable
              as List<TransactionMetaData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryOrderImpl implements _HistoryOrder {
  const _$HistoryOrderImpl(
      {required this.orderId,
      required this.createdMoment,
      required this.userPublicKey,
      required this.walletAddress,
      required this.userStageId,
      required this.stage,
      required this.tokenName,
      required this.quantity,
      required this.tokenNetwork,
      required this.tokenAddress,
      required this.tokenEffectivePrice,
      required this.loanAmount,
      required this.loanInterestAmount,
      required this.finalAmount,
      required this.profitRatePerMonth,
      required this.monthDuration,
      required this.payOffDate,
      required this.tokenAmountInWei,
      required this.payAmountInWei,
      required this.state,
      final List<TransactionMetaData> transactionsMetaData = const []})
      : _transactionsMetaData = transactionsMetaData;

  factory _$HistoryOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryOrderImplFromJson(json);

  @override
  final String orderId;
  @override
  final String createdMoment;
  @override
  final String userPublicKey;
  @override
  final String walletAddress;
  @override
  final String userStageId;
  @override
  final String stage;
  @override
  final String tokenName;
  @override
  final double quantity;
  @override
  final String tokenNetwork;
  @override
  final String tokenAddress;
  @override
  final double tokenEffectivePrice;
  @override
  final double loanAmount;
  @override
  final double loanInterestAmount;
  @override
  final double finalAmount;
  @override
  final double profitRatePerMonth;
  @override
  final double monthDuration;
  @override
  final String payOffDate;
  @override
  final String tokenAmountInWei;
  @override
  final String payAmountInWei;
  @override
  final HistoryOrderState state;
  final List<TransactionMetaData> _transactionsMetaData;
  @override
  @JsonKey()
  List<TransactionMetaData> get transactionsMetaData {
    if (_transactionsMetaData is EqualUnmodifiableListView)
      return _transactionsMetaData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionsMetaData);
  }

  @override
  String toString() {
    return 'HistoryOrder(orderId: $orderId, createdMoment: $createdMoment, userPublicKey: $userPublicKey, walletAddress: $walletAddress, userStageId: $userStageId, stage: $stage, tokenName: $tokenName, quantity: $quantity, tokenNetwork: $tokenNetwork, tokenAddress: $tokenAddress, tokenEffectivePrice: $tokenEffectivePrice, loanAmount: $loanAmount, loanInterestAmount: $loanInterestAmount, finalAmount: $finalAmount, profitRatePerMonth: $profitRatePerMonth, monthDuration: $monthDuration, payOffDate: $payOffDate, tokenAmountInWei: $tokenAmountInWei, payAmountInWei: $payAmountInWei, state: $state, transactionsMetaData: $transactionsMetaData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryOrderImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.createdMoment, createdMoment) ||
                other.createdMoment == createdMoment) &&
            (identical(other.userPublicKey, userPublicKey) ||
                other.userPublicKey == userPublicKey) &&
            (identical(other.walletAddress, walletAddress) ||
                other.walletAddress == walletAddress) &&
            (identical(other.userStageId, userStageId) ||
                other.userStageId == userStageId) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.tokenName, tokenName) ||
                other.tokenName == tokenName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.tokenNetwork, tokenNetwork) ||
                other.tokenNetwork == tokenNetwork) &&
            (identical(other.tokenAddress, tokenAddress) ||
                other.tokenAddress == tokenAddress) &&
            (identical(other.tokenEffectivePrice, tokenEffectivePrice) ||
                other.tokenEffectivePrice == tokenEffectivePrice) &&
            (identical(other.loanAmount, loanAmount) ||
                other.loanAmount == loanAmount) &&
            (identical(other.loanInterestAmount, loanInterestAmount) ||
                other.loanInterestAmount == loanInterestAmount) &&
            (identical(other.finalAmount, finalAmount) ||
                other.finalAmount == finalAmount) &&
            (identical(other.profitRatePerMonth, profitRatePerMonth) ||
                other.profitRatePerMonth == profitRatePerMonth) &&
            (identical(other.monthDuration, monthDuration) ||
                other.monthDuration == monthDuration) &&
            (identical(other.payOffDate, payOffDate) ||
                other.payOffDate == payOffDate) &&
            (identical(other.tokenAmountInWei, tokenAmountInWei) ||
                other.tokenAmountInWei == tokenAmountInWei) &&
            (identical(other.payAmountInWei, payAmountInWei) ||
                other.payAmountInWei == payAmountInWei) &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality()
                .equals(other._transactionsMetaData, _transactionsMetaData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        orderId,
        createdMoment,
        userPublicKey,
        walletAddress,
        userStageId,
        stage,
        tokenName,
        quantity,
        tokenNetwork,
        tokenAddress,
        tokenEffectivePrice,
        loanAmount,
        loanInterestAmount,
        finalAmount,
        profitRatePerMonth,
        monthDuration,
        payOffDate,
        tokenAmountInWei,
        payAmountInWei,
        state,
        const DeepCollectionEquality().hash(_transactionsMetaData)
      ]);

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
          {required final String orderId,
          required final String createdMoment,
          required final String userPublicKey,
          required final String walletAddress,
          required final String userStageId,
          required final String stage,
          required final String tokenName,
          required final double quantity,
          required final String tokenNetwork,
          required final String tokenAddress,
          required final double tokenEffectivePrice,
          required final double loanAmount,
          required final double loanInterestAmount,
          required final double finalAmount,
          required final double profitRatePerMonth,
          required final double monthDuration,
          required final String payOffDate,
          required final String tokenAmountInWei,
          required final String payAmountInWei,
          required final HistoryOrderState state,
          final List<TransactionMetaData> transactionsMetaData}) =
      _$HistoryOrderImpl;

  factory _HistoryOrder.fromJson(Map<String, dynamic> json) =
      _$HistoryOrderImpl.fromJson;

  @override
  String get orderId;
  @override
  String get createdMoment;
  @override
  String get userPublicKey;
  @override
  String get walletAddress;
  @override
  String get userStageId;
  @override
  String get stage;
  @override
  String get tokenName;
  @override
  double get quantity;
  @override
  String get tokenNetwork;
  @override
  String get tokenAddress;
  @override
  double get tokenEffectivePrice;
  @override
  double get loanAmount;
  @override
  double get loanInterestAmount;
  @override
  double get finalAmount;
  @override
  double get profitRatePerMonth;
  @override
  double get monthDuration;
  @override
  String get payOffDate;
  @override
  String get tokenAmountInWei;
  @override
  String get payAmountInWei;
  @override
  HistoryOrderState get state;
  @override
  List<TransactionMetaData> get transactionsMetaData;

  /// Create a copy of HistoryOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryOrderImplCopyWith<_$HistoryOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransactionMetaData _$TransactionMetaDataFromJson(Map<String, dynamic> json) {
  return _TransactionMetaData.fromJson(json);
}

/// @nodoc
mixin _$TransactionMetaData {
  String get createMoment => throw _privateConstructorUsedError;
  String get hash => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this TransactionMetaData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionMetaData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionMetaDataCopyWith<TransactionMetaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionMetaDataCopyWith<$Res> {
  factory $TransactionMetaDataCopyWith(
          TransactionMetaData value, $Res Function(TransactionMetaData) then) =
      _$TransactionMetaDataCopyWithImpl<$Res, TransactionMetaData>;
  @useResult
  $Res call({String createMoment, String hash, String status});
}

/// @nodoc
class _$TransactionMetaDataCopyWithImpl<$Res, $Val extends TransactionMetaData>
    implements $TransactionMetaDataCopyWith<$Res> {
  _$TransactionMetaDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionMetaData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createMoment = null,
    Object? hash = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      createMoment: null == createMoment
          ? _value.createMoment
          : createMoment // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionMetaDataImplCopyWith<$Res>
    implements $TransactionMetaDataCopyWith<$Res> {
  factory _$$TransactionMetaDataImplCopyWith(_$TransactionMetaDataImpl value,
          $Res Function(_$TransactionMetaDataImpl) then) =
      __$$TransactionMetaDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String createMoment, String hash, String status});
}

/// @nodoc
class __$$TransactionMetaDataImplCopyWithImpl<$Res>
    extends _$TransactionMetaDataCopyWithImpl<$Res, _$TransactionMetaDataImpl>
    implements _$$TransactionMetaDataImplCopyWith<$Res> {
  __$$TransactionMetaDataImplCopyWithImpl(_$TransactionMetaDataImpl _value,
      $Res Function(_$TransactionMetaDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionMetaData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createMoment = null,
    Object? hash = null,
    Object? status = null,
  }) {
    return _then(_$TransactionMetaDataImpl(
      createMoment: null == createMoment
          ? _value.createMoment
          : createMoment // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionMetaDataImpl implements _TransactionMetaData {
  const _$TransactionMetaDataImpl(
      {required this.createMoment, required this.hash, required this.status});

  factory _$TransactionMetaDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionMetaDataImplFromJson(json);

  @override
  final String createMoment;
  @override
  final String hash;
  @override
  final String status;

  @override
  String toString() {
    return 'TransactionMetaData(createMoment: $createMoment, hash: $hash, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionMetaDataImpl &&
            (identical(other.createMoment, createMoment) ||
                other.createMoment == createMoment) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, createMoment, hash, status);

  /// Create a copy of TransactionMetaData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionMetaDataImplCopyWith<_$TransactionMetaDataImpl> get copyWith =>
      __$$TransactionMetaDataImplCopyWithImpl<_$TransactionMetaDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionMetaDataImplToJson(
      this,
    );
  }
}

abstract class _TransactionMetaData implements TransactionMetaData {
  const factory _TransactionMetaData(
      {required final String createMoment,
      required final String hash,
      required final String status}) = _$TransactionMetaDataImpl;

  factory _TransactionMetaData.fromJson(Map<String, dynamic> json) =
      _$TransactionMetaDataImpl.fromJson;

  @override
  String get createMoment;
  @override
  String get hash;
  @override
  String get status;

  /// Create a copy of TransactionMetaData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionMetaDataImplCopyWith<_$TransactionMetaDataImpl> get copyWith =>
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
@JsonSerializable()
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
  double get marketPrice => throw _privateConstructorUsedError;
  double get effectivePrice => throw _privateConstructorUsedError;
  double get priceImpact => throw _privateConstructorUsedError;
  double get totalCost => throw _privateConstructorUsedError;
  double get bnbPriceUsd => throw _privateConstructorUsedError;
  double get tokenReserve => throw _privateConstructorUsedError;
  double get bnbReserve => throw _privateConstructorUsedError;

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
  $Res call(
      {double marketPrice,
      double effectivePrice,
      double priceImpact,
      double totalCost,
      double bnbPriceUsd,
      double tokenReserve,
      double bnbReserve});
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
    Object? marketPrice = null,
    Object? effectivePrice = null,
    Object? priceImpact = null,
    Object? totalCost = null,
    Object? bnbPriceUsd = null,
    Object? tokenReserve = null,
    Object? bnbReserve = null,
  }) {
    return _then(_value.copyWith(
      marketPrice: null == marketPrice
          ? _value.marketPrice
          : marketPrice // ignore: cast_nullable_to_non_nullable
              as double,
      effectivePrice: null == effectivePrice
          ? _value.effectivePrice
          : effectivePrice // ignore: cast_nullable_to_non_nullable
              as double,
      priceImpact: null == priceImpact
          ? _value.priceImpact
          : priceImpact // ignore: cast_nullable_to_non_nullable
              as double,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
      bnbPriceUsd: null == bnbPriceUsd
          ? _value.bnbPriceUsd
          : bnbPriceUsd // ignore: cast_nullable_to_non_nullable
              as double,
      tokenReserve: null == tokenReserve
          ? _value.tokenReserve
          : tokenReserve // ignore: cast_nullable_to_non_nullable
              as double,
      bnbReserve: null == bnbReserve
          ? _value.bnbReserve
          : bnbReserve // ignore: cast_nullable_to_non_nullable
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
  $Res call(
      {double marketPrice,
      double effectivePrice,
      double priceImpact,
      double totalCost,
      double bnbPriceUsd,
      double tokenReserve,
      double bnbReserve});
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
    Object? marketPrice = null,
    Object? effectivePrice = null,
    Object? priceImpact = null,
    Object? totalCost = null,
    Object? bnbPriceUsd = null,
    Object? tokenReserve = null,
    Object? bnbReserve = null,
  }) {
    return _then(_$EffectivePriceModelImpl(
      marketPrice: null == marketPrice
          ? _value.marketPrice
          : marketPrice // ignore: cast_nullable_to_non_nullable
              as double,
      effectivePrice: null == effectivePrice
          ? _value.effectivePrice
          : effectivePrice // ignore: cast_nullable_to_non_nullable
              as double,
      priceImpact: null == priceImpact
          ? _value.priceImpact
          : priceImpact // ignore: cast_nullable_to_non_nullable
              as double,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
      bnbPriceUsd: null == bnbPriceUsd
          ? _value.bnbPriceUsd
          : bnbPriceUsd // ignore: cast_nullable_to_non_nullable
              as double,
      tokenReserve: null == tokenReserve
          ? _value.tokenReserve
          : tokenReserve // ignore: cast_nullable_to_non_nullable
              as double,
      bnbReserve: null == bnbReserve
          ? _value.bnbReserve
          : bnbReserve // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EffectivePriceModelImpl implements _EffectivePriceModel {
  const _$EffectivePriceModelImpl(
      {this.marketPrice = 0,
      this.effectivePrice = 0,
      this.priceImpact = 0,
      this.totalCost = 0,
      this.bnbPriceUsd = 0,
      this.tokenReserve = 0,
      this.bnbReserve = 0});

  factory _$EffectivePriceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EffectivePriceModelImplFromJson(json);

  @override
  @JsonKey()
  final double marketPrice;
  @override
  @JsonKey()
  final double effectivePrice;
  @override
  @JsonKey()
  final double priceImpact;
  @override
  @JsonKey()
  final double totalCost;
  @override
  @JsonKey()
  final double bnbPriceUsd;
  @override
  @JsonKey()
  final double tokenReserve;
  @override
  @JsonKey()
  final double bnbReserve;

  @override
  String toString() {
    return 'EffectivePriceModel(marketPrice: $marketPrice, effectivePrice: $effectivePrice, priceImpact: $priceImpact, totalCost: $totalCost, bnbPriceUsd: $bnbPriceUsd, tokenReserve: $tokenReserve, bnbReserve: $bnbReserve)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EffectivePriceModelImpl &&
            (identical(other.marketPrice, marketPrice) ||
                other.marketPrice == marketPrice) &&
            (identical(other.effectivePrice, effectivePrice) ||
                other.effectivePrice == effectivePrice) &&
            (identical(other.priceImpact, priceImpact) ||
                other.priceImpact == priceImpact) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.bnbPriceUsd, bnbPriceUsd) ||
                other.bnbPriceUsd == bnbPriceUsd) &&
            (identical(other.tokenReserve, tokenReserve) ||
                other.tokenReserve == tokenReserve) &&
            (identical(other.bnbReserve, bnbReserve) ||
                other.bnbReserve == bnbReserve));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, marketPrice, effectivePrice,
      priceImpact, totalCost, bnbPriceUsd, tokenReserve, bnbReserve);

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
      {final double marketPrice,
      final double effectivePrice,
      final double priceImpact,
      final double totalCost,
      final double bnbPriceUsd,
      final double tokenReserve,
      final double bnbReserve}) = _$EffectivePriceModelImpl;

  factory _EffectivePriceModel.fromJson(Map<String, dynamic> json) =
      _$EffectivePriceModelImpl.fromJson;

  @override
  double get marketPrice;
  @override
  double get effectivePrice;
  @override
  double get priceImpact;
  @override
  double get totalCost;
  @override
  double get bnbPriceUsd;
  @override
  double get tokenReserve;
  @override
  double get bnbReserve;

  /// Create a copy of EffectivePriceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EffectivePriceModelImplCopyWith<_$EffectivePriceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
