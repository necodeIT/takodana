import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:takodana_engine/takodana_engine.dart';

part 'token.freezed.dart';
part 'token.g.dart';

@freezed

/// A token is a single unit of text that is parsed by the engine.
///
/// This may be a single character, a word, or a phrase.
///
/// Tokens are used to build the abstract syntax tree.
class Token with _$Token {
  const Token._();

  /// A token is a single unit of text that is parsed by the engine.
  ///
  /// This may be a single character, a word, or a phrase.
  ///
  /// Tokens are used to build the abstract syntax tree.
  factory Token({
    /// The string value of this token.
    required String value,

    /// The type of this token.
    required TokenType type,
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
