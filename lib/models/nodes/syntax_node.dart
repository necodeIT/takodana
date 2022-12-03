part of takodana_engine;

/// A node in the abstract syntax tree.
///
/// This is the base class for all nodes in the abstract syntax tree.
/// The abstract syntax tree is a tree of nodes that represent the structure of the document.
///
/// Override this class to create nodes that represent specific types of syntax.
/// For example, [BoldNode] is used to represent bold text.
abstract class SyntaxNode {
  /// The parent node of this node.
  SyntaxNode? _parent;

  /// The children of this node.
  final List<SyntaxNode> children;

  /// The text of this node.
  final String text;

  /// Whether this node is the root node of the tree.
  final bool _isRoot;

  /// Creates a new [SyntaxNode].
  SyntaxNode(this.text, [this._isRoot = false]) : children = [];

  /// Creates a new root node.
  ///
  /// Root nodes are the top-level nodes in the tree.
  /// They have no parent and no text.
  static SyntaxNode root() => _RootNode();

  /// The parent node of this node.
  ///
  /// Throws if this node is the root node.
  SyntaxNode get parent => _parent!;

  /// Whether this node is the root node of the tree.
  bool get isRoot => _isRoot;

  /// Returns the root node of the tree.
  SyntaxNode findRoot() => isRoot ? this : parent.findRoot();

  StringBuffer _toStringRecursive([int depth = 0, StringBuffer? buffer]) {
    buffer ??= StringBuffer();

    buffer.write("    " * depth);

    var params = _paramsToString();

    buffer.writeln('$runtimeType${params.isNotEmpty ? '<$params>' : ''}${text.isNotEmpty ? '::$text' : ''}');

    for (final child in children) {
      child._toStringRecursive(depth + 1, buffer);
    }

    return buffer;
  }

  /// Adds a [child] to this node.
  SyntaxNode addChild(SyntaxNode child) {
    children.add(child);
    child._parent = this;

    return child;
  }

  /// Adds a [sibling] to this node.
  SyntaxNode addSibling(SyntaxNode sibling) {
    if (isRoot) throw Exception("Cannot add a sibling to the root node.");

    parent.addChild(sibling);
    sibling._parent = parent;

    return sibling;
  }

  String _paramsToString() => "";

  @override
  String toString() => _toStringRecursive().toString();
}

class _RootNode extends SyntaxNode {
  _RootNode() : super("", true);
}
