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

  /// A token that is a bracket (`[`) character.
  ///
  /// Acceptable values are: `[`, `]`, `(`, `)`,
  ///
  /// Used for links.
  bracket,

  /// A token that is an equal sign (`==`).
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
  /// Acceptable values are:
  ///   - For unordered lists
  ///     - `-`, `*`
  ///   - For ordered lists
  ///     - `1.`, `2.`, `3.`, `4.`, `5.`, `6.`, `7.`, `8.`, `9.`, `10.`, ...
  ///
  /// Used for lists.
  bullet,

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
}
