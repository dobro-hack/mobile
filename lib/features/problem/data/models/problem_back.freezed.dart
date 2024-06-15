// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'problem_back.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProblemBack _$ProblemBackFromJson(Map<String, dynamic> json) {
  return _ProblemBack.fromJson(json);
}

/// @nodoc
mixin _$ProblemBack {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserID')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SentAt')
  DateTime get sentAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Type')
  ProblemType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'Message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'Location')
  LocationProblem get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status')
  ProblemStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'FileUrl')
  String get fileUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'Phone')
  String get phone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProblemBackCopyWith<ProblemBack> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProblemBackCopyWith<$Res> {
  factory $ProblemBackCopyWith(
          ProblemBack value, $Res Function(ProblemBack) then) =
      _$ProblemBackCopyWithImpl<$Res, ProblemBack>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'UserID') int userId,
      @JsonKey(name: 'SentAt') DateTime sentAt,
      @JsonKey(name: 'Type') ProblemType type,
      @JsonKey(name: 'Message') String message,
      @JsonKey(name: 'Location') LocationProblem location,
      @JsonKey(name: 'Status') ProblemStatus status,
      @JsonKey(name: 'FileUrl') String fileUrl,
      @JsonKey(name: 'Phone') String phone});
}

/// @nodoc
class _$ProblemBackCopyWithImpl<$Res, $Val extends ProblemBack>
    implements $ProblemBackCopyWith<$Res> {
  _$ProblemBackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? sentAt = null,
    Object? type = null,
    Object? message = null,
    Object? location = null,
    Object? status = null,
    Object? fileUrl = null,
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProblemType,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationProblem,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProblemStatus,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProblemBackImplCopyWith<$Res>
    implements $ProblemBackCopyWith<$Res> {
  factory _$$ProblemBackImplCopyWith(
          _$ProblemBackImpl value, $Res Function(_$ProblemBackImpl) then) =
      __$$ProblemBackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'UserID') int userId,
      @JsonKey(name: 'SentAt') DateTime sentAt,
      @JsonKey(name: 'Type') ProblemType type,
      @JsonKey(name: 'Message') String message,
      @JsonKey(name: 'Location') LocationProblem location,
      @JsonKey(name: 'Status') ProblemStatus status,
      @JsonKey(name: 'FileUrl') String fileUrl,
      @JsonKey(name: 'Phone') String phone});
}

/// @nodoc
class __$$ProblemBackImplCopyWithImpl<$Res>
    extends _$ProblemBackCopyWithImpl<$Res, _$ProblemBackImpl>
    implements _$$ProblemBackImplCopyWith<$Res> {
  __$$ProblemBackImplCopyWithImpl(
      _$ProblemBackImpl _value, $Res Function(_$ProblemBackImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? sentAt = null,
    Object? type = null,
    Object? message = null,
    Object? location = null,
    Object? status = null,
    Object? fileUrl = null,
    Object? phone = null,
  }) {
    return _then(_$ProblemBackImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProblemType,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationProblem,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProblemStatus,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ProblemBackImpl extends _ProblemBack {
  const _$ProblemBackImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'UserID') required this.userId,
      @JsonKey(name: 'SentAt') required this.sentAt,
      @JsonKey(name: 'Type') required this.type,
      @JsonKey(name: 'Message') required this.message,
      @JsonKey(name: 'Location') required this.location,
      @JsonKey(name: 'Status') required this.status,
      @JsonKey(name: 'FileUrl') required this.fileUrl,
      @JsonKey(name: 'Phone') required this.phone})
      : super._();

  factory _$ProblemBackImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProblemBackImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'UserID')
  final int userId;
  @override
  @JsonKey(name: 'SentAt')
  final DateTime sentAt;
  @override
  @JsonKey(name: 'Type')
  final ProblemType type;
  @override
  @JsonKey(name: 'Message')
  final String message;
  @override
  @JsonKey(name: 'Location')
  final LocationProblem location;
  @override
  @JsonKey(name: 'Status')
  final ProblemStatus status;
  @override
  @JsonKey(name: 'FileUrl')
  final String fileUrl;
  @override
  @JsonKey(name: 'Phone')
  final String phone;

  @override
  String toString() {
    return 'ProblemBack(id: $id, userId: $userId, sentAt: $sentAt, type: $type, message: $message, location: $location, status: $status, fileUrl: $fileUrl, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProblemBackImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, sentAt, type,
      message, location, status, fileUrl, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProblemBackImplCopyWith<_$ProblemBackImpl> get copyWith =>
      __$$ProblemBackImplCopyWithImpl<_$ProblemBackImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProblemBackImplToJson(
      this,
    );
  }
}

abstract class _ProblemBack extends ProblemBack {
  const factory _ProblemBack(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'UserID') required final int userId,
      @JsonKey(name: 'SentAt') required final DateTime sentAt,
      @JsonKey(name: 'Type') required final ProblemType type,
      @JsonKey(name: 'Message') required final String message,
      @JsonKey(name: 'Location') required final LocationProblem location,
      @JsonKey(name: 'Status') required final ProblemStatus status,
      @JsonKey(name: 'FileUrl') required final String fileUrl,
      @JsonKey(name: 'Phone') required final String phone}) = _$ProblemBackImpl;
  const _ProblemBack._() : super._();

  factory _ProblemBack.fromJson(Map<String, dynamic> json) =
      _$ProblemBackImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'UserID')
  int get userId;
  @override
  @JsonKey(name: 'SentAt')
  DateTime get sentAt;
  @override
  @JsonKey(name: 'Type')
  ProblemType get type;
  @override
  @JsonKey(name: 'Message')
  String get message;
  @override
  @JsonKey(name: 'Location')
  LocationProblem get location;
  @override
  @JsonKey(name: 'Status')
  ProblemStatus get status;
  @override
  @JsonKey(name: 'FileUrl')
  String get fileUrl;
  @override
  @JsonKey(name: 'Phone')
  String get phone;
  @override
  @JsonKey(ignore: true)
  _$$ProblemBackImplCopyWith<_$ProblemBackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
