part of takodana_engine;

/// LinkNode is a [SyntaxNode] that represents a link
///
/// e.g. `[donate](https://cutt.ly/A1JX87v)`
class LinkNode extends SyntaxNode {
  /// The url or file path of the link.
  ///
  /// ---
  ///
  /// - `[donate](https://cutt.ly/A1JX87v)`
  ///   - `https://cutt.ly/A1JX87v` is the url of the link.
  ///
  /// - `[donate](file:///home/user/Downloads/donate.pdf)`
  ///   - `file:///home/user/Downloads/donate.pdf` is the file path of the link.
  final String href;

  /// Creates a new [LinkNode].
  ///
  /// e.g. `[donate](https://cutt.ly/A1JX87v)`
  LinkNode(String text, {required this.href}) : super(text);

  @override
  String _paramsToString() => href;
}
