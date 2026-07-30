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
mixin _$CampaignBanner {

 double get discountPercentage; double get minUSDValue; double get maxUSDValue; double get userUsedUSDValue; double get userRemainingUSDValue; bool get isAvailableForUser; int get maxUsers; bool get isWalletDiscount; String? get campaignReference;
/// Create a copy of CampaignBanner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CampaignBannerCopyWith<CampaignBanner> get copyWith => _$CampaignBannerCopyWithImpl<CampaignBanner>(this as CampaignBanner, _$identity);

  /// Serializes this CampaignBanner to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CampaignBanner&&(identical(other.discountPercentage, discountPercentage) || other.discountPercentage == discountPercentage)&&(identical(other.minUSDValue, minUSDValue) || other.minUSDValue == minUSDValue)&&(identical(other.maxUSDValue, maxUSDValue) || other.maxUSDValue == maxUSDValue)&&(identical(other.userUsedUSDValue, userUsedUSDValue) || other.userUsedUSDValue == userUsedUSDValue)&&(identical(other.userRemainingUSDValue, userRemainingUSDValue) || other.userRemainingUSDValue == userRemainingUSDValue)&&(identical(other.isAvailableForUser, isAvailableForUser) || other.isAvailableForUser == isAvailableForUser)&&(identical(other.maxUsers, maxUsers) || other.maxUsers == maxUsers)&&(identical(other.isWalletDiscount, isWalletDiscount) || other.isWalletDiscount == isWalletDiscount)&&(identical(other.campaignReference, campaignReference) || other.campaignReference == campaignReference));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,discountPercentage,minUSDValue,maxUSDValue,userUsedUSDValue,userRemainingUSDValue,isAvailableForUser,maxUsers,isWalletDiscount,campaignReference);

@override
String toString() {
  return 'CampaignBanner(discountPercentage: $discountPercentage, minUSDValue: $minUSDValue, maxUSDValue: $maxUSDValue, userUsedUSDValue: $userUsedUSDValue, userRemainingUSDValue: $userRemainingUSDValue, isAvailableForUser: $isAvailableForUser, maxUsers: $maxUsers, isWalletDiscount: $isWalletDiscount, campaignReference: $campaignReference)';
}


}

/// @nodoc
abstract mixin class $CampaignBannerCopyWith<$Res>  {
  factory $CampaignBannerCopyWith(CampaignBanner value, $Res Function(CampaignBanner) _then) = _$CampaignBannerCopyWithImpl;
@useResult
$Res call({
 double discountPercentage, double minUSDValue, double maxUSDValue, double userUsedUSDValue, double userRemainingUSDValue, bool isAvailableForUser, int maxUsers, bool isWalletDiscount, String? campaignReference
});




}
/// @nodoc
class _$CampaignBannerCopyWithImpl<$Res>
    implements $CampaignBannerCopyWith<$Res> {
  _$CampaignBannerCopyWithImpl(this._self, this._then);

  final CampaignBanner _self;
  final $Res Function(CampaignBanner) _then;

/// Create a copy of CampaignBanner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? discountPercentage = null,Object? minUSDValue = null,Object? maxUSDValue = null,Object? userUsedUSDValue = null,Object? userRemainingUSDValue = null,Object? isAvailableForUser = null,Object? maxUsers = null,Object? isWalletDiscount = null,Object? campaignReference = freezed,}) {
  return _then(_self.copyWith(
discountPercentage: null == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as double,minUSDValue: null == minUSDValue ? _self.minUSDValue : minUSDValue // ignore: cast_nullable_to_non_nullable
as double,maxUSDValue: null == maxUSDValue ? _self.maxUSDValue : maxUSDValue // ignore: cast_nullable_to_non_nullable
as double,userUsedUSDValue: null == userUsedUSDValue ? _self.userUsedUSDValue : userUsedUSDValue // ignore: cast_nullable_to_non_nullable
as double,userRemainingUSDValue: null == userRemainingUSDValue ? _self.userRemainingUSDValue : userRemainingUSDValue // ignore: cast_nullable_to_non_nullable
as double,isAvailableForUser: null == isAvailableForUser ? _self.isAvailableForUser : isAvailableForUser // ignore: cast_nullable_to_non_nullable
as bool,maxUsers: null == maxUsers ? _self.maxUsers : maxUsers // ignore: cast_nullable_to_non_nullable
as int,isWalletDiscount: null == isWalletDiscount ? _self.isWalletDiscount : isWalletDiscount // ignore: cast_nullable_to_non_nullable
as bool,campaignReference: freezed == campaignReference ? _self.campaignReference : campaignReference // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CampaignBanner].
extension CampaignBannerPatterns on CampaignBanner {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CampaignBanner value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CampaignBanner() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CampaignBanner value)  $default,){
final _that = this;
switch (_that) {
case _CampaignBanner():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CampaignBanner value)?  $default,){
final _that = this;
switch (_that) {
case _CampaignBanner() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double discountPercentage,  double minUSDValue,  double maxUSDValue,  double userUsedUSDValue,  double userRemainingUSDValue,  bool isAvailableForUser,  int maxUsers,  bool isWalletDiscount,  String? campaignReference)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CampaignBanner() when $default != null:
return $default(_that.discountPercentage,_that.minUSDValue,_that.maxUSDValue,_that.userUsedUSDValue,_that.userRemainingUSDValue,_that.isAvailableForUser,_that.maxUsers,_that.isWalletDiscount,_that.campaignReference);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double discountPercentage,  double minUSDValue,  double maxUSDValue,  double userUsedUSDValue,  double userRemainingUSDValue,  bool isAvailableForUser,  int maxUsers,  bool isWalletDiscount,  String? campaignReference)  $default,) {final _that = this;
switch (_that) {
case _CampaignBanner():
return $default(_that.discountPercentage,_that.minUSDValue,_that.maxUSDValue,_that.userUsedUSDValue,_that.userRemainingUSDValue,_that.isAvailableForUser,_that.maxUsers,_that.isWalletDiscount,_that.campaignReference);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double discountPercentage,  double minUSDValue,  double maxUSDValue,  double userUsedUSDValue,  double userRemainingUSDValue,  bool isAvailableForUser,  int maxUsers,  bool isWalletDiscount,  String? campaignReference)?  $default,) {final _that = this;
switch (_that) {
case _CampaignBanner() when $default != null:
return $default(_that.discountPercentage,_that.minUSDValue,_that.maxUSDValue,_that.userUsedUSDValue,_that.userRemainingUSDValue,_that.isAvailableForUser,_that.maxUsers,_that.isWalletDiscount,_that.campaignReference);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CampaignBanner implements CampaignBanner {
  const _CampaignBanner({this.discountPercentage = 0, this.minUSDValue = 0, this.maxUSDValue = 0, this.userUsedUSDValue = 0, this.userRemainingUSDValue = 0, this.isAvailableForUser = false, this.maxUsers = 0, this.isWalletDiscount = false, this.campaignReference});
  factory _CampaignBanner.fromJson(Map<String, dynamic> json) => _$CampaignBannerFromJson(json);

@override@JsonKey() final  double discountPercentage;
@override@JsonKey() final  double minUSDValue;
@override@JsonKey() final  double maxUSDValue;
@override@JsonKey() final  double userUsedUSDValue;
@override@JsonKey() final  double userRemainingUSDValue;
@override@JsonKey() final  bool isAvailableForUser;
@override@JsonKey() final  int maxUsers;
@override@JsonKey() final  bool isWalletDiscount;
@override final  String? campaignReference;

/// Create a copy of CampaignBanner
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CampaignBannerCopyWith<_CampaignBanner> get copyWith => __$CampaignBannerCopyWithImpl<_CampaignBanner>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CampaignBannerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CampaignBanner&&(identical(other.discountPercentage, discountPercentage) || other.discountPercentage == discountPercentage)&&(identical(other.minUSDValue, minUSDValue) || other.minUSDValue == minUSDValue)&&(identical(other.maxUSDValue, maxUSDValue) || other.maxUSDValue == maxUSDValue)&&(identical(other.userUsedUSDValue, userUsedUSDValue) || other.userUsedUSDValue == userUsedUSDValue)&&(identical(other.userRemainingUSDValue, userRemainingUSDValue) || other.userRemainingUSDValue == userRemainingUSDValue)&&(identical(other.isAvailableForUser, isAvailableForUser) || other.isAvailableForUser == isAvailableForUser)&&(identical(other.maxUsers, maxUsers) || other.maxUsers == maxUsers)&&(identical(other.isWalletDiscount, isWalletDiscount) || other.isWalletDiscount == isWalletDiscount)&&(identical(other.campaignReference, campaignReference) || other.campaignReference == campaignReference));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,discountPercentage,minUSDValue,maxUSDValue,userUsedUSDValue,userRemainingUSDValue,isAvailableForUser,maxUsers,isWalletDiscount,campaignReference);

@override
String toString() {
  return 'CampaignBanner(discountPercentage: $discountPercentage, minUSDValue: $minUSDValue, maxUSDValue: $maxUSDValue, userUsedUSDValue: $userUsedUSDValue, userRemainingUSDValue: $userRemainingUSDValue, isAvailableForUser: $isAvailableForUser, maxUsers: $maxUsers, isWalletDiscount: $isWalletDiscount, campaignReference: $campaignReference)';
}


}

/// @nodoc
abstract mixin class _$CampaignBannerCopyWith<$Res> implements $CampaignBannerCopyWith<$Res> {
  factory _$CampaignBannerCopyWith(_CampaignBanner value, $Res Function(_CampaignBanner) _then) = __$CampaignBannerCopyWithImpl;
@override @useResult
$Res call({
 double discountPercentage, double minUSDValue, double maxUSDValue, double userUsedUSDValue, double userRemainingUSDValue, bool isAvailableForUser, int maxUsers, bool isWalletDiscount, String? campaignReference
});




}
/// @nodoc
class __$CampaignBannerCopyWithImpl<$Res>
    implements _$CampaignBannerCopyWith<$Res> {
  __$CampaignBannerCopyWithImpl(this._self, this._then);

  final _CampaignBanner _self;
  final $Res Function(_CampaignBanner) _then;

/// Create a copy of CampaignBanner
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? discountPercentage = null,Object? minUSDValue = null,Object? maxUSDValue = null,Object? userUsedUSDValue = null,Object? userRemainingUSDValue = null,Object? isAvailableForUser = null,Object? maxUsers = null,Object? isWalletDiscount = null,Object? campaignReference = freezed,}) {
  return _then(_CampaignBanner(
discountPercentage: null == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as double,minUSDValue: null == minUSDValue ? _self.minUSDValue : minUSDValue // ignore: cast_nullable_to_non_nullable
as double,maxUSDValue: null == maxUSDValue ? _self.maxUSDValue : maxUSDValue // ignore: cast_nullable_to_non_nullable
as double,userUsedUSDValue: null == userUsedUSDValue ? _self.userUsedUSDValue : userUsedUSDValue // ignore: cast_nullable_to_non_nullable
as double,userRemainingUSDValue: null == userRemainingUSDValue ? _self.userRemainingUSDValue : userRemainingUSDValue // ignore: cast_nullable_to_non_nullable
as double,isAvailableForUser: null == isAvailableForUser ? _self.isAvailableForUser : isAvailableForUser // ignore: cast_nullable_to_non_nullable
as bool,maxUsers: null == maxUsers ? _self.maxUsers : maxUsers // ignore: cast_nullable_to_non_nullable
as int,isWalletDiscount: null == isWalletDiscount ? _self.isWalletDiscount : isWalletDiscount // ignore: cast_nullable_to_non_nullable
as bool,campaignReference: freezed == campaignReference ? _self.campaignReference : campaignReference // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
