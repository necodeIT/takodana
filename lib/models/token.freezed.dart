// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Token _$TokenFromJson(Map<String, dynamic> json) {
  return _Token.fromJson(json);
}

/// @nodoc
mixin _$Token {
  /// The string value of this token.
  String get value => throw _privateConstructorUsedError;

  /// The type of this token.
  TokenType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenCopyWith<Token> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenCopyWith<$Res> {
  factory $TokenCopyWith(Token value, $Res Function(Token) then) =
      _$TokenCopyWithImpl<$Res, Token>;
  @useResult
  $Res call({String value, TokenType type});
}

/// @nodoc
class _$TokenCopyWithImpl<$Res, $Val extends Token>
    implements $TokenCopyWith<$Res> {
  _$TokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TokenType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TokenCopyWith<$Res> implements $TokenCopyWith<$Res> {
  factory _$$_TokenCopyWith(_$_Token value, $Res Function(_$_Token) then) =
      __$$_TokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, TokenType type});
}

/// @nodoc
class __$$_TokenCopyWithImpl<$Res> extends _$TokenCopyWithImpl<$Res, _$_Token>
    implements _$$_TokenCopyWith<$Res> {
  __$$_TokenCopyWithImpl(_$_Token _value, $Res Function(_$_Token) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? type = null,
  }) {
    return _then(_$_Token(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TokenType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Token extends _Token {
  _$_Token({required this.value, required this.type}) : super._();

  factory _$_Token.fromJson(Map<String, dynamic> json) =>
      _$$_TokenFromJson(json);

  /// The string value of this token.
  @override
  final String value;

  /// The type of this token.
  @override
  final TokenType type;

  @override
  String toString() {
    return 'Token(value: $value, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Token &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenCopyWith<_$_Token> get copyWith =>
      __$$_TokenCopyWithImpl<_$_Token>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenToJson(
      this,
    );
  }
}

abstract class _Token extends Token {
  factory _Token({required final String value, required final TokenType type}) =
      _$_Token;
  _Token._() : super._();

  factory _Token.fromJson(Map<String, dynamic> json) = _$_Token.fromJson;

  @override

  /// The string value of this token.
  String get value;
  @override

  /// The type of this token.
  TokenType get type;
  @override
  @JsonKey(ignore: true)
  _$$_TokenCopyWith<_$_Token> get copyWith =>
      throw _privateConstructorUsedError;
}
