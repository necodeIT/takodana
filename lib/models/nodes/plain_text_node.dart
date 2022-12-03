part of takodana_engine;

/// PlainTextNode is a [SyntaxNode] that represents a plain text.
///
/// e.g. `Plain Text`
class PlainTextNode extends SyntaxNode {
  /// Creates a new [PlainTextNode].
  ///
  /// PlainTextNode is a [SyntaxNode] that represents a plain text.
  PlainTextNode(String text) : super(text);
}
