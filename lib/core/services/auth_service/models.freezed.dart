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
mixin _$NonceData {

 String get nonce; String get message; String get expireMoment;
/// Create a copy of NonceData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NonceDataCopyWith<NonceData> get copyWith => _$NonceDataCopyWithImpl<NonceData>(this as NonceData, _$identity);

  /// Serializes this NonceData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NonceData&&(identical(other.nonce, nonce) || other.nonce == nonce)&&(identical(other.message, message) || other.message == message)&&(identical(other.expireMoment, expireMoment) || other.expireMoment == expireMoment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nonce,message,expireMoment);

@override
String toString() {
  return 'NonceData(nonce: $nonce, message: $message, expireMoment: $expireMoment)';
}


}

/// @nodoc
abstract mixin class $NonceDataCopyWith<$Res>  {
  factory $NonceDataCopyWith(NonceData value, $Res Function(NonceData) _then) = _$NonceDataCopyWithImpl;
@useResult
$Res call({
 String nonce, String message, String expireMoment
});




}
/// @nodoc
class _$NonceDataCopyWithImpl<$Res>
    implements $NonceDataCopyWith<$Res> {
  _$NonceDataCopyWithImpl(this._self, this._then);

  final NonceData _self;
  final $Res Function(NonceData) _then;

/// Create a copy of NonceData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nonce = null,Object? message = null,Object? expireMoment = null,}) {
  return _then(_self.copyWith(
nonce: null == nonce ? _self.nonce : nonce // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,expireMoment: null == expireMoment ? _self.expireMoment : expireMoment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NonceData].
extension NonceDataPatterns on NonceData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NonceData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NonceData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NonceData value)  $default,){
final _that = this;
switch (_that) {
case _NonceData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NonceData value)?  $default,){
final _that = this;
switch (_that) {
case _NonceData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nonce,  String message,  String expireMoment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NonceData() when $default != null:
return $default(_that.nonce,_that.message,_that.expireMoment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nonce,  String message,  String expireMoment)  $default,) {final _that = this;
switch (_that) {
case _NonceData():
return $default(_that.nonce,_that.message,_that.expireMoment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nonce,  String message,  String expireMoment)?  $default,) {final _that = this;
switch (_that) {
case _NonceData() when $default != null:
return $default(_that.nonce,_that.message,_that.expireMoment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NonceData implements NonceData {
  const _NonceData({required this.nonce, required this.message, required this.expireMoment});
  factory _NonceData.fromJson(Map<String, dynamic> json) => _$NonceDataFromJson(json);

@override final  String nonce;
@override final  String message;
@override final  String expireMoment;

/// Create a copy of NonceData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NonceDataCopyWith<_NonceData> get copyWith => __$NonceDataCopyWithImpl<_NonceData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NonceDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NonceData&&(identical(other.nonce, nonce) || other.nonce == nonce)&&(identical(other.message, message) || other.message == message)&&(identical(other.expireMoment, expireMoment) || other.expireMoment == expireMoment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nonce,message,expireMoment);

@override
String toString() {
  return 'NonceData(nonce: $nonce, message: $message, expireMoment: $expireMoment)';
}


}

/// @nodoc
abstract mixin class _$NonceDataCopyWith<$Res> implements $NonceDataCopyWith<$Res> {
  factory _$NonceDataCopyWith(_NonceData value, $Res Function(_NonceData) _then) = __$NonceDataCopyWithImpl;
@override @useResult
$Res call({
 String nonce, String message, String expireMoment
});




}
/// @nodoc
class __$NonceDataCopyWithImpl<$Res>
    implements _$NonceDataCopyWith<$Res> {
  __$NonceDataCopyWithImpl(this._self, this._then);

  final _NonceData _self;
  final $Res Function(_NonceData) _then;

/// Create a copy of NonceData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nonce = null,Object? message = null,Object? expireMoment = null,}) {
  return _then(_NonceData(
nonce: null == nonce ? _self.nonce : nonce // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,expireMoment: null == expireMoment ? _self.expireMoment : expireMoment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
