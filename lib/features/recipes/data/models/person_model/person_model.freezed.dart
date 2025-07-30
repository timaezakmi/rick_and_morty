// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PersonModel {

 int get id; String get name; String get status; String get species; String get type; String get gender;@JsonKey(fromJson: LocationModel.fromJson, toJson: _locationToJson) LocationModel? get origin;@JsonKey(fromJson: LocationModel.fromJson, toJson: _locationToJson) LocationModel? get location; String get image; List<String> get episode; DateTime get created; bool get isFavored;
/// Create a copy of PersonModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonModelCopyWith<PersonModel> get copyWith => _$PersonModelCopyWithImpl<PersonModel>(this as PersonModel, _$identity);

  /// Serializes this PersonModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.species, species) || other.species == species)&&(identical(other.type, type) || other.type == type)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.location, location) || other.location == location)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other.episode, episode)&&(identical(other.created, created) || other.created == created)&&(identical(other.isFavored, isFavored) || other.isFavored == isFavored));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,status,species,type,gender,origin,location,image,const DeepCollectionEquality().hash(episode),created,isFavored);

@override
String toString() {
  return 'PersonModel(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episode: $episode, created: $created, isFavored: $isFavored)';
}


}

/// @nodoc
abstract mixin class $PersonModelCopyWith<$Res>  {
  factory $PersonModelCopyWith(PersonModel value, $Res Function(PersonModel) _then) = _$PersonModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String status, String species, String type, String gender,@JsonKey(fromJson: LocationModel.fromJson, toJson: _locationToJson) LocationModel? origin,@JsonKey(fromJson: LocationModel.fromJson, toJson: _locationToJson) LocationModel? location, String image, List<String> episode, DateTime created, bool isFavored
});


$LocationModelCopyWith<$Res>? get origin;$LocationModelCopyWith<$Res>? get location;

}
/// @nodoc
class _$PersonModelCopyWithImpl<$Res>
    implements $PersonModelCopyWith<$Res> {
  _$PersonModelCopyWithImpl(this._self, this._then);

  final PersonModel _self;
  final $Res Function(PersonModel) _then;

/// Create a copy of PersonModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? status = null,Object? species = null,Object? type = null,Object? gender = null,Object? origin = freezed,Object? location = freezed,Object? image = null,Object? episode = null,Object? created = null,Object? isFavored = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,origin: freezed == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as LocationModel?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationModel?,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as List<String>,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime,isFavored: null == isFavored ? _self.isFavored : isFavored // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PersonModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationModelCopyWith<$Res>? get origin {
    if (_self.origin == null) {
    return null;
  }

  return $LocationModelCopyWith<$Res>(_self.origin!, (value) {
    return _then(_self.copyWith(origin: value));
  });
}/// Create a copy of PersonModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationModelCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationModelCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [PersonModel].
extension PersonModelPatterns on PersonModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonModel value)  $default,){
final _that = this;
switch (_that) {
case _PersonModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonModel value)?  $default,){
final _that = this;
switch (_that) {
case _PersonModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String status,  String species,  String type,  String gender, @JsonKey(fromJson: LocationModel.fromJson, toJson: _locationToJson)  LocationModel? origin, @JsonKey(fromJson: LocationModel.fromJson, toJson: _locationToJson)  LocationModel? location,  String image,  List<String> episode,  DateTime created,  bool isFavored)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonModel() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.species,_that.type,_that.gender,_that.origin,_that.location,_that.image,_that.episode,_that.created,_that.isFavored);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String status,  String species,  String type,  String gender, @JsonKey(fromJson: LocationModel.fromJson, toJson: _locationToJson)  LocationModel? origin, @JsonKey(fromJson: LocationModel.fromJson, toJson: _locationToJson)  LocationModel? location,  String image,  List<String> episode,  DateTime created,  bool isFavored)  $default,) {final _that = this;
switch (_that) {
case _PersonModel():
return $default(_that.id,_that.name,_that.status,_that.species,_that.type,_that.gender,_that.origin,_that.location,_that.image,_that.episode,_that.created,_that.isFavored);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String status,  String species,  String type,  String gender, @JsonKey(fromJson: LocationModel.fromJson, toJson: _locationToJson)  LocationModel? origin, @JsonKey(fromJson: LocationModel.fromJson, toJson: _locationToJson)  LocationModel? location,  String image,  List<String> episode,  DateTime created,  bool isFavored)?  $default,) {final _that = this;
switch (_that) {
case _PersonModel() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.species,_that.type,_that.gender,_that.origin,_that.location,_that.image,_that.episode,_that.created,_that.isFavored);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PersonModel extends PersonModel {
  const _PersonModel({required this.id, required this.name, required this.status, required this.species, required this.type, required this.gender, @JsonKey(fromJson: LocationModel.fromJson, toJson: _locationToJson) this.origin, @JsonKey(fromJson: LocationModel.fromJson, toJson: _locationToJson) this.location, required this.image, required final  List<String> episode, required this.created, this.isFavored = false}): _episode = episode,super._();
  factory _PersonModel.fromJson(Map<String, dynamic> json) => _$PersonModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String status;
@override final  String species;
@override final  String type;
@override final  String gender;
@override@JsonKey(fromJson: LocationModel.fromJson, toJson: _locationToJson) final  LocationModel? origin;
@override@JsonKey(fromJson: LocationModel.fromJson, toJson: _locationToJson) final  LocationModel? location;
@override final  String image;
 final  List<String> _episode;
@override List<String> get episode {
  if (_episode is EqualUnmodifiableListView) return _episode;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_episode);
}

@override final  DateTime created;
@override@JsonKey() final  bool isFavored;

/// Create a copy of PersonModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonModelCopyWith<_PersonModel> get copyWith => __$PersonModelCopyWithImpl<_PersonModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PersonModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.species, species) || other.species == species)&&(identical(other.type, type) || other.type == type)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.location, location) || other.location == location)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other._episode, _episode)&&(identical(other.created, created) || other.created == created)&&(identical(other.isFavored, isFavored) || other.isFavored == isFavored));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,status,species,type,gender,origin,location,image,const DeepCollectionEquality().hash(_episode),created,isFavored);

@override
String toString() {
  return 'PersonModel(id: $id, name: $name, status: $status, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, image: $image, episode: $episode, created: $created, isFavored: $isFavored)';
}


}

/// @nodoc
abstract mixin class _$PersonModelCopyWith<$Res> implements $PersonModelCopyWith<$Res> {
  factory _$PersonModelCopyWith(_PersonModel value, $Res Function(_PersonModel) _then) = __$PersonModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String status, String species, String type, String gender,@JsonKey(fromJson: LocationModel.fromJson, toJson: _locationToJson) LocationModel? origin,@JsonKey(fromJson: LocationModel.fromJson, toJson: _locationToJson) LocationModel? location, String image, List<String> episode, DateTime created, bool isFavored
});


@override $LocationModelCopyWith<$Res>? get origin;@override $LocationModelCopyWith<$Res>? get location;

}
/// @nodoc
class __$PersonModelCopyWithImpl<$Res>
    implements _$PersonModelCopyWith<$Res> {
  __$PersonModelCopyWithImpl(this._self, this._then);

  final _PersonModel _self;
  final $Res Function(_PersonModel) _then;

/// Create a copy of PersonModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? status = null,Object? species = null,Object? type = null,Object? gender = null,Object? origin = freezed,Object? location = freezed,Object? image = null,Object? episode = null,Object? created = null,Object? isFavored = null,}) {
  return _then(_PersonModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,origin: freezed == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as LocationModel?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationModel?,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,episode: null == episode ? _self._episode : episode // ignore: cast_nullable_to_non_nullable
as List<String>,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime,isFavored: null == isFavored ? _self.isFavored : isFavored // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PersonModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationModelCopyWith<$Res>? get origin {
    if (_self.origin == null) {
    return null;
  }

  return $LocationModelCopyWith<$Res>(_self.origin!, (value) {
    return _then(_self.copyWith(origin: value));
  });
}/// Create a copy of PersonModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationModelCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationModelCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}

// dart format on
