part of takodana_engine;

/// A code node is a [SyntaxNode] that represents a line of code.
///
/// e.g. `print("Hello World")`
class CodeNode extends SyntaxNode {
  /// Creates a new [CodeNode].
  ///
  /// e.g. `print("Hello World")`
  CodeNode(String text) : super(text);
}
