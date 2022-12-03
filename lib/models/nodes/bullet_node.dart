part of takodana_engine;

/// BulletNode is a [SyntaxNode] that represents a bulletpoint.
///
/// e.g. `- bulletpoint` or `* bulletpoint`
class BulletNode extends SyntaxNode {
  /// The level of the bulletpoint
  ///
  /// ---
  ///
  ///
  ///
  ///      - bulletpoint has a level of 1.
  ///
  ///         - bulletpoint has a level of 2.
  final int level;

  /// Creates a new [BulletNode]
  ///
  /// e.g. `- bulletpoint` or `* bulletpoint`
  BulletNode(String text, {required this.level}) : super(text);

  @override
  String _paramsToString() => level.toString();
}
