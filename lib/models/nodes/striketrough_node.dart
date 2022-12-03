part of takodana_engine;

/// StriketroughtNode is a [SyntaxNode] that represents a striketrough text.
///
/// e.g. `~~Catgirls do not exist~~`
class StriketroughNode extends SyntaxNode {
  /// Creates a new [StriketroughNode]
  ///
  /// e.g. `~~Catgirls do not exist~~`
  StriketroughNode(String text) : super(text);
}
