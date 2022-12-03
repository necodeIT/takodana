part of takodana_engine;

/// CaretNode is a [SyntaxNode] that represents a caret.
///
/// e.g. `x^2^`
class SuperScriptNode extends SyntaxNode {
  /// Creates a new [CaretNode].
  ///
  /// e.g. `x^2^`
  SuperScriptNode(String text) : super(text);
}
