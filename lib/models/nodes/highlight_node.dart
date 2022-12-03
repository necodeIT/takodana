part of takodana_engine;

/// HighlightNode is a [SyntaxNode] that represents a highlighted text.
///
/// e.g. `==Highlighted Text==`
class HighlightNode extends SyntaxNode {
  /// Creates a new [HighlightNode].
  ///
  /// e.g. `==Highlighted Text==`
  HighlightNode(String text) : super(text);
}
