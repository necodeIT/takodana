part of takodana_engine;

/// SubscriptNode is a [SyntaxNode] that represents a subscript text.
///
/// e.g. `H~2~O`
class SubscriptNode extends SyntaxNode {
  /// Creates a new [SubscriptNode].
  ///
  /// e.g. `H~2~O`
  SubscriptNode(String text) : super(text);
}
