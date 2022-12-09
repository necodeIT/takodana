part of takodana_engine;

/// ImageNode is a [SyntaxNode] that represents a image
///
/// e.g. `![](https://cutt.ly/v1JC3no)`
class ImageNode extends SyntaxNode {
  /// The src of the image
  /// e.g. `[img](https://cutt.ly/v1JC3no)`
  /// where `https://cutt.ly/v1JC3no` is the src
  final String src;

  /// Creates a new [ImageNode].
  ///
  /// e.g. `![img](https://cutt.ly/v1JC3no)`
  ImageNode(String text, {required this.src}) : super(text);

  @override
  String _paramsToString() => src;
}
