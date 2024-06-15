// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'problem_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProblemResponse _$ProblemResponseFromJson(Map<String, dynamic> json) {
  return _ProblemResponse.fromJson(json);
}

/// @nodoc
mixin _$ProblemResponse {
  @JsonKey(name: 'TotalItemsCount')
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'Items')
  List<ProblemBack> get problems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProblemResponseCopyWith<ProblemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProblemResponseCopyWith<$Res> {
  factory $ProblemResponseCopyWith(
          ProblemResponse value, $Res Function(ProblemResponse) then) =
      _$ProblemResponseCopyWithImpl<$Res, ProblemResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TotalItemsCount') int totalCount,
      @JsonKey(name: 'Items') List<ProblemBack> problems});
}

/// @nodoc
class _$ProblemResponseCopyWithImpl<$Res, $Val extends ProblemResponse>
    implements $ProblemResponseCopyWith<$Res> {
  _$ProblemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? problems = null,
  }) {
    return _then(_value.copyWith(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      problems: null == problems
          ? _value.problems
          : problems // ignore: cast_nullable_to_non_nullable
              as List<ProblemBack>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProblemResponseImplCopyWith<$Res>
    implements $ProblemResponseCopyWith<$Res> {
  factory _$$ProblemResponseImplCopyWith(_$ProblemResponseImpl value,
          $Res Function(_$ProblemResponseImpl) then) =
      __$$ProblemResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TotalItemsCount') int totalCount,
      @JsonKey(name: 'Items') List<ProblemBack> problems});
}

/// @nodoc
class __$$ProblemResponseImplCopyWithImpl<$Res>
    extends _$ProblemResponseCopyWithImpl<$Res, _$ProblemResponseImpl>
    implements _$$ProblemResponseImplCopyWith<$Res> {
  __$$ProblemResponseImplCopyWithImpl(
      _$ProblemResponseImpl _value, $Res Function(_$ProblemResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? problems = null,
  }) {
    return _then(_$ProblemResponseImpl(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      problems: null == problems
          ? _value._problems
          : problems // ignore: cast_nullable_to_non_nullable
              as List<ProblemBack>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ProblemResponseImpl extends _ProblemResponse {
  const _$ProblemResponseImpl(
      {@JsonKey(name: 'TotalItemsCount') required this.totalCount,
      @JsonKey(name: 'Items') required final List<ProblemBack> problems})
      : _problems = problems,
        super._();

  factory _$ProblemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProblemResponseImplFromJson(json);

  @override
  @JsonKey(name: 'TotalItemsCount')
  final int totalCount;
  final List<ProblemBack> _problems;
  @override
  @JsonKey(name: 'Items')
  List<ProblemBack> get problems {
    if (_problems is EqualUnmodifiableListView) return _problems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_problems);
  }

  @override
  String toString() {
    return 'ProblemResponse(totalCount: $totalCount, problems: $problems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProblemResponseImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality().equals(other._problems, _problems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalCount, const DeepCollectionEquality().hash(_problems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProblemResponseImplCopyWith<_$ProblemResponseImpl> get copyWith =>
      __$$ProblemResponseImplCopyWithImpl<_$ProblemResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProblemResponseImplToJson(
      this,
    );
  }
}

abstract class _ProblemResponse extends ProblemResponse {
  const factory _ProblemResponse(
          {@JsonKey(name: 'TotalItemsCount') required final int totalCount,
          @JsonKey(name: 'Items') required final List<ProblemBack> problems}) =
      _$ProblemResponseImpl;
  const _ProblemResponse._() : super._();

  factory _ProblemResponse.fromJson(Map<String, dynamic> json) =
      _$ProblemResponseImpl.fromJson;

  @override
  @JsonKey(name: 'TotalItemsCount')
  int get totalCount;
  @override
  @JsonKey(name: 'Items')
  List<ProblemBack> get problems;
  @override
  @JsonKey(ignore: true)
  _$$ProblemResponseImplCopyWith<_$ProblemResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
