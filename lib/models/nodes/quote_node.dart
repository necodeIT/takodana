part of takodana_engine;

/// QuoteNode is a [Syntaxnode] that represents a quote.
///
/// e.g. `> We're no strangers to love`
class QuoteNode extends SyntaxNode {
  /// Creates a new [QuoteNode]
  ///
  /// e.g. `> We're no strangers to love`
  QuoteNode(String text) : super(text);
}
