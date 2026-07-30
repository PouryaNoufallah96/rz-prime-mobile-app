// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryOrder {

 String get orderId; String get createdMoment; String get walletAddress; String get userStageId; String get stage; String get tokenName; String get tokenNetwork; String get tokenAddress; String get payOffDate; String get tokenAmountInWei; String get payAmountInWei; double get quantity; double get tokenEffectivePrice; double get loanAmount; double get loanInterestAmount; double get finalAmount; double get profitRatePerMonth; double get monthDuration; HistoryOrderState get state; List<TransactionMetaData> get transactionsMetaData; String? get campaignReference; double? get campaignDiscount;
/// Create a copy of HistoryOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryOrderCopyWith<HistoryOrder> get copyWith => _$HistoryOrderCopyWithImpl<HistoryOrder>(this as HistoryOrder, _$identity);

  /// Serializes this HistoryOrder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryOrder&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.createdMoment, createdMoment) || other.createdMoment == createdMoment)&&(identical(other.walletAddress, walletAddress) || other.walletAddress == walletAddress)&&(identical(other.userStageId, userStageId) || other.userStageId == userStageId)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.tokenName, tokenName) || other.tokenName == tokenName)&&(identical(other.tokenNetwork, tokenNetwork) || other.tokenNetwork == tokenNetwork)&&(identical(other.tokenAddress, tokenAddress) || other.tokenAddress == tokenAddress)&&(identical(other.payOffDate, payOffDate) || other.payOffDate == payOffDate)&&(identical(other.tokenAmountInWei, tokenAmountInWei) || other.tokenAmountInWei == tokenAmountInWei)&&(identical(other.payAmountInWei, payAmountInWei) || other.payAmountInWei == payAmountInWei)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.tokenEffectivePrice, tokenEffectivePrice) || other.tokenEffectivePrice == tokenEffectivePrice)&&(identical(other.loanAmount, loanAmount) || other.loanAmount == loanAmount)&&(identical(other.loanInterestAmount, loanInterestAmount) || other.loanInterestAmount == loanInterestAmount)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount)&&(identical(other.profitRatePerMonth, profitRatePerMonth) || other.profitRatePerMonth == profitRatePerMonth)&&(identical(other.monthDuration, monthDuration) || other.monthDuration == monthDuration)&&(identical(other.state, state) || other.state == state)&&const DeepCollectionEquality().equals(other.transactionsMetaData, transactionsMetaData)&&(identical(other.campaignReference, campaignReference) || other.campaignReference == campaignReference)&&(identical(other.campaignDiscount, campaignDiscount) || other.campaignDiscount == campaignDiscount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,orderId,createdMoment,walletAddress,userStageId,stage,tokenName,tokenNetwork,tokenAddress,payOffDate,tokenAmountInWei,payAmountInWei,quantity,tokenEffectivePrice,loanAmount,loanInterestAmount,finalAmount,profitRatePerMonth,monthDuration,state,const DeepCollectionEquality().hash(transactionsMetaData),campaignReference,campaignDiscount]);

@override
String toString() {
  return 'HistoryOrder(orderId: $orderId, createdMoment: $createdMoment, walletAddress: $walletAddress, userStageId: $userStageId, stage: $stage, tokenName: $tokenName, tokenNetwork: $tokenNetwork, tokenAddress: $tokenAddress, payOffDate: $payOffDate, tokenAmountInWei: $tokenAmountInWei, payAmountInWei: $payAmountInWei, quantity: $quantity, tokenEffectivePrice: $tokenEffectivePrice, loanAmount: $loanAmount, loanInterestAmount: $loanInterestAmount, finalAmount: $finalAmount, profitRatePerMonth: $profitRatePerMonth, monthDuration: $monthDuration, state: $state, transactionsMetaData: $transactionsMetaData, campaignReference: $campaignReference, campaignDiscount: $campaignDiscount)';
}


}

/// @nodoc
abstract mixin class $HistoryOrderCopyWith<$Res>  {
  factory $HistoryOrderCopyWith(HistoryOrder value, $Res Function(HistoryOrder) _then) = _$HistoryOrderCopyWithImpl;
@useResult
$Res call({
 String orderId, String createdMoment, String walletAddress, String userStageId, String stage, String tokenName, String tokenNetwork, String tokenAddress, String payOffDate, String tokenAmountInWei, String payAmountInWei, double quantity, double tokenEffectivePrice, double loanAmount, double loanInterestAmount, double finalAmount, double profitRatePerMonth, double monthDuration, HistoryOrderState state, List<TransactionMetaData> transactionsMetaData, String? campaignReference, double? campaignDiscount
});




}
/// @nodoc
class _$HistoryOrderCopyWithImpl<$Res>
    implements $HistoryOrderCopyWith<$Res> {
  _$HistoryOrderCopyWithImpl(this._self, this._then);

  final HistoryOrder _self;
  final $Res Function(HistoryOrder) _then;

/// Create a copy of HistoryOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,Object? createdMoment = null,Object? walletAddress = null,Object? userStageId = null,Object? stage = null,Object? tokenName = null,Object? tokenNetwork = null,Object? tokenAddress = null,Object? payOffDate = null,Object? tokenAmountInWei = null,Object? payAmountInWei = null,Object? quantity = null,Object? tokenEffectivePrice = null,Object? loanAmount = null,Object? loanInterestAmount = null,Object? finalAmount = null,Object? profitRatePerMonth = null,Object? monthDuration = null,Object? state = null,Object? transactionsMetaData = null,Object? campaignReference = freezed,Object? campaignDiscount = freezed,}) {
  return _then(_self.copyWith(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,createdMoment: null == createdMoment ? _self.createdMoment : createdMoment // ignore: cast_nullable_to_non_nullable
as String,walletAddress: null == walletAddress ? _self.walletAddress : walletAddress // ignore: cast_nullable_to_non_nullable
as String,userStageId: null == userStageId ? _self.userStageId : userStageId // ignore: cast_nullable_to_non_nullable
as String,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as String,tokenName: null == tokenName ? _self.tokenName : tokenName // ignore: cast_nullable_to_non_nullable
as String,tokenNetwork: null == tokenNetwork ? _self.tokenNetwork : tokenNetwork // ignore: cast_nullable_to_non_nullable
as String,tokenAddress: null == tokenAddress ? _self.tokenAddress : tokenAddress // ignore: cast_nullable_to_non_nullable
as String,payOffDate: null == payOffDate ? _self.payOffDate : payOffDate // ignore: cast_nullable_to_non_nullable
as String,tokenAmountInWei: null == tokenAmountInWei ? _self.tokenAmountInWei : tokenAmountInWei // ignore: cast_nullable_to_non_nullable
as String,payAmountInWei: null == payAmountInWei ? _self.payAmountInWei : payAmountInWei // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,tokenEffectivePrice: null == tokenEffectivePrice ? _self.tokenEffectivePrice : tokenEffectivePrice // ignore: cast_nullable_to_non_nullable
as double,loanAmount: null == loanAmount ? _self.loanAmount : loanAmount // ignore: cast_nullable_to_non_nullable
as double,loanInterestAmount: null == loanInterestAmount ? _self.loanInterestAmount : loanInterestAmount // ignore: cast_nullable_to_non_nullable
as double,finalAmount: null == finalAmount ? _self.finalAmount : finalAmount // ignore: cast_nullable_to_non_nullable
as double,profitRatePerMonth: null == profitRatePerMonth ? _self.profitRatePerMonth : profitRatePerMonth // ignore: cast_nullable_to_non_nullable
as double,monthDuration: null == monthDuration ? _self.monthDuration : monthDuration // ignore: cast_nullable_to_non_nullable
as double,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as HistoryOrderState,transactionsMetaData: null == transactionsMetaData ? _self.transactionsMetaData : transactionsMetaData // ignore: cast_nullable_to_non_nullable
as List<TransactionMetaData>,campaignReference: freezed == campaignReference ? _self.campaignReference : campaignReference // ignore: cast_nullable_to_non_nullable
as String?,campaignDiscount: freezed == campaignDiscount ? _self.campaignDiscount : campaignDiscount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryOrder].
extension HistoryOrderPatterns on HistoryOrder {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryOrder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryOrder() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryOrder value)  $default,){
final _that = this;
switch (_that) {
case _HistoryOrder():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryOrder value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryOrder() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderId,  String createdMoment,  String walletAddress,  String userStageId,  String stage,  String tokenName,  String tokenNetwork,  String tokenAddress,  String payOffDate,  String tokenAmountInWei,  String payAmountInWei,  double quantity,  double tokenEffectivePrice,  double loanAmount,  double loanInterestAmount,  double finalAmount,  double profitRatePerMonth,  double monthDuration,  HistoryOrderState state,  List<TransactionMetaData> transactionsMetaData,  String? campaignReference,  double? campaignDiscount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryOrder() when $default != null:
return $default(_that.orderId,_that.createdMoment,_that.walletAddress,_that.userStageId,_that.stage,_that.tokenName,_that.tokenNetwork,_that.tokenAddress,_that.payOffDate,_that.tokenAmountInWei,_that.payAmountInWei,_that.quantity,_that.tokenEffectivePrice,_that.loanAmount,_that.loanInterestAmount,_that.finalAmount,_that.profitRatePerMonth,_that.monthDuration,_that.state,_that.transactionsMetaData,_that.campaignReference,_that.campaignDiscount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderId,  String createdMoment,  String walletAddress,  String userStageId,  String stage,  String tokenName,  String tokenNetwork,  String tokenAddress,  String payOffDate,  String tokenAmountInWei,  String payAmountInWei,  double quantity,  double tokenEffectivePrice,  double loanAmount,  double loanInterestAmount,  double finalAmount,  double profitRatePerMonth,  double monthDuration,  HistoryOrderState state,  List<TransactionMetaData> transactionsMetaData,  String? campaignReference,  double? campaignDiscount)  $default,) {final _that = this;
switch (_that) {
case _HistoryOrder():
return $default(_that.orderId,_that.createdMoment,_that.walletAddress,_that.userStageId,_that.stage,_that.tokenName,_that.tokenNetwork,_that.tokenAddress,_that.payOffDate,_that.tokenAmountInWei,_that.payAmountInWei,_that.quantity,_that.tokenEffectivePrice,_that.loanAmount,_that.loanInterestAmount,_that.finalAmount,_that.profitRatePerMonth,_that.monthDuration,_that.state,_that.transactionsMetaData,_that.campaignReference,_that.campaignDiscount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderId,  String createdMoment,  String walletAddress,  String userStageId,  String stage,  String tokenName,  String tokenNetwork,  String tokenAddress,  String payOffDate,  String tokenAmountInWei,  String payAmountInWei,  double quantity,  double tokenEffectivePrice,  double loanAmount,  double loanInterestAmount,  double finalAmount,  double profitRatePerMonth,  double monthDuration,  HistoryOrderState state,  List<TransactionMetaData> transactionsMetaData,  String? campaignReference,  double? campaignDiscount)?  $default,) {final _that = this;
switch (_that) {
case _HistoryOrder() when $default != null:
return $default(_that.orderId,_that.createdMoment,_that.walletAddress,_that.userStageId,_that.stage,_that.tokenName,_that.tokenNetwork,_that.tokenAddress,_that.payOffDate,_that.tokenAmountInWei,_that.payAmountInWei,_that.quantity,_that.tokenEffectivePrice,_that.loanAmount,_that.loanInterestAmount,_that.finalAmount,_that.profitRatePerMonth,_that.monthDuration,_that.state,_that.transactionsMetaData,_that.campaignReference,_that.campaignDiscount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryOrder implements HistoryOrder {
  const _HistoryOrder({required this.orderId, required this.createdMoment, required this.walletAddress, required this.userStageId, required this.stage, required this.tokenName, required this.tokenNetwork, required this.tokenAddress, required this.payOffDate, required this.tokenAmountInWei, required this.payAmountInWei, required this.quantity, required this.tokenEffectivePrice, required this.loanAmount, required this.loanInterestAmount, required this.finalAmount, required this.profitRatePerMonth, required this.monthDuration, required this.state, final  List<TransactionMetaData> transactionsMetaData = const [], this.campaignReference, this.campaignDiscount}): _transactionsMetaData = transactionsMetaData;
  factory _HistoryOrder.fromJson(Map<String, dynamic> json) => _$HistoryOrderFromJson(json);

@override final  String orderId;
@override final  String createdMoment;
@override final  String walletAddress;
@override final  String userStageId;
@override final  String stage;
@override final  String tokenName;
@override final  String tokenNetwork;
@override final  String tokenAddress;
@override final  String payOffDate;
@override final  String tokenAmountInWei;
@override final  String payAmountInWei;
@override final  double quantity;
@override final  double tokenEffectivePrice;
@override final  double loanAmount;
@override final  double loanInterestAmount;
@override final  double finalAmount;
@override final  double profitRatePerMonth;
@override final  double monthDuration;
@override final  HistoryOrderState state;
 final  List<TransactionMetaData> _transactionsMetaData;
@override@JsonKey() List<TransactionMetaData> get transactionsMetaData {
  if (_transactionsMetaData is EqualUnmodifiableListView) return _transactionsMetaData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactionsMetaData);
}

@override final  String? campaignReference;
@override final  double? campaignDiscount;

/// Create a copy of HistoryOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryOrderCopyWith<_HistoryOrder> get copyWith => __$HistoryOrderCopyWithImpl<_HistoryOrder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryOrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryOrder&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.createdMoment, createdMoment) || other.createdMoment == createdMoment)&&(identical(other.walletAddress, walletAddress) || other.walletAddress == walletAddress)&&(identical(other.userStageId, userStageId) || other.userStageId == userStageId)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.tokenName, tokenName) || other.tokenName == tokenName)&&(identical(other.tokenNetwork, tokenNetwork) || other.tokenNetwork == tokenNetwork)&&(identical(other.tokenAddress, tokenAddress) || other.tokenAddress == tokenAddress)&&(identical(other.payOffDate, payOffDate) || other.payOffDate == payOffDate)&&(identical(other.tokenAmountInWei, tokenAmountInWei) || other.tokenAmountInWei == tokenAmountInWei)&&(identical(other.payAmountInWei, payAmountInWei) || other.payAmountInWei == payAmountInWei)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.tokenEffectivePrice, tokenEffectivePrice) || other.tokenEffectivePrice == tokenEffectivePrice)&&(identical(other.loanAmount, loanAmount) || other.loanAmount == loanAmount)&&(identical(other.loanInterestAmount, loanInterestAmount) || other.loanInterestAmount == loanInterestAmount)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount)&&(identical(other.profitRatePerMonth, profitRatePerMonth) || other.profitRatePerMonth == profitRatePerMonth)&&(identical(other.monthDuration, monthDuration) || other.monthDuration == monthDuration)&&(identical(other.state, state) || other.state == state)&&const DeepCollectionEquality().equals(other._transactionsMetaData, _transactionsMetaData)&&(identical(other.campaignReference, campaignReference) || other.campaignReference == campaignReference)&&(identical(other.campaignDiscount, campaignDiscount) || other.campaignDiscount == campaignDiscount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,orderId,createdMoment,walletAddress,userStageId,stage,tokenName,tokenNetwork,tokenAddress,payOffDate,tokenAmountInWei,payAmountInWei,quantity,tokenEffectivePrice,loanAmount,loanInterestAmount,finalAmount,profitRatePerMonth,monthDuration,state,const DeepCollectionEquality().hash(_transactionsMetaData),campaignReference,campaignDiscount]);

@override
String toString() {
  return 'HistoryOrder(orderId: $orderId, createdMoment: $createdMoment, walletAddress: $walletAddress, userStageId: $userStageId, stage: $stage, tokenName: $tokenName, tokenNetwork: $tokenNetwork, tokenAddress: $tokenAddress, payOffDate: $payOffDate, tokenAmountInWei: $tokenAmountInWei, payAmountInWei: $payAmountInWei, quantity: $quantity, tokenEffectivePrice: $tokenEffectivePrice, loanAmount: $loanAmount, loanInterestAmount: $loanInterestAmount, finalAmount: $finalAmount, profitRatePerMonth: $profitRatePerMonth, monthDuration: $monthDuration, state: $state, transactionsMetaData: $transactionsMetaData, campaignReference: $campaignReference, campaignDiscount: $campaignDiscount)';
}


}

/// @nodoc
abstract mixin class _$HistoryOrderCopyWith<$Res> implements $HistoryOrderCopyWith<$Res> {
  factory _$HistoryOrderCopyWith(_HistoryOrder value, $Res Function(_HistoryOrder) _then) = __$HistoryOrderCopyWithImpl;
@override @useResult
$Res call({
 String orderId, String createdMoment, String walletAddress, String userStageId, String stage, String tokenName, String tokenNetwork, String tokenAddress, String payOffDate, String tokenAmountInWei, String payAmountInWei, double quantity, double tokenEffectivePrice, double loanAmount, double loanInterestAmount, double finalAmount, double profitRatePerMonth, double monthDuration, HistoryOrderState state, List<TransactionMetaData> transactionsMetaData, String? campaignReference, double? campaignDiscount
});




}
/// @nodoc
class __$HistoryOrderCopyWithImpl<$Res>
    implements _$HistoryOrderCopyWith<$Res> {
  __$HistoryOrderCopyWithImpl(this._self, this._then);

  final _HistoryOrder _self;
  final $Res Function(_HistoryOrder) _then;

/// Create a copy of HistoryOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? createdMoment = null,Object? walletAddress = null,Object? userStageId = null,Object? stage = null,Object? tokenName = null,Object? tokenNetwork = null,Object? tokenAddress = null,Object? payOffDate = null,Object? tokenAmountInWei = null,Object? payAmountInWei = null,Object? quantity = null,Object? tokenEffectivePrice = null,Object? loanAmount = null,Object? loanInterestAmount = null,Object? finalAmount = null,Object? profitRatePerMonth = null,Object? monthDuration = null,Object? state = null,Object? transactionsMetaData = null,Object? campaignReference = freezed,Object? campaignDiscount = freezed,}) {
  return _then(_HistoryOrder(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,createdMoment: null == createdMoment ? _self.createdMoment : createdMoment // ignore: cast_nullable_to_non_nullable
as String,walletAddress: null == walletAddress ? _self.walletAddress : walletAddress // ignore: cast_nullable_to_non_nullable
as String,userStageId: null == userStageId ? _self.userStageId : userStageId // ignore: cast_nullable_to_non_nullable
as String,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as String,tokenName: null == tokenName ? _self.tokenName : tokenName // ignore: cast_nullable_to_non_nullable
as String,tokenNetwork: null == tokenNetwork ? _self.tokenNetwork : tokenNetwork // ignore: cast_nullable_to_non_nullable
as String,tokenAddress: null == tokenAddress ? _self.tokenAddress : tokenAddress // ignore: cast_nullable_to_non_nullable
as String,payOffDate: null == payOffDate ? _self.payOffDate : payOffDate // ignore: cast_nullable_to_non_nullable
as String,tokenAmountInWei: null == tokenAmountInWei ? _self.tokenAmountInWei : tokenAmountInWei // ignore: cast_nullable_to_non_nullable
as String,payAmountInWei: null == payAmountInWei ? _self.payAmountInWei : payAmountInWei // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,tokenEffectivePrice: null == tokenEffectivePrice ? _self.tokenEffectivePrice : tokenEffectivePrice // ignore: cast_nullable_to_non_nullable
as double,loanAmount: null == loanAmount ? _self.loanAmount : loanAmount // ignore: cast_nullable_to_non_nullable
as double,loanInterestAmount: null == loanInterestAmount ? _self.loanInterestAmount : loanInterestAmount // ignore: cast_nullable_to_non_nullable
as double,finalAmount: null == finalAmount ? _self.finalAmount : finalAmount // ignore: cast_nullable_to_non_nullable
as double,profitRatePerMonth: null == profitRatePerMonth ? _self.profitRatePerMonth : profitRatePerMonth // ignore: cast_nullable_to_non_nullable
as double,monthDuration: null == monthDuration ? _self.monthDuration : monthDuration // ignore: cast_nullable_to_non_nullable
as double,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as HistoryOrderState,transactionsMetaData: null == transactionsMetaData ? _self._transactionsMetaData : transactionsMetaData // ignore: cast_nullable_to_non_nullable
as List<TransactionMetaData>,campaignReference: freezed == campaignReference ? _self.campaignReference : campaignReference // ignore: cast_nullable_to_non_nullable
as String?,campaignDiscount: freezed == campaignDiscount ? _self.campaignDiscount : campaignDiscount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$TransactionMetaData {

 String get createMoment; String get hash; String get status;
/// Create a copy of TransactionMetaData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionMetaDataCopyWith<TransactionMetaData> get copyWith => _$TransactionMetaDataCopyWithImpl<TransactionMetaData>(this as TransactionMetaData, _$identity);

  /// Serializes this TransactionMetaData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionMetaData&&(identical(other.createMoment, createMoment) || other.createMoment == createMoment)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createMoment,hash,status);

@override
String toString() {
  return 'TransactionMetaData(createMoment: $createMoment, hash: $hash, status: $status)';
}


}

/// @nodoc
abstract mixin class $TransactionMetaDataCopyWith<$Res>  {
  factory $TransactionMetaDataCopyWith(TransactionMetaData value, $Res Function(TransactionMetaData) _then) = _$TransactionMetaDataCopyWithImpl;
@useResult
$Res call({
 String createMoment, String hash, String status
});




}
/// @nodoc
class _$TransactionMetaDataCopyWithImpl<$Res>
    implements $TransactionMetaDataCopyWith<$Res> {
  _$TransactionMetaDataCopyWithImpl(this._self, this._then);

  final TransactionMetaData _self;
  final $Res Function(TransactionMetaData) _then;

/// Create a copy of TransactionMetaData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createMoment = null,Object? hash = null,Object? status = null,}) {
  return _then(_self.copyWith(
createMoment: null == createMoment ? _self.createMoment : createMoment // ignore: cast_nullable_to_non_nullable
as String,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionMetaData].
extension TransactionMetaDataPatterns on TransactionMetaData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionMetaData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionMetaData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionMetaData value)  $default,){
final _that = this;
switch (_that) {
case _TransactionMetaData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionMetaData value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionMetaData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String createMoment,  String hash,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionMetaData() when $default != null:
return $default(_that.createMoment,_that.hash,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String createMoment,  String hash,  String status)  $default,) {final _that = this;
switch (_that) {
case _TransactionMetaData():
return $default(_that.createMoment,_that.hash,_that.status);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String createMoment,  String hash,  String status)?  $default,) {final _that = this;
switch (_that) {
case _TransactionMetaData() when $default != null:
return $default(_that.createMoment,_that.hash,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionMetaData implements TransactionMetaData {
  const _TransactionMetaData({required this.createMoment, required this.hash, required this.status});
  factory _TransactionMetaData.fromJson(Map<String, dynamic> json) => _$TransactionMetaDataFromJson(json);

@override final  String createMoment;
@override final  String hash;
@override final  String status;

/// Create a copy of TransactionMetaData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionMetaDataCopyWith<_TransactionMetaData> get copyWith => __$TransactionMetaDataCopyWithImpl<_TransactionMetaData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionMetaDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionMetaData&&(identical(other.createMoment, createMoment) || other.createMoment == createMoment)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createMoment,hash,status);

@override
String toString() {
  return 'TransactionMetaData(createMoment: $createMoment, hash: $hash, status: $status)';
}


}

/// @nodoc
abstract mixin class _$TransactionMetaDataCopyWith<$Res> implements $TransactionMetaDataCopyWith<$Res> {
  factory _$TransactionMetaDataCopyWith(_TransactionMetaData value, $Res Function(_TransactionMetaData) _then) = __$TransactionMetaDataCopyWithImpl;
@override @useResult
$Res call({
 String createMoment, String hash, String status
});




}
/// @nodoc
class __$TransactionMetaDataCopyWithImpl<$Res>
    implements _$TransactionMetaDataCopyWith<$Res> {
  __$TransactionMetaDataCopyWithImpl(this._self, this._then);

  final _TransactionMetaData _self;
  final $Res Function(_TransactionMetaData) _then;

/// Create a copy of TransactionMetaData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createMoment = null,Object? hash = null,Object? status = null,}) {
  return _then(_TransactionMetaData(
createMoment: null == createMoment ? _self.createMoment : createMoment // ignore: cast_nullable_to_non_nullable
as String,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$FinalizedOrder {

 String get paymentStatus; double get finalizedAmount; String get finalizedDate;
/// Create a copy of FinalizedOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinalizedOrderCopyWith<FinalizedOrder> get copyWith => _$FinalizedOrderCopyWithImpl<FinalizedOrder>(this as FinalizedOrder, _$identity);

  /// Serializes this FinalizedOrder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FinalizedOrder&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.finalizedAmount, finalizedAmount) || other.finalizedAmount == finalizedAmount)&&(identical(other.finalizedDate, finalizedDate) || other.finalizedDate == finalizedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentStatus,finalizedAmount,finalizedDate);

@override
String toString() {
  return 'FinalizedOrder(paymentStatus: $paymentStatus, finalizedAmount: $finalizedAmount, finalizedDate: $finalizedDate)';
}


}

/// @nodoc
abstract mixin class $FinalizedOrderCopyWith<$Res>  {
  factory $FinalizedOrderCopyWith(FinalizedOrder value, $Res Function(FinalizedOrder) _then) = _$FinalizedOrderCopyWithImpl;
@useResult
$Res call({
 String paymentStatus, double finalizedAmount, String finalizedDate
});




}
/// @nodoc
class _$FinalizedOrderCopyWithImpl<$Res>
    implements $FinalizedOrderCopyWith<$Res> {
  _$FinalizedOrderCopyWithImpl(this._self, this._then);

  final FinalizedOrder _self;
  final $Res Function(FinalizedOrder) _then;

/// Create a copy of FinalizedOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paymentStatus = null,Object? finalizedAmount = null,Object? finalizedDate = null,}) {
  return _then(_self.copyWith(
paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,finalizedAmount: null == finalizedAmount ? _self.finalizedAmount : finalizedAmount // ignore: cast_nullable_to_non_nullable
as double,finalizedDate: null == finalizedDate ? _self.finalizedDate : finalizedDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FinalizedOrder].
extension FinalizedOrderPatterns on FinalizedOrder {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FinalizedOrder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FinalizedOrder() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FinalizedOrder value)  $default,){
final _that = this;
switch (_that) {
case _FinalizedOrder():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FinalizedOrder value)?  $default,){
final _that = this;
switch (_that) {
case _FinalizedOrder() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String paymentStatus,  double finalizedAmount,  String finalizedDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FinalizedOrder() when $default != null:
return $default(_that.paymentStatus,_that.finalizedAmount,_that.finalizedDate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String paymentStatus,  double finalizedAmount,  String finalizedDate)  $default,) {final _that = this;
switch (_that) {
case _FinalizedOrder():
return $default(_that.paymentStatus,_that.finalizedAmount,_that.finalizedDate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String paymentStatus,  double finalizedAmount,  String finalizedDate)?  $default,) {final _that = this;
switch (_that) {
case _FinalizedOrder() when $default != null:
return $default(_that.paymentStatus,_that.finalizedAmount,_that.finalizedDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FinalizedOrder implements FinalizedOrder {
  const _FinalizedOrder({required this.paymentStatus, required this.finalizedAmount, required this.finalizedDate});
  factory _FinalizedOrder.fromJson(Map<String, dynamic> json) => _$FinalizedOrderFromJson(json);

@override final  String paymentStatus;
@override final  double finalizedAmount;
@override final  String finalizedDate;

/// Create a copy of FinalizedOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FinalizedOrderCopyWith<_FinalizedOrder> get copyWith => __$FinalizedOrderCopyWithImpl<_FinalizedOrder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FinalizedOrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinalizedOrder&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.finalizedAmount, finalizedAmount) || other.finalizedAmount == finalizedAmount)&&(identical(other.finalizedDate, finalizedDate) || other.finalizedDate == finalizedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentStatus,finalizedAmount,finalizedDate);

@override
String toString() {
  return 'FinalizedOrder(paymentStatus: $paymentStatus, finalizedAmount: $finalizedAmount, finalizedDate: $finalizedDate)';
}


}

/// @nodoc
abstract mixin class _$FinalizedOrderCopyWith<$Res> implements $FinalizedOrderCopyWith<$Res> {
  factory _$FinalizedOrderCopyWith(_FinalizedOrder value, $Res Function(_FinalizedOrder) _then) = __$FinalizedOrderCopyWithImpl;
@override @useResult
$Res call({
 String paymentStatus, double finalizedAmount, String finalizedDate
});




}
/// @nodoc
class __$FinalizedOrderCopyWithImpl<$Res>
    implements _$FinalizedOrderCopyWith<$Res> {
  __$FinalizedOrderCopyWithImpl(this._self, this._then);

  final _FinalizedOrder _self;
  final $Res Function(_FinalizedOrder) _then;

/// Create a copy of FinalizedOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paymentStatus = null,Object? finalizedAmount = null,Object? finalizedDate = null,}) {
  return _then(_FinalizedOrder(
paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,finalizedAmount: null == finalizedAmount ? _self.finalizedAmount : finalizedAmount // ignore: cast_nullable_to_non_nullable
as double,finalizedDate: null == finalizedDate ? _self.finalizedDate : finalizedDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$EffectivePriceModel {

 double get marketPrice; double get effectivePrice; double get priceImpact; double get totalCost; double get bnbPriceUsd; double get tokenReserve; double get bnbReserve;
/// Create a copy of EffectivePriceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EffectivePriceModelCopyWith<EffectivePriceModel> get copyWith => _$EffectivePriceModelCopyWithImpl<EffectivePriceModel>(this as EffectivePriceModel, _$identity);

  /// Serializes this EffectivePriceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EffectivePriceModel&&(identical(other.marketPrice, marketPrice) || other.marketPrice == marketPrice)&&(identical(other.effectivePrice, effectivePrice) || other.effectivePrice == effectivePrice)&&(identical(other.priceImpact, priceImpact) || other.priceImpact == priceImpact)&&(identical(other.totalCost, totalCost) || other.totalCost == totalCost)&&(identical(other.bnbPriceUsd, bnbPriceUsd) || other.bnbPriceUsd == bnbPriceUsd)&&(identical(other.tokenReserve, tokenReserve) || other.tokenReserve == tokenReserve)&&(identical(other.bnbReserve, bnbReserve) || other.bnbReserve == bnbReserve));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,marketPrice,effectivePrice,priceImpact,totalCost,bnbPriceUsd,tokenReserve,bnbReserve);

@override
String toString() {
  return 'EffectivePriceModel(marketPrice: $marketPrice, effectivePrice: $effectivePrice, priceImpact: $priceImpact, totalCost: $totalCost, bnbPriceUsd: $bnbPriceUsd, tokenReserve: $tokenReserve, bnbReserve: $bnbReserve)';
}


}

/// @nodoc
abstract mixin class $EffectivePriceModelCopyWith<$Res>  {
  factory $EffectivePriceModelCopyWith(EffectivePriceModel value, $Res Function(EffectivePriceModel) _then) = _$EffectivePriceModelCopyWithImpl;
@useResult
$Res call({
 double marketPrice, double effectivePrice, double priceImpact, double totalCost, double bnbPriceUsd, double tokenReserve, double bnbReserve
});




}
/// @nodoc
class _$EffectivePriceModelCopyWithImpl<$Res>
    implements $EffectivePriceModelCopyWith<$Res> {
  _$EffectivePriceModelCopyWithImpl(this._self, this._then);

  final EffectivePriceModel _self;
  final $Res Function(EffectivePriceModel) _then;

/// Create a copy of EffectivePriceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? marketPrice = null,Object? effectivePrice = null,Object? priceImpact = null,Object? totalCost = null,Object? bnbPriceUsd = null,Object? tokenReserve = null,Object? bnbReserve = null,}) {
  return _then(_self.copyWith(
marketPrice: null == marketPrice ? _self.marketPrice : marketPrice // ignore: cast_nullable_to_non_nullable
as double,effectivePrice: null == effectivePrice ? _self.effectivePrice : effectivePrice // ignore: cast_nullable_to_non_nullable
as double,priceImpact: null == priceImpact ? _self.priceImpact : priceImpact // ignore: cast_nullable_to_non_nullable
as double,totalCost: null == totalCost ? _self.totalCost : totalCost // ignore: cast_nullable_to_non_nullable
as double,bnbPriceUsd: null == bnbPriceUsd ? _self.bnbPriceUsd : bnbPriceUsd // ignore: cast_nullable_to_non_nullable
as double,tokenReserve: null == tokenReserve ? _self.tokenReserve : tokenReserve // ignore: cast_nullable_to_non_nullable
as double,bnbReserve: null == bnbReserve ? _self.bnbReserve : bnbReserve // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [EffectivePriceModel].
extension EffectivePriceModelPatterns on EffectivePriceModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EffectivePriceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EffectivePriceModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EffectivePriceModel value)  $default,){
final _that = this;
switch (_that) {
case _EffectivePriceModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EffectivePriceModel value)?  $default,){
final _that = this;
switch (_that) {
case _EffectivePriceModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double marketPrice,  double effectivePrice,  double priceImpact,  double totalCost,  double bnbPriceUsd,  double tokenReserve,  double bnbReserve)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EffectivePriceModel() when $default != null:
return $default(_that.marketPrice,_that.effectivePrice,_that.priceImpact,_that.totalCost,_that.bnbPriceUsd,_that.tokenReserve,_that.bnbReserve);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double marketPrice,  double effectivePrice,  double priceImpact,  double totalCost,  double bnbPriceUsd,  double tokenReserve,  double bnbReserve)  $default,) {final _that = this;
switch (_that) {
case _EffectivePriceModel():
return $default(_that.marketPrice,_that.effectivePrice,_that.priceImpact,_that.totalCost,_that.bnbPriceUsd,_that.tokenReserve,_that.bnbReserve);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double marketPrice,  double effectivePrice,  double priceImpact,  double totalCost,  double bnbPriceUsd,  double tokenReserve,  double bnbReserve)?  $default,) {final _that = this;
switch (_that) {
case _EffectivePriceModel() when $default != null:
return $default(_that.marketPrice,_that.effectivePrice,_that.priceImpact,_that.totalCost,_that.bnbPriceUsd,_that.tokenReserve,_that.bnbReserve);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EffectivePriceModel implements EffectivePriceModel {
  const _EffectivePriceModel({this.marketPrice = 0, this.effectivePrice = 0, this.priceImpact = 0, this.totalCost = 0, this.bnbPriceUsd = 0, this.tokenReserve = 0, this.bnbReserve = 0});
  factory _EffectivePriceModel.fromJson(Map<String, dynamic> json) => _$EffectivePriceModelFromJson(json);

@override@JsonKey() final  double marketPrice;
@override@JsonKey() final  double effectivePrice;
@override@JsonKey() final  double priceImpact;
@override@JsonKey() final  double totalCost;
@override@JsonKey() final  double bnbPriceUsd;
@override@JsonKey() final  double tokenReserve;
@override@JsonKey() final  double bnbReserve;

/// Create a copy of EffectivePriceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EffectivePriceModelCopyWith<_EffectivePriceModel> get copyWith => __$EffectivePriceModelCopyWithImpl<_EffectivePriceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EffectivePriceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EffectivePriceModel&&(identical(other.marketPrice, marketPrice) || other.marketPrice == marketPrice)&&(identical(other.effectivePrice, effectivePrice) || other.effectivePrice == effectivePrice)&&(identical(other.priceImpact, priceImpact) || other.priceImpact == priceImpact)&&(identical(other.totalCost, totalCost) || other.totalCost == totalCost)&&(identical(other.bnbPriceUsd, bnbPriceUsd) || other.bnbPriceUsd == bnbPriceUsd)&&(identical(other.tokenReserve, tokenReserve) || other.tokenReserve == tokenReserve)&&(identical(other.bnbReserve, bnbReserve) || other.bnbReserve == bnbReserve));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,marketPrice,effectivePrice,priceImpact,totalCost,bnbPriceUsd,tokenReserve,bnbReserve);

@override
String toString() {
  return 'EffectivePriceModel(marketPrice: $marketPrice, effectivePrice: $effectivePrice, priceImpact: $priceImpact, totalCost: $totalCost, bnbPriceUsd: $bnbPriceUsd, tokenReserve: $tokenReserve, bnbReserve: $bnbReserve)';
}


}

/// @nodoc
abstract mixin class _$EffectivePriceModelCopyWith<$Res> implements $EffectivePriceModelCopyWith<$Res> {
  factory _$EffectivePriceModelCopyWith(_EffectivePriceModel value, $Res Function(_EffectivePriceModel) _then) = __$EffectivePriceModelCopyWithImpl;
@override @useResult
$Res call({
 double marketPrice, double effectivePrice, double priceImpact, double totalCost, double bnbPriceUsd, double tokenReserve, double bnbReserve
});




}
/// @nodoc
class __$EffectivePriceModelCopyWithImpl<$Res>
    implements _$EffectivePriceModelCopyWith<$Res> {
  __$EffectivePriceModelCopyWithImpl(this._self, this._then);

  final _EffectivePriceModel _self;
  final $Res Function(_EffectivePriceModel) _then;

/// Create a copy of EffectivePriceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? marketPrice = null,Object? effectivePrice = null,Object? priceImpact = null,Object? totalCost = null,Object? bnbPriceUsd = null,Object? tokenReserve = null,Object? bnbReserve = null,}) {
  return _then(_EffectivePriceModel(
marketPrice: null == marketPrice ? _self.marketPrice : marketPrice // ignore: cast_nullable_to_non_nullable
as double,effectivePrice: null == effectivePrice ? _self.effectivePrice : effectivePrice // ignore: cast_nullable_to_non_nullable
as double,priceImpact: null == priceImpact ? _self.priceImpact : priceImpact // ignore: cast_nullable_to_non_nullable
as double,totalCost: null == totalCost ? _self.totalCost : totalCost // ignore: cast_nullable_to_non_nullable
as double,bnbPriceUsd: null == bnbPriceUsd ? _self.bnbPriceUsd : bnbPriceUsd // ignore: cast_nullable_to_non_nullable
as double,tokenReserve: null == tokenReserve ? _self.tokenReserve : tokenReserve // ignore: cast_nullable_to_non_nullable
as double,bnbReserve: null == bnbReserve ? _self.bnbReserve : bnbReserve // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
