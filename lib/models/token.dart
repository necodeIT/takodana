part of takodana_engine;

/// A token is a single unit of text that is parsed by the engine.
///
/// This may be a single character, a word, or a phrase.
///
/// Tokens are used to build the abstract syntax tree.
class Token {
  /// The string value of this token.
  final String value;

  /// The type of this token.
  final TokenType type;

  /// A token is a single unit of text that is parsed by the engine.
  ///
  /// This may be a single character, a word, or a phrase.
  ///
  /// Tokens are used to build the abstract syntax tree.
  Token({required this.value, required this.type});

  /// Whether [this] token is of [TokenType.header].
  bool get isHeader => type == TokenType.header;

  /// Whether [this] token is of [TokenType.star].
  bool get isStar => type == TokenType.star;

  /// Whether [this] token is of [TokenType.underscore].
  bool get isUnderscore => type == TokenType.underscore;

  /// Whether [this] token is of [TokenType.caret].
  bool get isCaret => type == TokenType.caret;

  /// Whether [this] token is of [TokenType.tilde].
  bool get isTilde => type == TokenType.tilde;

  /// Whether [this] token is of [TokenType.openBracket].
  bool get isOpenBracket => type == TokenType.openBracket;

  /// Whether [this] token is of [TokenType.closeBracket].
  bool get isCloseBracket => type == TokenType.closeBracket;

  /// Whether [this] token is of [TokenType.openParenthesis].
  bool get isOpenParenthesis => type == TokenType.openParenthesis;

  /// Whether [this] token is of [TokenType.closeParenthesis].
  bool get isCloseParenthesis => type == TokenType.closeParenthesis;

  /// Whether [this] token is of [TokenType.openCurlyBracket].
  bool get isOpenCurlyBracket => type == TokenType.openCurlyBracket;

  /// Whether [this] token is of [TokenType.closeCurlyBracket].
  bool get isCloseCurlyBracket => type == TokenType.closeCurlyBracket;

  /// Whether [this] token is of [TokenType.highlight].
  bool get isHighlight => type == TokenType.highlight;

  /// Whether [this] token is of [TokenType.hyphen].
  bool get isHyphen => type == TokenType.hyphen;

  /// Whether [this] token is of [TokenType.exclamation].
  bool get isExclamation => type == TokenType.exclamation;

  /// Whether [this] token is of [TokenType.space].
  bool get isSpace => type == TokenType.space;

  /// Whether [this] token is of [TokenType.quote].
  bool get isQuote => type == TokenType.quote;

  /// Whether [this] token is of [TokenType.backtick].
  bool get isBacktick => type == TokenType.backtick;

  /// Whether [this] token is of [TokenType.newLine].
  bool get isNewLine => type == TokenType.newLine;

  /// Whether [this] token is of [TokenType.text].
  bool get isText => type == TokenType.text;

  @override
  String toString() => '<type: :$type, value: :$value>';
}
