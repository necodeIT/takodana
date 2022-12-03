part of takodana_engine;

/// BoldNode is a [SyntaxNode] that represents a bold text.
///
/// e.g. `**Bold Text**`
class BoldNode extends SyntaxNode {
  /// Creates a new [BoldNode].
  ///
  /// e.g. `**Bold Text**`
  BoldNode(String text) : super(text);
}
