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
mixin _$InventoryModel {

 String get tokenName; String get tokenNetwork; double get price; double get quantity; String get lastUpdated;
/// Create a copy of InventoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryModelCopyWith<InventoryModel> get copyWith => _$InventoryModelCopyWithImpl<InventoryModel>(this as InventoryModel, _$identity);

  /// Serializes this InventoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryModel&&(identical(other.tokenName, tokenName) || other.tokenName == tokenName)&&(identical(other.tokenNetwork, tokenNetwork) || other.tokenNetwork == tokenNetwork)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tokenName,tokenNetwork,price,quantity,lastUpdated);

@override
String toString() {
  return 'InventoryModel(tokenName: $tokenName, tokenNetwork: $tokenNetwork, price: $price, quantity: $quantity, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class $InventoryModelCopyWith<$Res>  {
  factory $InventoryModelCopyWith(InventoryModel value, $Res Function(InventoryModel) _then) = _$InventoryModelCopyWithImpl;
@useResult
$Res call({
 String tokenName, String tokenNetwork, double price, double quantity, String lastUpdated
});




}
/// @nodoc
class _$InventoryModelCopyWithImpl<$Res>
    implements $InventoryModelCopyWith<$Res> {
  _$InventoryModelCopyWithImpl(this._self, this._then);

  final InventoryModel _self;
  final $Res Function(InventoryModel) _then;

/// Create a copy of InventoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tokenName = null,Object? tokenNetwork = null,Object? price = null,Object? quantity = null,Object? lastUpdated = null,}) {
  return _then(_self.copyWith(
tokenName: null == tokenName ? _self.tokenName : tokenName // ignore: cast_nullable_to_non_nullable
as String,tokenNetwork: null == tokenNetwork ? _self.tokenNetwork : tokenNetwork // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [InventoryModel].
extension InventoryModelPatterns on InventoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InventoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InventoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InventoryModel value)  $default,){
final _that = this;
switch (_that) {
case _InventoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InventoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _InventoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tokenName,  String tokenNetwork,  double price,  double quantity,  String lastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InventoryModel() when $default != null:
return $default(_that.tokenName,_that.tokenNetwork,_that.price,_that.quantity,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tokenName,  String tokenNetwork,  double price,  double quantity,  String lastUpdated)  $default,) {final _that = this;
switch (_that) {
case _InventoryModel():
return $default(_that.tokenName,_that.tokenNetwork,_that.price,_that.quantity,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tokenName,  String tokenNetwork,  double price,  double quantity,  String lastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _InventoryModel() when $default != null:
return $default(_that.tokenName,_that.tokenNetwork,_that.price,_that.quantity,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InventoryModel implements InventoryModel {
  const _InventoryModel({required this.tokenName, required this.tokenNetwork, required this.price, required this.quantity, required this.lastUpdated});
  factory _InventoryModel.fromJson(Map<String, dynamic> json) => _$InventoryModelFromJson(json);

@override final  String tokenName;
@override final  String tokenNetwork;
@override final  double price;
@override final  double quantity;
@override final  String lastUpdated;

/// Create a copy of InventoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventoryModelCopyWith<_InventoryModel> get copyWith => __$InventoryModelCopyWithImpl<_InventoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InventoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InventoryModel&&(identical(other.tokenName, tokenName) || other.tokenName == tokenName)&&(identical(other.tokenNetwork, tokenNetwork) || other.tokenNetwork == tokenNetwork)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tokenName,tokenNetwork,price,quantity,lastUpdated);

@override
String toString() {
  return 'InventoryModel(tokenName: $tokenName, tokenNetwork: $tokenNetwork, price: $price, quantity: $quantity, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$InventoryModelCopyWith<$Res> implements $InventoryModelCopyWith<$Res> {
  factory _$InventoryModelCopyWith(_InventoryModel value, $Res Function(_InventoryModel) _then) = __$InventoryModelCopyWithImpl;
@override @useResult
$Res call({
 String tokenName, String tokenNetwork, double price, double quantity, String lastUpdated
});




}
/// @nodoc
class __$InventoryModelCopyWithImpl<$Res>
    implements _$InventoryModelCopyWith<$Res> {
  __$InventoryModelCopyWithImpl(this._self, this._then);

  final _InventoryModel _self;
  final $Res Function(_InventoryModel) _then;

/// Create a copy of InventoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tokenName = null,Object? tokenNetwork = null,Object? price = null,Object? quantity = null,Object? lastUpdated = null,}) {
  return _then(_InventoryModel(
tokenName: null == tokenName ? _self.tokenName : tokenName // ignore: cast_nullable_to_non_nullable
as String,tokenNetwork: null == tokenNetwork ? _self.tokenNetwork : tokenNetwork // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UserStats {

 String get userStatus; double get mining; double get availableLoanAmount; double get sumOfMining; int get minimumBuyAmount; int get maximumBuyAmount; int get maximumPayOfMonth; UserStage get stage;
/// Create a copy of UserStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserStatsCopyWith<UserStats> get copyWith => _$UserStatsCopyWithImpl<UserStats>(this as UserStats, _$identity);

  /// Serializes this UserStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserStats&&(identical(other.userStatus, userStatus) || other.userStatus == userStatus)&&(identical(other.mining, mining) || other.mining == mining)&&(identical(other.availableLoanAmount, availableLoanAmount) || other.availableLoanAmount == availableLoanAmount)&&(identical(other.sumOfMining, sumOfMining) || other.sumOfMining == sumOfMining)&&(identical(other.minimumBuyAmount, minimumBuyAmount) || other.minimumBuyAmount == minimumBuyAmount)&&(identical(other.maximumBuyAmount, maximumBuyAmount) || other.maximumBuyAmount == maximumBuyAmount)&&(identical(other.maximumPayOfMonth, maximumPayOfMonth) || other.maximumPayOfMonth == maximumPayOfMonth)&&(identical(other.stage, stage) || other.stage == stage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userStatus,mining,availableLoanAmount,sumOfMining,minimumBuyAmount,maximumBuyAmount,maximumPayOfMonth,stage);

@override
String toString() {
  return 'UserStats(userStatus: $userStatus, mining: $mining, availableLoanAmount: $availableLoanAmount, sumOfMining: $sumOfMining, minimumBuyAmount: $minimumBuyAmount, maximumBuyAmount: $maximumBuyAmount, maximumPayOfMonth: $maximumPayOfMonth, stage: $stage)';
}


}

/// @nodoc
abstract mixin class $UserStatsCopyWith<$Res>  {
  factory $UserStatsCopyWith(UserStats value, $Res Function(UserStats) _then) = _$UserStatsCopyWithImpl;
@useResult
$Res call({
 String userStatus, double mining, double availableLoanAmount, double sumOfMining, int minimumBuyAmount, int maximumBuyAmount, int maximumPayOfMonth, UserStage stage
});




}
/// @nodoc
class _$UserStatsCopyWithImpl<$Res>
    implements $UserStatsCopyWith<$Res> {
  _$UserStatsCopyWithImpl(this._self, this._then);

  final UserStats _self;
  final $Res Function(UserStats) _then;

/// Create a copy of UserStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userStatus = null,Object? mining = null,Object? availableLoanAmount = null,Object? sumOfMining = null,Object? minimumBuyAmount = null,Object? maximumBuyAmount = null,Object? maximumPayOfMonth = null,Object? stage = null,}) {
  return _then(_self.copyWith(
userStatus: null == userStatus ? _self.userStatus : userStatus // ignore: cast_nullable_to_non_nullable
as String,mining: null == mining ? _self.mining : mining // ignore: cast_nullable_to_non_nullable
as double,availableLoanAmount: null == availableLoanAmount ? _self.availableLoanAmount : availableLoanAmount // ignore: cast_nullable_to_non_nullable
as double,sumOfMining: null == sumOfMining ? _self.sumOfMining : sumOfMining // ignore: cast_nullable_to_non_nullable
as double,minimumBuyAmount: null == minimumBuyAmount ? _self.minimumBuyAmount : minimumBuyAmount // ignore: cast_nullable_to_non_nullable
as int,maximumBuyAmount: null == maximumBuyAmount ? _self.maximumBuyAmount : maximumBuyAmount // ignore: cast_nullable_to_non_nullable
as int,maximumPayOfMonth: null == maximumPayOfMonth ? _self.maximumPayOfMonth : maximumPayOfMonth // ignore: cast_nullable_to_non_nullable
as int,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as UserStage,
  ));
}

}


/// Adds pattern-matching-related methods to [UserStats].
extension UserStatsPatterns on UserStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserStats value)  $default,){
final _that = this;
switch (_that) {
case _UserStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserStats value)?  $default,){
final _that = this;
switch (_that) {
case _UserStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userStatus,  double mining,  double availableLoanAmount,  double sumOfMining,  int minimumBuyAmount,  int maximumBuyAmount,  int maximumPayOfMonth,  UserStage stage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserStats() when $default != null:
return $default(_that.userStatus,_that.mining,_that.availableLoanAmount,_that.sumOfMining,_that.minimumBuyAmount,_that.maximumBuyAmount,_that.maximumPayOfMonth,_that.stage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userStatus,  double mining,  double availableLoanAmount,  double sumOfMining,  int minimumBuyAmount,  int maximumBuyAmount,  int maximumPayOfMonth,  UserStage stage)  $default,) {final _that = this;
switch (_that) {
case _UserStats():
return $default(_that.userStatus,_that.mining,_that.availableLoanAmount,_that.sumOfMining,_that.minimumBuyAmount,_that.maximumBuyAmount,_that.maximumPayOfMonth,_that.stage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userStatus,  double mining,  double availableLoanAmount,  double sumOfMining,  int minimumBuyAmount,  int maximumBuyAmount,  int maximumPayOfMonth,  UserStage stage)?  $default,) {final _that = this;
switch (_that) {
case _UserStats() when $default != null:
return $default(_that.userStatus,_that.mining,_that.availableLoanAmount,_that.sumOfMining,_that.minimumBuyAmount,_that.maximumBuyAmount,_that.maximumPayOfMonth,_that.stage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserStats implements UserStats {
  const _UserStats({required this.userStatus, required this.mining, required this.availableLoanAmount, required this.sumOfMining, required this.minimumBuyAmount, required this.maximumBuyAmount, required this.maximumPayOfMonth, this.stage = UserStage.regular});
  factory _UserStats.fromJson(Map<String, dynamic> json) => _$UserStatsFromJson(json);

@override final  String userStatus;
@override final  double mining;
@override final  double availableLoanAmount;
@override final  double sumOfMining;
@override final  int minimumBuyAmount;
@override final  int maximumBuyAmount;
@override final  int maximumPayOfMonth;
@override@JsonKey() final  UserStage stage;

/// Create a copy of UserStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserStatsCopyWith<_UserStats> get copyWith => __$UserStatsCopyWithImpl<_UserStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserStats&&(identical(other.userStatus, userStatus) || other.userStatus == userStatus)&&(identical(other.mining, mining) || other.mining == mining)&&(identical(other.availableLoanAmount, availableLoanAmount) || other.availableLoanAmount == availableLoanAmount)&&(identical(other.sumOfMining, sumOfMining) || other.sumOfMining == sumOfMining)&&(identical(other.minimumBuyAmount, minimumBuyAmount) || other.minimumBuyAmount == minimumBuyAmount)&&(identical(other.maximumBuyAmount, maximumBuyAmount) || other.maximumBuyAmount == maximumBuyAmount)&&(identical(other.maximumPayOfMonth, maximumPayOfMonth) || other.maximumPayOfMonth == maximumPayOfMonth)&&(identical(other.stage, stage) || other.stage == stage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userStatus,mining,availableLoanAmount,sumOfMining,minimumBuyAmount,maximumBuyAmount,maximumPayOfMonth,stage);

@override
String toString() {
  return 'UserStats(userStatus: $userStatus, mining: $mining, availableLoanAmount: $availableLoanAmount, sumOfMining: $sumOfMining, minimumBuyAmount: $minimumBuyAmount, maximumBuyAmount: $maximumBuyAmount, maximumPayOfMonth: $maximumPayOfMonth, stage: $stage)';
}


}

/// @nodoc
abstract mixin class _$UserStatsCopyWith<$Res> implements $UserStatsCopyWith<$Res> {
  factory _$UserStatsCopyWith(_UserStats value, $Res Function(_UserStats) _then) = __$UserStatsCopyWithImpl;
@override @useResult
$Res call({
 String userStatus, double mining, double availableLoanAmount, double sumOfMining, int minimumBuyAmount, int maximumBuyAmount, int maximumPayOfMonth, UserStage stage
});




}
/// @nodoc
class __$UserStatsCopyWithImpl<$Res>
    implements _$UserStatsCopyWith<$Res> {
  __$UserStatsCopyWithImpl(this._self, this._then);

  final _UserStats _self;
  final $Res Function(_UserStats) _then;

/// Create a copy of UserStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userStatus = null,Object? mining = null,Object? availableLoanAmount = null,Object? sumOfMining = null,Object? minimumBuyAmount = null,Object? maximumBuyAmount = null,Object? maximumPayOfMonth = null,Object? stage = null,}) {
  return _then(_UserStats(
userStatus: null == userStatus ? _self.userStatus : userStatus // ignore: cast_nullable_to_non_nullable
as String,mining: null == mining ? _self.mining : mining // ignore: cast_nullable_to_non_nullable
as double,availableLoanAmount: null == availableLoanAmount ? _self.availableLoanAmount : availableLoanAmount // ignore: cast_nullable_to_non_nullable
as double,sumOfMining: null == sumOfMining ? _self.sumOfMining : sumOfMining // ignore: cast_nullable_to_non_nullable
as double,minimumBuyAmount: null == minimumBuyAmount ? _self.minimumBuyAmount : minimumBuyAmount // ignore: cast_nullable_to_non_nullable
as int,maximumBuyAmount: null == maximumBuyAmount ? _self.maximumBuyAmount : maximumBuyAmount // ignore: cast_nullable_to_non_nullable
as int,maximumPayOfMonth: null == maximumPayOfMonth ? _self.maximumPayOfMonth : maximumPayOfMonth // ignore: cast_nullable_to_non_nullable
as int,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as UserStage,
  ));
}


}

// dart format on
