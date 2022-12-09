part of takodana_engine;

/// OrderListItemNode is a [SyntaxNode] that represents a ordered list item.
///
/// e.g. `1. ordered list item`
class OrderdListItemNode extends SyntaxNode {
  /// The level of the ordered list item
  ///
  /// - `1. ordered list item` has a level of 1.
  /// - `1.1. ordered list item` has a level of 2.
  final int level;

  /// The number of the ordered list item
  ///
  /// - `1. ordered list item` has a number of 1.
  /// - `2. ordered list item` has a number of 2.
  final int number;

  /// Creates a new [OrderListItemNode].
  ///
  /// e.g. `1. ordered list item`
  OrderdListItemNode(String text, {required this.level, required this.number, required}) : super(text);

  @override
  String _paramsToString() => '$level.$number';
}
