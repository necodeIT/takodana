part of takodana_engine;

/// ItalicNode is a [SyntaxNode] that represents a italic text.
///
/// e.g. `*Italic Text*`
class ItalicNode extends SyntaxNode {
  /// Creates a new [ItalicNode].
  ///
  /// e.g. `*Italic Text*`
  ItalicNode(String text) : super(text);
}
