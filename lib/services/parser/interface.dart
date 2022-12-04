part of takodana_engine;

/// Parses a list of [Token]s into an abstract syntax tree (AST).
///
/// Returns the root.
abstract class IParserService {
  /// Parses a list of [Token]s into an abstract syntax tree (AST).
  ///
  /// Returns the root.
  SyntaxNode parse(List<Token> tokens, [SyntaxNode? root]);
}
