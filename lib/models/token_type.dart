part of takodana_engine;

/// Represents different types of tokens.
enum TokenType {
  /// A token that contais a siple text string.
  ///
  /// e.g. `Hello World`
  text,

  /// A token that is a star (`*`) character.
  ///
  /// Used for italics and bold text.
  star,

  /// A token that is an open bracket (`[`) character.
  openBracket,

  /// A token that is a closed bracket (`]`) character.
  closeBracket,

  /// A token that is an open parenthesis (`(`) character.
  openParenthesis,

  /// A token that is a closed parenthesis (`)`) character.
  closeParenthesis,

  /// A token that is a
  openCurlyBracket,

  /// A token that is a (`}`) character.
  closeCurlyBracket,

  /// A token that is a equals sign (`=`) character.
  ///
  /// Used for highlighting.
  highlight,

  /// A token that is a header (`#`) character.
  ///
  /// Acceptable values are: `#`, `##`, `###`, `####`, `#####`, `######`
  ///
  /// Used for headers.
  header,

  /// A token that is a line break (`\n`) character.
  newLine,

  /// A token that is a bullet (`-`) character.
  ///
  /// Used for unorderd lists.
  bullet,

  /// A token that contains a list number (`1.`).
  ///
  /// Used for ordered lists.
  listNumber,

  /// A token that is a fence (`` ` ``) character.
  ///
  /// Acceptable values are: `` ` ``, `` ``` ``
  ///
  /// Used for code blocks (inline and multiline).
  fence,

  /// A token that is quote (`>`) character.
  ///
  /// Used for quotes.
  quote,

  /// A token that is a tilde (`~`) character.
  ///
  /// Used for strikethrough (`~~`) or subscript (`~`).
  tilde,

  /// A token that is a caret (`^`) character.
  ///
  /// Used for superscript (`^`).
  caret,

  /// A token that is whitespace (` `) character.
  ///
  /// Used for indentation.
  space,

  /// A token that is a tab (`\t`) character.
  tab
}
