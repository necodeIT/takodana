part of takodana_engine;

/// HeaderNode is a [SyntaxNode] that represents a header.
///
/// e.g. `# Header 1`
class HeaderNode extends SyntaxNode {
  /// The level of the header.
  ///
  /// e.g. `# Header 1` has a level of 1. `## Header 2` has a level of 2.
  ///
  final int level;

  /// Creates a new [HeaderNode].
  ///
  /// e.g. `# Header 1`
  HeaderNode(String text, this.level) : super(text);

  @override
  String _paramsToString() => level.toString();
}
