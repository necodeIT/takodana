part of takodana_engine;

/// BulletNode is a [SyntaxNode] that represents a bulletpoint.
///
/// e.g. `- bulletpoint` or `* bulletpoint`
class BulletNode extends MetaNode {
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
  BulletNode({required this.level}) : super();

  @override
  String _paramsToString() => level.toString();
}
